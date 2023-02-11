//
//  FollowerCell.swift
//  GitHubFollowers
//
//  Created by Kirill Karpovich on 30.01.23.
//

import UIKit

class FollowerCell: UICollectionViewCell {
    
    static let reuseID = String(describing: FollowerCell.self)
    
    let avatarImageView = GHFAvatarImageView(frame: .zero)
    let usernameLabel = GHFTitileLabel(textAlignment: .center, fontSize: 16)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        avatarImageView.image = Images.placeholder
    }
    
    func set(follower: Follower) {
        usernameLabel.text = follower.login
        avatarImageView.downloadImage(fromURL: follower.avatarUrl)
    }
        
    private func configure() {
        addSubviews(avatarImageView, usernameLabel)
        avatarImageView.contentMode = .scaleAspectFit
        let padding: CGFloat = 5
        
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            avatarImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            avatarImageView.heightAnchor.constraint(equalTo: avatarImageView.widthAnchor),
                        
            usernameLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 12),
            usernameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            usernameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
           
            usernameLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
}
