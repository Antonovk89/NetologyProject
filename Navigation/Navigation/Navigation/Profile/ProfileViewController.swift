//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Konstantin Antonov on 03.05.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let headerView = ProfileHeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        view.addSubview(headerView)
        headerView.backgroundColor = .lightGray
    }
    
    override func viewWillLayoutSubviews() {
        headerView.frame = view.safeAreaLayoutGuide.layoutFrame
    }
}
