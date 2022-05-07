//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Konstantin Antonov on 03.05.2022.
//

import UIKit

let headerView = ProfileHeaderView()

class ProfileViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeHeaderView()
        view.backgroundColor = .lightGray
    }
    private func makeHeaderView() {
        
        view.addSubview(headerView)
        
    }
    
    override func viewWillLayoutSubviews() {
        headerView.frame = view.safeAreaLayoutGuide.layoutFrame

    }
    
}
