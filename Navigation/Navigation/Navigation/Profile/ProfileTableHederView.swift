//
//  ProfileTableHederView.swift
//  Navigation
//
//  Created by Konstantin Antonov on 16.05.2022.
//

import UIKit

class ProfileHeaderView: UIView {
    
    private var leadingProfileView = NSLayoutConstraint()
    private var topProfileView = NSLayoutConstraint()
    private var heightProfileView = NSLayoutConstraint()
    private var widthProfileView = NSLayoutConstraint()
    
    private lazy var avatarImagePosition = profileImage.layer.position
    private lazy var avatarImageBounds = profileImage.layer.bounds
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
        setupGestures()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var profileImage: UIImageView = {
        
        lazy var view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 3
        view.image = UIImage(named: "ProfileFoto")
        view.contentMode = .scaleToFill
        view.layer.cornerRadius = 60
        view.clipsToBounds = true
        view.isUserInteractionEnabled = true
        return view
    }()
    
    private lazy var profileBackgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = false
        view.backgroundColor = .black
        view.alpha = 0.0
        return view
    }()
    
    private lazy var textName: UILabel = {
        lazy var textName = UILabel()
        textName.translatesAutoresizingMaskIntoConstraints = false
        textName.text = "Raoul Duke"
        textName.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        textName.textColor = .black
        return textName
    }()
    
    private lazy var textStatus: UITextField = {
        lazy var textStatus = UITextField()
        textStatus.translatesAutoresizingMaskIntoConstraints = false
        textStatus.placeholder = "Waiting for something..."
        textStatus.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return textStatus
    }()
    
    private lazy var setupStatusButton:UIButton = {
        lazy var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .blue
        button.layer.cornerRadius = 15
        button.setTitle("Show status", for: .normal)
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()
    @objc func buttonPressed() {
        if textStatus.text == "" {
            textStatus.shake()
        } else {
            print((textStatus.text)!)
        }
    }
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
    
    private func setupGestures() {
        let tapAvatarGesture = UITapGestureRecognizer(target: self, action: #selector(tapAvatarAction))
        profileImage.addGestureRecognizer(tapAvatarGesture)
    }
    
    @objc func tapAvatarAction() {
        self.avatarImagePosition = self.profileImage.layer.position
        self.avatarImageBounds = self.profileImage.layer.bounds
        
        UIImageView.animate(withDuration: 0.5,
                            animations: {
            self.profileImage.center = CGPoint(x: UIScreen.main.bounds.midX, y: UIScreen.main.bounds.midY)
            self.profileBackgroundView.alpha = 0.8
            self.profileImage.layer.bounds = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
            self.profileImage.layer.cornerRadius = 0
            self.profileImage.layer.borderWidth = 0
            self.profileImage.isUserInteractionEnabled = false
            self.setupStatusButton.isUserInteractionEnabled = false
            self.textStatus.isUserInteractionEnabled = false
        },
                            completion: { _ in
            UIImageView.animate(withDuration: 0.3) {
                self.closeButton.alpha = 1
                self.closeButton.isUserInteractionEnabled = true
                self.layoutIfNeeded()
            }
        })
    }
    
    @objc private func closeAvatarAction() {
        UIView.animate(withDuration: 0.3,
                       delay: 0.0,
                       usingSpringWithDamping: 1.0,
                       initialSpringVelocity: 0.0,
                       options: .curveEaseInOut) {
            self.closeButton.alpha = 0
            self.closeButton.isUserInteractionEnabled = false
        } completion: { _ in
            UIView.animate(withDuration: 0.5,
                           delay: 0.0) {
                self.profileBackgroundView.alpha = 0.0
                self.profileImage.layer.position = self.avatarImagePosition
                self.profileImage.layer.bounds = self.avatarImageBounds
                self.profileImage.layer.cornerRadius = self.profileImage.bounds.width / 2
                self.profileImage.layer.borderWidth = 3
                self.profileImage.isUserInteractionEnabled = true
                self.setupStatusButton.isUserInteractionEnabled = true
                self.textStatus.isUserInteractionEnabled = true
                self.layoutIfNeeded()
            }
        }
    }
    
    private func layout() {
        
        [ textName, textStatus, setupStatusButton, profileBackgroundView, profileImage, closeButton].forEach {addSubview($0)}
        
        topProfileView = profileImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16)
        leadingProfileView = profileImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant:16)
        widthProfileView = profileImage.widthAnchor.constraint(equalToConstant: 120)
        heightProfileView = profileImage.heightAnchor.constraint(equalToConstant: 120)
        
        NSLayoutConstraint.activate([
            topProfileView, leadingProfileView, widthProfileView, heightProfileView,
        
            profileBackgroundView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            profileBackgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            profileBackgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            profileBackgroundView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height),
        
            textName.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 27),
            textName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            textName.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 16),
        
            textStatus.bottomAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: -18),
            textStatus.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            textStatus.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 16),
        
            setupStatusButton.topAnchor.constraint(equalTo: textStatus.bottomAnchor, constant: 32),
            setupStatusButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            setupStatusButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            setupStatusButton.heightAnchor.constraint(equalToConstant: 50),
        
            closeButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -32),
            closeButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 32)])
    }
    
}
// MARK: - UITextFieldDelegate

extension ProfileHeaderView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.endEditing(true)
        return true
    }
}

