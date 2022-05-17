//
//  ProfileTableHederView.swift
//  Navigation
//
//  Created by Konstantin Antonov on 16.05.2022.
//

import UIKit

class ProfileHeaderView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupTextName()
        setupTextStatus()
        makeShowStatusButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.addSubview(imageView)
        imageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
        imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant:16).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 120).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 120).isActive = true
    }
    
    private lazy var imageView: UIImageView = {
        
        lazy var view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 3
        view.image = UIImage(named: "ProfileFoto")
        view.contentMode = .scaleToFill
        view.layer.cornerRadius = 60
        view.clipsToBounds = true
        return view
    }()
    
    func setupTextName() {
        self.addSubview(textName)
        textName.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 27).isActive = true
        textName.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
        textName.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 16).isActive = true
    }
    
    private lazy var textName: UILabel = {
        lazy var textName = UILabel()
        textName.translatesAutoresizingMaskIntoConstraints = false
        textName.text = "Raoul Duke"
        textName.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        textName.textColor = .black
        return textName
    }()
    
    func setupTextStatus(){
        self.addSubview(textStatus)
        textStatus.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -18).isActive = true
        textStatus.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
        textStatus.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 16).isActive = true
    }
    
    private lazy var textStatus: UITextField = {
        lazy var textStatus = UITextField()
        textStatus.translatesAutoresizingMaskIntoConstraints = false
        textStatus.placeholder = "Waiting for something..."
        textStatus.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return textStatus
    }()
    
    func makeShowStatusButton() {
        self.addSubview(setupStatusButton)
        setupStatusButton.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 16).isActive = true
        setupStatusButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
        setupStatusButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
        setupStatusButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
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
        print((textStatus.text)!)
    }
}
// MARK: - UITextFieldDelegate

extension ProfileHeaderView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.endEditing(true)
        return true
    }
}

