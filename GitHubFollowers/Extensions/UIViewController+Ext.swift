//
//  UIViewController+Ext.swift
//  GitHubFollowers
//
//  Created by Kirill Karpovich on 29.01.23.
//

import UIKit

extension UIViewController {
    
    func presentGHFAlertOnMainThread(title: String, message: String, buttonTitle: String) {
        
        DispatchQueue.main.async {
            let alertVC = GHFAlertVC(alertTitle: title, message: message, buttonTitle: buttonTitle)
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle = .crossDissolve
            self.present(alertVC, animated: true)
        }
    }
}
