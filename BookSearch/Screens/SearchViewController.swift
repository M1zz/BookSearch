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
        if #available(iOS 13.0, *) {
            view.backgroundColor = .systemBackground
        } else {
            view.backgroundColor = .white
        }
        
        view.addSubviews(logoImageView, booknameTextField, searchActionButton)
        configureLogoImageView()
        configureTextField()
        configureSearchActionButton()
        createDismissKeyboardTapGusture()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        booknameTextField.text = ""
        navigationController?.isNavigationBarHidden = true
    }
    
    
    private func createDismissKeyboardTapGusture() {
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    
    
    @objc func pushBookListViewController() {
        guard isBooknameEntered else {
            presentBSAlertOnMainThread(title: "책 이름이 비어있습니다", message: "책 이름을 넣어주세요", buttonTitle: "확인")
            return
        }
        
        booknameTextField.resignFirstResponder()
        
        let bookListViewController = BookListViewController(bookname: booknameTextField.text!)
        navigationController?.pushViewController(bookListViewController, animated: true)
    }
    
    
    private func configureLogoImageView() {
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        logoImageView.image = Images.bsLogo
        
        var imageViewTopAnchor: NSLayoutYAxisAnchor
        if #available(iOS 11.0, *) {
            imageViewTopAnchor = view.safeAreaLayoutGuide.topAnchor
        } else {
            imageViewTopAnchor = view.topAnchor
        }
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: imageViewTopAnchor, constant: 80),
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
        var searchActionButtonBottomAnchor: NSLayoutYAxisAnchor
        if #available(iOS 11.0, *) {
            searchActionButtonBottomAnchor = view.safeAreaLayoutGuide.bottomAnchor
        } else {
            searchActionButtonBottomAnchor = view.bottomAnchor
        }
        
        NSLayoutConstraint.activate([
            searchActionButton.bottomAnchor.constraint(equalTo: searchActionButtonBottomAnchor, constant: -padding),
            searchActionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            searchActionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            searchActionButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}


extension SearchViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        pushBookListViewController()
        return true
    }
}
