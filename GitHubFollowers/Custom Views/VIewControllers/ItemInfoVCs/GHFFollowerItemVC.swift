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
        actionButton.set(color: .systemGreen, title: "Get followers", systemImageName: "person.3")
    }
    
    override func actionButtonTapped() {
        delegate.didTapGetFollowers(for: user)
    }    
}
