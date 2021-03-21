//
//  String+Ext.swift
//  BookSearch
//
//  Created by 이현호 on 2021/03/21.
//

import Foundation

extension String {
    func localized(bundle: Bundle = .main, tableName: String = "Localizable") -> String {
        return NSLocalizedString(self, tableName: tableName, value: "**\(self)**", comment: "")
    }

}
