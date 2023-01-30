//
//  FollowersListVC.swift
//  GitHubFollowers
//
//  Created by Kirill Karpovich on 28.01.23.
//

import UIKit

class FollowersListVC: UIViewController {
    
    var username: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .systemBackground
        NetworkManager.shared.getFollowers(for: username, page: 1) { followers, errorMsg in
            guard let followers = followers else {
                self.presentGHFAlertOnMainThread(title: "Bad stuff", message: errorMsg!.rawValue, buttonTitle: "OK")
                return
            }
            
            print("Followers.count = \(followers.count)")
            print(followers)
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true) 
    }
    



}
