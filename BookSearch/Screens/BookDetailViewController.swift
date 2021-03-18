//
//  BookDetailViewController.swift
//  BookSearch
//
//  Created by 이현호 on 2021/03/18.
//

import UIKit

class BookDetailViewController: UIViewController {

    var isbn13: String!
    
    init(isbn13: String) {
        super.init(nibName: nil, bundle: nil)
        self.isbn13 = isbn13
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        // Do any additional setup after loading the view.
    }
}
