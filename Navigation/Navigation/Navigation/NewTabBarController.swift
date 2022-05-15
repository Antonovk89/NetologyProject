//
//  NewTabBarController.swift
//  Navigation
//
//  Created by Konstantin Antonov on 03.05.2022.
//

import UIKit

class NewTabBarController: UITabBarController {
    lazy var feedVC = FeedViewController()
    lazy var profileVC = LogInViewController()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupControllers()
        self.tabBar.unselectedItemTintColor = .lightGray
        self.tabBar.tintColor = .blue
        self.tabBar.backgroundColor = .white
    }
    
    private func setupControllers() {
        
        lazy var feedNC = UINavigationController(rootViewController: feedVC)
        lazy var profileNC = UINavigationController(rootViewController: profileVC)
        
        profileVC.tabBarItem.image = UIImage(systemName: "person.crop.rectangle")
        profileVC.tabBarItem.title = "Профиль"
        profileVC.navigationItem.title = "Профиль"
        
        feedVC.tabBarItem.image = UIImage(systemName: "newspaper.fill")
        feedVC.tabBarItem.title = "Лента"
        feedVC.navigationItem.title = "Лента"
        
        viewControllers = [profileNC, feedNC]
    }
}
