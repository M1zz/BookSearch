//
//  UIView+Ext.swift
//  BookSearch
//
//  Created by 이현호 on 2021/03/19.
//

import UIKit

extension UIView {
    
    func pintoEdges(of superview: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: superview.topAnchor),
            leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            trailingAnchor.constraint(equalTo: superview.trailingAnchor),
            bottomAnchor.constraint(equalTo: superview.bottomAnchor)
        ])
    }

    
    func addSubviews(_ views: UIView...) {
        for view in views { addSubview(view) }
    }
}
