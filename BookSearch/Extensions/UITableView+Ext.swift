//
//  UITableView+Ext.swift
//  BookSearch
//
//  Created by 이현호 on 2021/03/19.
//

import UIKit

extension UITableView {
    
    func removeExcessCells() {
        tableFooterView = UIView(frame: .zero)
    }
}
