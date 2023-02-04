//
//  GHFFollowerItemVC.swift
//  GitHubFollowers
//
//  Created by Kirill Karpovich on 3.02.23.
//

import UIKit    

class GHFFollowerItemVC: GHFItemVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    private func configureItems() {
        itemInfoViewOne.set(itemInfoType: .followers, withCount: user.followers)
        itemInfoViewTwo.set(itemInfoType: .following, withCount: user.following)
        actionButton.set(backgroundColor: .systemGreen, title: "Get followers")
    }
    
    override func actionButtonTapped() {
        delegate.didTapGetFollowers(for: user)
    }    
}
