//
//  GHFDataLoadingVC.swift
//  GitHubFollowers
//
//  Created by Kirill Karpovich on 8.02.23.
//

import UIKit

class GHFDataLoadingVC: UIViewController {
    
    private let containerView: UIView = UIView()
    
    func showLoadingView() {
        containerView.frame = view.bounds
        view.addSubview(containerView)
        
        containerView.backgroundColor = .systemBackground
        containerView.alpha = 0
        
        UIView.animate(withDuration: 0.25, delay: .zero, options: .curveEaseOut) {
            self.containerView.alpha = 0.8
        }
       
        let activityIndicator = UIActivityIndicatorView(style: .large)
        containerView.addSubview(activityIndicator)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: containerView.centerYAnchor)
        ])
        activityIndicator.startAnimating()
    }
    
    func dismissLoadingView() {
        DispatchQueue.main.async {
            self.containerView.removeFromSuperview()
        }
    }
    
    func showEmptyStateView(with message:String, in view:UIView) {
        let emptyStateView = GHFEmptyStateView(message: message)
        emptyStateView.frame = view.bounds
        view.addSubview(emptyStateView)
    }
}
