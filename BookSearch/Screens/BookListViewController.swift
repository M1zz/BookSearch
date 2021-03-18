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
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    
    private func configureViewController() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}
