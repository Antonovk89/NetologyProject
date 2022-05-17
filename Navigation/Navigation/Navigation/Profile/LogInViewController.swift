//
//  LogInViewController.swift
//  Navigation
//
//  Created by Konstantin Antonov on 14.05.2022.
//

import UIKit

class LogInViewController: UIViewController {
    
    private let nc = NotificationCenter.default
    
    override func viewDidLoad(){
        self.navigationController?.navigationBar.isHidden = true
        setupScrollView()
        setupContentView()
        setupLogo()
        setupStackView()
        setupLoginButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        nc.addObserver(self, selector: #selector(kbdShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        nc.addObserver(self, selector: #selector(kbdHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        nc.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        nc.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    
    @objc func kbdShow(notification: NSNotification) {
        if let kbdSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as?
                          NSValue)?.cgRectValue {
            scrollView.contentInset.bottom = kbdSize.height
            scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: kbdSize.height, right: 0)
        }
    }
    
    @objc func kbdHide() {
        scrollView.contentInset = .zero
        scrollView.verticalScrollIndicatorInsets = .zero
    }
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .white
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = .white
        return contentView
    }()
    
    lazy var logoVk:UIImageView = {
        let logoVk = UIImageView()
        logoVk.translatesAutoresizingMaskIntoConstraints = false
        logoVk.image = UIImage(named: "logo")
        return logoVk
    }()
    
    lazy var loginVk:UITextField = {
        let loginVk = UITextField()
        loginVk.translatesAutoresizingMaskIntoConstraints = false
        loginVk.backgroundColor = .systemGray6
        loginVk.textColor = .black
        loginVk.font = UIFont.systemFont(ofSize: 16, weight:.regular)
        loginVk.autocapitalizationType = .none
        loginVk.placeholder = "Email or Phone"
        loginVk.leftView = UIView(frame: CGRect(x: 0, y: 10, width: 10, height: loginVk.frame.height))
        loginVk.leftViewMode = .always
        return loginVk
    }()
    
    lazy var passwordVk:UITextField = {
        let loginPassword = UITextField()
        loginPassword.translatesAutoresizingMaskIntoConstraints = false
        loginPassword.layer.borderColor = UIColor.lightGray.cgColor
        loginPassword.layer.borderWidth = 0.5
        loginPassword.backgroundColor = .systemGray6
        loginPassword.textColor = .black
        loginPassword.font = UIFont.systemFont(ofSize: 16, weight:.regular)
        loginPassword.autocapitalizationType = .none
        loginPassword.placeholder = "Password"
        loginPassword.isSecureTextEntry = true
        loginPassword.leftView = UIView(frame: CGRect(x: 0, y: 10, width: 10, height: loginPassword.frame.height))
        loginPassword.leftViewMode = .always
        return loginPassword
    }()
    
    lazy var stackViewLogPass:UIStackView = {
        let stackViewLogPass = UIStackView()
        stackViewLogPass.translatesAutoresizingMaskIntoConstraints = false
        stackViewLogPass.axis = .vertical
        stackViewLogPass.alignment = .fill
        stackViewLogPass.spacing = 0
        stackViewLogPass.distribution = .fillEqually
        stackViewLogPass.layer.borderWidth = 0.5
        stackViewLogPass.layer.borderColor = UIColor.lightGray.cgColor
        stackViewLogPass.layer.cornerRadius = 10
        stackViewLogPass.clipsToBounds = true
        stackViewLogPass.backgroundColor = .systemGray6
        stackViewLogPass.addArrangedSubview(loginVk)
        stackViewLogPass.addArrangedSubview(passwordVk)
        return stackViewLogPass
    }()
    
    @objc private func tapAction() {
        lazy var profileVC = ProfileViewController()
        navigationController?.pushViewController(profileVC, animated: true)
    }
    
    lazy var logInButton:UIButton = {
        let loginButton = UIButton()
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.backgroundColor = hexStringToUIColor(hex: "#4885CC")
        loginButton.layer.cornerRadius = 10
        loginButton.setTitle("Log in", for: .normal)
        return loginButton
    }()
    
    func setupScrollView() {
        view.addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    func setupContentView() {
        scrollView.addSubview(contentView)
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
    }
    
    func setupLogo() {
        contentView.addSubview(logoVk)
        logoVk.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        logoVk.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 120).isActive = true
        logoVk.heightAnchor.constraint(equalToConstant: 100).isActive = true
        logoVk.widthAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    func setupLogin() {
        contentView.addSubview(loginVk)
        loginVk.topAnchor.constraint(equalTo: stackViewLogPass.topAnchor, constant: 0).isActive = true
        loginVk.leadingAnchor.constraint(equalTo: stackViewLogPass.leadingAnchor, constant: 0).isActive = true
        loginVk.trailingAnchor.constraint(equalTo: stackViewLogPass.trailingAnchor, constant: 0).isActive = true
        loginVk.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func setupPassword() {
        contentView.addSubview(passwordVk)
        passwordVk.topAnchor.constraint(equalTo: loginVk.bottomAnchor, constant: 0).isActive = true
        passwordVk.leadingAnchor.constraint(equalTo: stackViewLogPass.leadingAnchor, constant: 0).isActive = true
        passwordVk.trailingAnchor.constraint(equalTo: stackViewLogPass.trailingAnchor, constant: 0).isActive = true
        passwordVk.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func setupStackView() {
        contentView.addSubview(stackViewLogPass)
        stackViewLogPass.topAnchor.constraint(equalTo: logoVk.bottomAnchor, constant: 120).isActive = true
        stackViewLogPass.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        stackViewLogPass.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
        stackViewLogPass.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    func setupLoginButton() {
        contentView.addSubview(logInButton)
        logInButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        logInButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
        logInButton.topAnchor.constraint(equalTo: stackViewLogPass.bottomAnchor, constant: 16).isActive = true
        logInButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        logInButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        logInButton.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
    }
}

// MARK: - UITextFieldDelegate

extension LogInViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
}