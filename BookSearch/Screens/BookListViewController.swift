//
//  BookListViewController.swift
//  BookSearch
//
//  Created by 이현호 on 2021/03/18.
//

import UIKit

class BookListViewController: UIViewController {

    var bookname: String!
    

    init(bookname: String) {
        super.init(nibName: nil, bundle: nil)
        self.bookname = bookname
        title = bookname
        print(bookname)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewController()
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
    
    private func getBookLists(bookname: String, page: Int) {
        NetworkManager.shared.getBookLists(for: bookname, page: page) { [weak self] result in
            guard self != nil else { return }
            
            switch result {
            case .success(let books):
                //self.updateUI(with: followers)
                print(books)
            case .failure(let error):
                //self.presentGFAlertOnMainThread(title: "문제가 생겼습니다.", message: error.rawValue, buttonTitle: "Ok")
                print(error.rawValue)
            }
        }
    }
}
