//
//  PostViewController.swift
//  Navigation
//
//  Created by Konstantin Antonov on 03.05.2022.
//

import UIKit

class PostViewController: UIViewController {
    
    var titlePost: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        self.navigationItem.title = titlePost
        makeBarItem()
    }
    
    private func makeBarItem() {
        let barItem = UIBarButtonItem(title: "Информация", style: .plain, target: self, action: #selector(tapAction))
        navigationItem.rightBarButtonItem = barItem
    }
    @objc private func tapAction() {
        let vcInfo = InfoViewController()
        vcInfo.title = "Информация"
        present(vcInfo, animated: true)
    }
    
}
