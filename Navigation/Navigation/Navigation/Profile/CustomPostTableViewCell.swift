//
//  CustomPostTableViewCell.swift
//  Navigation
//
//  Created by Konstantin Antonov on 16.05.2022.
//

import UIKit

class CustomPostTableViewCell: UITableViewCell {
    
    private lazy var postView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var postAuthorLabel: UILabel = {
        let postAuthor = UILabel()
        postAuthor.translatesAutoresizingMaskIntoConstraints = false
        postAuthor.numberOfLines = 2
        postAuthor.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        postAuthor.textColor = .black
        return postAuthor
    }()
    
    private lazy var postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .black
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var postDescriptionLabel: UILabel = {
        let postDescription = UILabel()
        postDescription.translatesAutoresizingMaskIntoConstraints = false
        postDescription.textColor = .systemGray
        postDescription.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        postDescription.numberOfLines = 0
        return postDescription
    }()
    
    private lazy var postViewsLabel: UILabel = {
        let postViews = UILabel()
        postViews.translatesAutoresizingMaskIntoConstraints = false
        postViews.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        postViews.textColor = .black
        return postViews
    }()
    
    private lazy var postLikesLabel: UILabel = {
        let postLikes = UILabel()
        postLikes.translatesAutoresizingMaskIntoConstraints = false
        postLikes.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        postLikes.textColor = .black
        return postLikes
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(_ post: Post) {
        postAuthorLabel.text = post.author
        postImageView.image = post.image
        postDescriptionLabel.text = post.description
        postViewsLabel.text = "Views: \(post.views)"
        postLikesLabel.text = "Likes: \(post.likes)"
        
    }
    
    private func layout() {
        var screenWidth: CGFloat {
            return UIScreen.main.bounds.width
            
        }
        [postView, postAuthorLabel, postImageView, postDescriptionLabel, postViewsLabel, postLikesLabel].forEach {contentView.addSubview($0)}
        NSLayoutConstraint.activate([
            postView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor),
            postView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            postView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            postView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            postAuthorLabel.topAnchor.constraint(equalTo: postView.topAnchor, constant: 16),
            postAuthorLabel.leadingAnchor.constraint(equalTo: postView.leadingAnchor, constant: 16),
            postAuthorLabel.trailingAnchor.constraint(equalTo: postView.trailingAnchor, constant: -16),
            postAuthorLabel.bottomAnchor.constraint(equalTo: postImageView.topAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            postImageView.leadingAnchor.constraint(equalTo: postView.leadingAnchor),
            postImageView.trailingAnchor.constraint(equalTo: postView.trailingAnchor),
            postImageView.heightAnchor.constraint(equalToConstant: screenWidth),
            postImageView.widthAnchor.constraint(equalToConstant: screenWidth),
            postImageView.bottomAnchor.constraint(equalTo: postDescriptionLabel.topAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            postDescriptionLabel.topAnchor.constraint(equalTo: postImageView.bottomAnchor),
            postDescriptionLabel.leadingAnchor.constraint(equalTo: postView.leadingAnchor, constant: 16),
            postDescriptionLabel.trailingAnchor.constraint(equalTo: postView.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            postViewsLabel.topAnchor.constraint(equalTo: postDescriptionLabel.bottomAnchor, constant: 16),
            postViewsLabel.trailingAnchor.constraint(equalTo: postView.trailingAnchor, constant: -16),
            postViewsLabel.bottomAnchor.constraint(equalTo: postView.bottomAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            postLikesLabel.topAnchor.constraint(equalTo: postDescriptionLabel.bottomAnchor, constant: 16),
            postLikesLabel.leadingAnchor.constraint(equalTo: postView.leadingAnchor, constant: 16),
            postLikesLabel.bottomAnchor.constraint(equalTo: postView.bottomAnchor, constant: -16)
        ])
    }
}
