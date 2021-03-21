//
//  BSTextField.swift
//  BookSearch
//
//  Created by 이현호 on 2021/03/18.
//

import UIKit

class BSTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        
        layer.cornerRadius = 10
        layer.borderWidth = 2
        if #available(iOS 13.0, *) {
            layer.borderColor = UIColor.systemGray4.cgColor
        } else {
            layer.borderColor = UIColor.systemGray.cgColor
        }
        
        if #available(iOS 13.0, *) {
            textColor = .label
        } else {
            textColor = .black
        }
        if #available(iOS 13.0, *) {
            tintColor = .label
        } else {
            tintColor = .black
        }
        textAlignment = .center
        font = UIFont.preferredFont(forTextStyle: .title2)
        adjustsFontSizeToFitWidth = true
        minimumFontSize = 12
        
        if #available(iOS 13.0, *) {
            backgroundColor = .tertiarySystemBackground
        }
        autocorrectionType = .no
        returnKeyType = .go
        clearButtonMode = .whileEditing
        placeholder = "책 제목을 입력해주세요".localized()
    }
}
