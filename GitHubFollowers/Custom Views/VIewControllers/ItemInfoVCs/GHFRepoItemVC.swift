//
//  GHFRepoItemVC.swift
//  GitHubFollowers
//
//  Created by Kirill Karpovich on 3.02.23.
//

import UIKit

class GHFRepoItemVC: GHFItemVC {    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
        
    }
    
    private func configureItems() {
        itemInfoViewOne.set(itemInfoType: .repos, withCount: user.publicRepos)
        itemInfoViewTwo.set(itemInfoType: .gists, withCount: user.publicGists)
        actionButton.set(color: .systemPurple, title: "Github profile", systemImageName: "person")
    }
    
    override func actionButtonTapped() {
        delegate.didTapGithubProfile(for: user)
    }
}
