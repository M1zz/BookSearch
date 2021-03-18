//
//  SearchViewController.swift
//  BookSearch
//
//  Created by 이현호 on 2021/03/15.
//

import UIKit

class SearchViewController: UIViewController {

    let logoImageView = UIImageView()
    let booknameTextField = BSTextField()
    let searchActionButton = BSButton(backgroundColor: .systemPink, title: "검색")
    
    var isBooknameEntered: Bool { return !booknameTextField.text!.isEmpty }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        view.addSubview(logoImageView)
        view.addSubview(booknameTextField)
        view.addSubview(searchActionButton)
        
        configureLogoImageView()
        configureTextField()
        configureSearchActionButton()
        createDismissKeyboardTapGusture()
//        title = "검색"
//        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    
    func createDismissKeyboardTapGusture() {
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    
    
    @objc func pushBookListViewController() {
        guard isBooknameEntered else {
            print("Error!")
            return
        }
        
        booknameTextField.resignFirstResponder()
        
//        let bookListViewController = BookListViewController()
//        navigationController?.pushViewController(bookListViewController, animated: true)
    }
    
    
    private func configureLogoImageView() {
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        logoImageView.image = UIImage(named: "bookSearchLogo")
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 200),
            logoImageView.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    
    private func configureTextField() {
        let padding: CGFloat = 50
        
        booknameTextField.delegate = self
        NSLayoutConstraint.activate([
            booknameTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: padding),
            booknameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            booknameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            booknameTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    
    private func configureSearchActionButton() {
        searchActionButton.addTarget(self, action: #selector(pushBookListViewController), for: .touchUpInside)
        
        let padding: CGFloat = 50
        NSLayoutConstraint.activate([
            searchActionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -padding),
            searchActionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            searchActionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            searchActionButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}


extension SearchViewController: UITextFieldDelegate {
    
}
