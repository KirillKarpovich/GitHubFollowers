//
//  GHFEmptyStateView.swift
//  GitHubFollowers
//
//  Created by Kirill Karpovich on 1.02.23.
//

import UIKit

class GHFEmptyStateView: UIView {
    
    let titleLabel = GHFTitileLabel(textAlignment: .center, fontSize: 30)
    let logoImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(message: String) {
        self.init(frame: .zero)
        titleLabel.text = message
    }
    
    private func configure() {
        addSubviews(titleLabel, logoImageView)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.numberOfLines = 3
        titleLabel.textColor = .secondaryLabel
        
        logoImageView.image = Images.emptyStateLogo
        
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -150),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
            titleLabel.heightAnchor.constraint(equalToConstant: 200),
            
            logoImageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.3),
            logoImageView.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.3),
            logoImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 170),
            logoImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 40),
        ])
    }
}
