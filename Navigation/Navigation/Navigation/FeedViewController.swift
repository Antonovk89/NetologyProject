//
//  FeedViewController.swift
//  Navigation
//
//  Created by Konstantin Antonov on 03.05.2022.
//

import UIKit

class FeedViewController: UIViewController {
    lazy var post = Post(title: "Мой пост")
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        makeButton()
        
    }
    private func makeButton() {
        lazy var buttonPost = UIButton(frame:CGRect(x: 0, y: 0, width: 200, height: 40))
        buttonPost.center = view.center
        buttonPost.setTitle("Пост", for: .normal)
        buttonPost.backgroundColor = .gray
        buttonPost.layer.cornerRadius = 12
        buttonPost.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
        view.addSubview(buttonPost)
    }
    @objc private func tapAction() {
        lazy var vcPost = PostViewController()
        navigationController?.pushViewController(vcPost, animated: true)
        vcPost.titlePost = post.title
        
    }
}
