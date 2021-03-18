//
//  BookListViewController.swift
//  BookSearch
//
//  Created by 이현호 on 2021/03/18.
//

import UIKit

class BookListViewController: UIViewController {

    enum Section {
        case main
    }
    
    let tableView = UITableView()
    
    var bookname: String!
    var booklist: [Book] = []
    var hasMoreBook = true
    

    init(bookname: String) {
        super.init(nibName: nil, bundle: nil)
        self.bookname = bookname
        title = bookname
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewController()
        configureTableView()
        getBookLists(bookname: bookname, page: 1)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    
    private func configureViewController() {
        if #available(iOS 13.0, *) {
            view.backgroundColor = .systemBackground
        } else {
            view.backgroundColor = .white
        }
        
        if #available(iOS 11.0, *) {
            navigationController?.navigationBar.prefersLargeTitles = true
        }
    }
    
    
    private func configureTableView() {
        view.addSubview(tableView)
        
        tableView.frame = view.bounds
        tableView.rowHeight = 150
        tableView.delegate = self
        tableView.dataSource = self
//        if #available(iOS 13.0, *) {
//            tableView.backgroundColor = .systemBackground
//        } else {
//            tableView.backgroundColor = .white
//        }
        //tableView.removeExcessCells()
        tableView.register(BookCell.self, forCellReuseIdentifier: BookCell.reuseID)
    }
    
    private func getBookLists(bookname: String, page: Int) {
        NetworkManager.shared.getBookLists(for: bookname, page: page) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let booklist):
                self.updateUI(with: booklist)
                self.booklist = booklist
            case .failure(let error):
                //self.presentGFAlertOnMainThread(title: "문제가 생겼습니다.", message: error.rawValue, buttonTitle: "Ok")
                print(error.rawValue)
            }
        }
    }
    
    
    private func updateUI(with booklist: [Book]) {
        let maxCount = 100
        if booklist.count < maxCount { self.hasMoreBook = false }
        
        if booklist.isEmpty {
            // 검색 결과 없음
            return
        } else {
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.view.bringSubviewToFront(self.tableView)
            }
        }
    }
}


extension BookListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return booklist.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BookCell.reuseID) as! BookCell
        let book = booklist[indexPath.row]
        cell.set(book: book)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let book = booklist[indexPath.row]
        let destinationViewController = BookDetailViewController(isbn13: book.isbn13)
        
        navigationController?.pushViewController(destinationViewController, animated: true)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}
