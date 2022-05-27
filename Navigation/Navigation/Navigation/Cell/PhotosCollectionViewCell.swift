//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Konstantin Antonov on 21.05.2022.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    private var startingFrame: CGRect?
    private var zoomingImageView = UIImageView(frame: .zero)
    private var imageBackgroundView = UIView(frame: .zero)
    
    private lazy var imagePosition = photosImageView.layer.position
    private lazy var imageBounds = photosImageView.layer.bounds
    
    lazy var photosImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .black
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 0
        imageView.clipsToBounds = true
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    
    private lazy var closeButton:UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.alpha = 0.0
        button.setImage(UIImage(systemName: "xmark", withConfiguration: UIImage.SymbolConfiguration(pointSize: 40))?.withTintColor(.black, renderingMode: .alwaysOriginal), for: .normal)
        button.alpha = 0.0
        button.clipsToBounds = false
        button.addTarget(self, action: #selector(closeAvatarAction), for: .touchUpInside)
        button.isUserInteractionEnabled = false
        return button
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupBack()
        setupLayout()
        setupGestures()
        
    }
    
    func setupBack() {
        addSubview(imageBackgroundView)
    }
    
    func setupCloseButton() {
        addSubview(closeButton)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(_ photo: Photos) {
        photosImageView.image = photo.image
    }
    
    private func setupGestures() {
        let tapImageGesture = UITapGestureRecognizer(target: self, action: #selector(tapImageAction))
        photosImageView.addGestureRecognizer(tapImageGesture)
    }
    
    @objc func tapImageAction() {
        print("tap")
        self.startingFrame = photosImageView.superview?.convert(photosImageView.frame, to: nil)
                zoomingImageView = UIImageView(frame: startingFrame!)
                zoomingImageView.backgroundColor = .white
                zoomingImageView.image = photosImageView.image
                zoomingImageView.frame = photosImageView.frame
                zoomingImageView.contentMode = .scaleAspectFit
                if let keyWindow = UIApplication.shared.connectedScenes.compactMap({ $0 as? UIWindowScene }).flatMap({ $0.windows }).first(where: { $0.isKeyWindow }) {
                    imageBackgroundView = UIView(frame: keyWindow.frame)
                    imageBackgroundView.backgroundColor = .black
                    imageBackgroundView.alpha = 0.3
                    closeButton.isUserInteractionEnabled = true

                    setupBack()
                    setupCloseButton()
                    [imageBackgroundView,closeButton , zoomingImageView].forEach({keyWindow.addSubview($0)})

                    NSLayoutConstraint.activate([
                        self.closeButton.topAnchor.constraint(equalTo: self.imageBackgroundView.safeAreaLayoutGuide.topAnchor, constant: 16),
                        self.closeButton.trailingAnchor.constraint(equalTo:
                                                                    self.imageBackgroundView.safeAreaLayoutGuide.trailingAnchor, constant: -16),
                        self.closeButton.widthAnchor.constraint(equalToConstant: 40),
                        self.closeButton.heightAnchor.constraint(equalToConstant: 40)
                    ])

                    UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut) {
                        self.imageBackgroundView.alpha = 0.8

                        self.zoomingImageView.frame = CGRect(x: 0, y: 0, width: keyWindow.frame.width, height: self.imageBackgroundView.frame.height / 3)
                        self.zoomingImageView.center = keyWindow.center
                    } completion: { _ in }

                    UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut) {
                        self.closeButton.alpha = 1
                    } completion: { _ in }
                }
            }

    @objc private func closeAvatarAction() {
        UIView.animate(withDuration: 0.3,
                       delay: 0.0,
                       usingSpringWithDamping: 1.0,
                       initialSpringVelocity: 0.0,
                       options: .curveEaseInOut) {
            self.closeButton.alpha = 0
            self.closeButton.isUserInteractionEnabled = false
            self.zoomingImageView.frame = self.startingFrame!
            self.zoomingImageView.alpha = 0
        } completion: { _ in
            UIView.animate(withDuration: 0.5,
                           delay: 0.0) {
                self.imageBackgroundView.alpha = 0.0
                self.photosImageView.layer.position = self.imagePosition
                self.photosImageView.layer.bounds = self.imageBounds
                self.photosImageView.isUserInteractionEnabled = true
                self.layoutIfNeeded()
            }
        }
    }
    
    private func setupLayout() {
    
        [photosImageView] .forEach({contentView.addSubview($0)})
        
        NSLayoutConstraint.activate([
            photosImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            photosImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            photosImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            photosImageView.heightAnchor.constraint(equalTo: contentView.heightAnchor)
        ])
        
    }
}
