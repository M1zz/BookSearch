//
//  BSAttibutedTextView.swift
//  BookSearch
//
//  Created by 이현호 on 2021/03/19.
//

import UIKit

class BSAttibutedTextView: UITextView {

    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure() {
        
    }
}
