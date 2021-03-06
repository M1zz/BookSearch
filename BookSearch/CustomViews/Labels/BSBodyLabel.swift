//
//  BSBodyLabel.swift
//  BookSearch
//
//  Created by 이현호 on 2021/03/18.
//

import UIKit

class BSBodyLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    convenience init(textAlignment: NSTextAlignment) {
        self.init(frame: .zero)
        self.textAlignment = textAlignment
    }
    
    
    private func configure() {
        if #available(iOS 13.0, *) {
            textColor = .secondaryLabel
        } else {
            textColor = .systemGray
        }
        font = UIFont.preferredFont(forTextStyle: .body)
        if #available(iOS 10.0, *) {
            adjustsFontForContentSizeCategory = true
        }
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.75
        lineBreakMode = .byTruncatingTail
        translatesAutoresizingMaskIntoConstraints = false
    }
}
