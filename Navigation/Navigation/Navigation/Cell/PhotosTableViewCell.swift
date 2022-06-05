//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Konstantin Antonov on 20.05.2022.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {
    
    private let photosView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    private let photosLabel: UILabel = {
        let lable = UILabel()
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.text = "Photos"
        lable.textColor = .black
        lable.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        lable.numberOfLines = 1
        return lable
    }()
    
    private var arrowView: UIImageView = {
        let arrowImage = UIImageView()
        arrowImage.translatesAutoresizingMaskIntoConstraints = false
        arrowImage.image = UIImage(systemName: "arrow.right")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        arrowImage.sizeToFit()
        arrowImage.clipsToBounds = false
        return arrowImage
    }()
    
    private var stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.axis = .horizontal
        stack.spacing = 8
        stack.layer.cornerRadius = 6
        stack.backgroundColor = .white
        stack.clipsToBounds = true
        stack.layer.borderColor = UIColor.lightGray.cgColor
        return stack
    }()
    
    private var firstImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "image0")
        imageView.backgroundColor = .black
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 6
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private var secondImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "image1")
        imageView.backgroundColor = .black
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 6
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private var thirdImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "image2")
        imageView.backgroundColor = .black
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 6
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private var fourthImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "image3")
        imageView.backgroundColor = .black
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 6
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
        customizeCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func customizeCell() {
        photosView.layer.cornerRadius = 0
        photosView.layer.borderWidth = 0
        photosView.layer.borderColor = UIColor.black.cgColor
    }
    
    private func setupLayout() {
        let firstInset: CGFloat = 12
        let secondInset: CGFloat = 12
        
        [firstImageView, secondImageView, thirdImageView, fourthImageView].forEach { stackView.addArrangedSubview($0) }
        
        [photosView, photosLabel, arrowView, stackView].forEach { contentView.addSubview($0) }
        
        NSLayoutConstraint.activate([
            photosView.topAnchor.constraint(equalTo: contentView.topAnchor),
            photosView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            photosView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            photosView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        
            photosLabel.topAnchor.constraint(equalTo: photosView.topAnchor, constant: firstInset),
            photosLabel.leadingAnchor.constraint(equalTo: photosView.leadingAnchor, constant: firstInset),
            photosLabel.trailingAnchor.constraint(equalTo: photosView.trailingAnchor, constant: -firstInset),
        
            arrowView.topAnchor.constraint(equalTo: photosView.topAnchor, constant: firstInset),
            arrowView.centerYAnchor.constraint(equalTo: photosLabel.centerYAnchor),
            arrowView.trailingAnchor.constraint(equalTo: photosView.trailingAnchor, constant: -firstInset),
            arrowView.widthAnchor.constraint(equalToConstant: 24),
            arrowView.heightAnchor.constraint(equalToConstant: 28),
       
            stackView.topAnchor.constraint(equalTo: photosLabel.bottomAnchor, constant: firstInset),
            stackView.leadingAnchor.constraint(equalTo: photosView.leadingAnchor, constant: firstInset),
            stackView.trailingAnchor.constraint(equalTo: photosView.trailingAnchor, constant: -firstInset),
            stackView.heightAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width - (firstInset * 2 + secondInset * 3)) / 4),
            stackView.bottomAnchor.constraint(equalTo: photosView.bottomAnchor, constant: -firstInset)
        ])
    }
}
