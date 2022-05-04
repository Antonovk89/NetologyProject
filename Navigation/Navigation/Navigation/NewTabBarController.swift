//
//  NewTabBarController.swift
//  Navigation
//
//  Created by Konstantin Antonov on 03.05.2022.
//

import UIKit

class NewTabBarController: UITabBarController {
    let feedVC = FeedViewController()
    let profileVC = ProfileViewController()
    
   
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupControllers()
        self.tabBar.unselectedItemTintColor = .black
        self.tabBar.tintColor = .white
    }
    
    private func setupControllers() {
        
        let feedNC = UINavigationController(rootViewController: feedVC)
        let profileNC = UINavigationController(rootViewController: profileVC)
        
        
        profileVC.tabBarItem.image = UIImage(systemName: "person.crop.rectangle")
        profileVC.tabBarItem.title = "Профиль"
        profileVC.navigationItem.title = "Профиль"
        
        feedVC.tabBarItem.image = UIImage(systemName: "newspaper.fill")
        feedVC.tabBarItem.title = "Лента"
        feedVC.navigationItem.title = "Лента"
        
     
      
        
        viewControllers = [profileNC, feedNC]
    }
}
