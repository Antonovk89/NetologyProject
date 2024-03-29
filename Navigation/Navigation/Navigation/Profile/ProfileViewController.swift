//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Konstantin Antonov on 03.05.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var post:[Post] = Post.makePost()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CustomPostTableViewCell.self, forCellReuseIdentifier: CustomPostTableViewCell.identifire)
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: PhotosTableViewCell.identifire)
        return tableView
    }()
    
    private func layout() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
    }
    
    
}

// MARK: - UITableViewDataSourse

extension ProfileViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 1 : post.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: PhotosTableViewCell.identifire, for: indexPath) as!
            PhotosTableViewCell
            cell.selectionStyle = .none
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: CustomPostTableViewCell.identifire, for: indexPath) as! CustomPostTableViewCell
            cell.setupCell(post[indexPath.row])
            cell.selectionStyle = .none
            cell.postDelegate = self
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            self.navigationController?.pushViewController(PhotosViewController(), animated: true)
            self.navigationItem.backButtonTitle = "Back"
        } else { return
        }
    }
}

// MARK: - UITableViewDelegate

extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = ProfileHeaderView()
        return section == 0 ? header : nil
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 220 : 0
    }
}

//  MARK: - Delegate
protocol CustomPostTableViewCellDelegate {
    func addLikes(likesInLabel: String) -> String
    func showPhoto(viewsInLabel: String, postImage: UIImageView, postDescription: UILabel ) -> String
}

extension ProfileViewController: CustomPostTableViewCellDelegate {
    
    func showPhoto(viewsInLabel: String, postImage: UIImageView, postDescription: UILabel) -> String {
        
        let detailedPostVC = DetailedPostViewController()
        
        self.navigationController?.present(detailedPostVC, animated: true)
        detailedPostVC.postImageView.image = postImage.image
        detailedPostVC.descriptionLabel.text = postDescription.text
        
        func addViews(viewsInLabel: String) -> String {
            let views = (Int(viewsInLabel) ?? 0) + 1
            let viewsInLabel: String
            viewsInLabel = "\(views)"
            return viewsInLabel
        }
        return addViews(viewsInLabel: viewsInLabel)
    }
    
    @objc func dismissFullscreenImage(_ sender: UITapGestureRecognizer) {
        sender.view?.removeFromSuperview()
    }
    
    func addLikes(likesInLabel: String) -> String {
        let likes = (Int(likesInLabel) ?? 0) + 1
        let likesInLabel = "Likes:\(likes)"
        return likesInLabel
    }
}

