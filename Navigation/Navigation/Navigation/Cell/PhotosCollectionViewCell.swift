//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Konstantin Antonov on 21.05.2022.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    lazy var photosImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .black
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 0
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(_ photo: Photos) {
        photosImageView.image = photo.image
    }
    
    private func setupLayout() {
        contentView.addSubview(photosImageView)
        
        NSLayoutConstraint.activate([
            photosImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            photosImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            photosImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            photosImageView.heightAnchor.constraint(equalTo: contentView.heightAnchor)
        ])
    }
}

