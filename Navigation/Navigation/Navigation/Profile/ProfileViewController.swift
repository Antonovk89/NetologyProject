//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Konstantin Antonov on 03.05.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let headerView = ProfileHeaderView()
    
    private func customHeaderView() {
        headerView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(monkeyJobButton)
        view.backgroundColor = .lightGray
        view.addSubview(headerView)
        customHeaderView()
        setMonkeyJobButton()
        headerView.backgroundColor = .lightGray
        headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        headerView.heightAnchor.constraint(equalToConstant: 220).isActive = true
        
    }
    private func setMonkeyJobButton() {
        monkeyJobButton.translatesAutoresizingMaskIntoConstraints = false
        monkeyJobButton.setTitle("Бесполезная кнопка", for: .normal)
        monkeyJobButton.backgroundColor = .blue
        monkeyJobButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        monkeyJobButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        monkeyJobButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
    }
    
    private lazy var monkeyJobButton : UIButton = {
        let monkeyJobButton = UIButton()
        return monkeyJobButton
    }()
}
