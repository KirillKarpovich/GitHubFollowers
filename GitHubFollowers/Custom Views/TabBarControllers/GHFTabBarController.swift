//
//  GHFTabBarController.swift
//  GitHubFollowers
//
//  Created by Kirill Karpovich on 7.02.23.
//

import UIKit

class GHFTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBar.appearance().tintColor = .systemGreen
        viewControllers = [createSearchNavigationController(), createFavoritesNavigationController()]

        // Do any additional setup after loading the view.
    }
    
    func createSearchNavigationController() -> UINavigationController {
        let searchVC = SearchVC()
        searchVC.title = "Search"
        searchVC.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        
        return UINavigationController(rootViewController: searchVC)
    }
        
    func createFavoritesNavigationController() -> UINavigationController {
        let favoritesListVC = FavoriteListVC()
        favoritesListVC.title = "Favorites"
        favoritesListVC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        
        return UINavigationController(rootViewController: favoritesListVC)
    }
    
    func createTabBar() -> UITabBarController {
        let tabBar = UITabBarController()
        
        return tabBar
    }
}
