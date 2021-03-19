//
//  UIViewController+Ext.swift
//  BookSearch
//
//  Created by 이현호 on 2021/03/19.
//

import UIKit

extension UIViewController {

    func presentBSAlertOnMainThread(title: String, message: String, buttonTitle: String) {
        DispatchQueue.main.async {
            let alertViewController = BSAlertViewController(title: title, message: message, buttonTitle: buttonTitle)
            alertViewController.modalPresentationStyle = .overFullScreen
            alertViewController.modalTransitionStyle = .crossDissolve
            self.present(alertViewController, animated: true)
        }
    }
}
