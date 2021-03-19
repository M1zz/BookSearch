//
//  BSEmptyStateView.swift
//  BookSearch
//
//  Created by 이현호 on 2021/03/19.
//

import UIKit

class BSEmptyStateView: UIView {
    let messageLabel = BSTitleLabel(textAlignment: .center, fontSize: 20)
    let logoImageView = UIImageView()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    convenience init(message: String) {
        self.init(frame: .zero)
        messageLabel.text = message
    }
    
    
    private func configure() {
        addSubview(messageLabel)
        addSubview(logoImageView)
        
        configureMessageLabel()
        configurelogoImageView()
    }
    
    
    private func configureMessageLabel() {
        messageLabel.numberOfLines = 3
        if #available(iOS 13.0, *) {
            messageLabel.textColor = .secondaryLabel
        } else {
            messageLabel.textColor = .gray
        }
        
        NSLayoutConstraint.activate([
            messageLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -150),
            messageLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            messageLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
            messageLabel.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    
    private func configurelogoImageView() {
        logoImageView.image = UIImage(named: "bookSearchLogo")
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
            
        NSLayoutConstraint.activate([
            logoImageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.7),
            logoImageView.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.7),
            logoImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            logoImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -150)
        ])
    }
}
