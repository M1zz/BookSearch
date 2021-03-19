//
//  BookDetailViewController.swift
//  BookSearch
//
//  Created by 이현호 on 2021/03/18.
//

import UIKit

final class BookDetailViewController: BSDataLoadingViewController {

    var isbn13: String!
    
    var bookDetailView = BookDetailView(frame: .zero)
    let scrollView = UIScrollView()
    let contentView = UIView()
    
    
    init(isbn13: String) {
        super.init(nibName: nil, bundle: nil)
        self.isbn13 = isbn13
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureScrollView()
        
        getBookDetail(for: isbn13)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
        if #available(iOS 11.0, *) {
            navigationController?.navigationBar.prefersLargeTitles = false
        }
    }
    
    
    private func configureBookDetailView() {
        bookDetailView.pintoEdges(of: scrollView)
        if #available(iOS 13.0, *) {
            bookDetailView.backgroundColor = .systemBackground
        } else {
            bookDetailView.backgroundColor = .white
        }

        NSLayoutConstraint.activate([
            bookDetailView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            bookDetailView.heightAnchor.constraint(equalToConstant: 1000)
        ])
    }
    
    
    private func configureScrollView() {
        view.addSubview(scrollView)
        scrollView.addSubview(bookDetailView)
        scrollView.pintoEdges(of: view)
        configureBookDetailView()
    }
    
    
    private func getBookDetail(for isbn13: String) {
        showLoadingView()
        NetworkManager.shared.getBookDetail(for: isbn13) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let bookDetail):
                DispatchQueue.main.async {
                    print("bookDetail : \(bookDetail)")
                    self.bookDetailView.set(with: bookDetail)
                    self.dissmissLoadingView()
                }
            case .failure(let error):
                self.presentBSAlertOnMainThread(title: "문제가 생겼습니다.", message: error.rawValue, buttonTitle: "Ok")
            }
        }
    }
}
