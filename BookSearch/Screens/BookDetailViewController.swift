//
//  BookDetailViewController.swift
//  BookSearch
//
//  Created by 이현호 on 2021/03/18.
//

import UIKit

class BookDetailViewController: UIViewController {

    var isbn13: String!
    
    var bookDetailView = BookDetailView(frame: .zero)
    
    init(isbn13: String) {
        super.init(nibName: nil, bundle: nil)
        self.isbn13 = isbn13
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getBookDetail(for: isbn13)
        configureBookDetailView()
    }
    
    
    private func configureBookDetailView() {
        view.addSubview(bookDetailView)
        bookDetailView.pintoEdges(of: view)
    }
    
    
    private func getBookDetail(for isbn13: String) {
        NetworkManager.shared.getBookDetail(for: isbn13) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let bookDetail):
                DispatchQueue.main.async {
                    print("bookDetail : \(bookDetail)")
                    self.bookDetailView.set(with: bookDetail)
                }
            case .failure(let error):
                print(error.rawValue)
            }
        }
    }
}
