//
//  GHFAlertContainerView.swift
//  GitHubFollowers
//
//  Created by Kirill Karpovich on 7.02.23.
//

import UIKit

class GHFAlertContainerView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemBackground
        layer.borderWidth = 2
        layer.cornerRadius = 16
        layer.borderColor = UIColor.white.cgColor
    }
}
