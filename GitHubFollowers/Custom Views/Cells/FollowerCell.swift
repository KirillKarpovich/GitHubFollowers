//
//  FollowerCell.swift
//  GitHubFollowers
//
//  Created by Kirill Karpovich on 30.01.23.
//

import UIKit

class FollowerCell: UICollectionViewCell {
    static let reuseID = "FollowerCell"
    
    let avatarImageView = GHFAvatarImageView(frame: .zero)
    let usernameLabel = GHFTitileLabel(textAlignment: .center, fontSize: 16)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func set(follower: Follower) {
        usernameLabel.text = follower.login
        avatarImageView.downloadImage(from: follower.avatarUrl)
    }
    
    
    private func configure() {
        addSubview(avatarImageView)
        addSubview(usernameLabel)
        avatarImageView.contentMode = .scaleAspectFit
        
        let padding:CGFloat = 5
        
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            avatarImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            avatarImageView.widthAnchor.constraint(equalToConstant: 100),
            avatarImageView.heightAnchor.constraint(equalTo: avatarImageView.widthAnchor),
            
            
            usernameLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 12),
            usernameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            usernameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
           
            usernameLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
}