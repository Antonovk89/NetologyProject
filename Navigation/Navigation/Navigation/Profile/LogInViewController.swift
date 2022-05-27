//
//  LogInViewController.swift
//  Navigation
//
//  Created by Konstantin Antonov on 14.05.2022.
//

import UIKit

class LogInViewController: UIViewController {
    
    private let minLength = 8
    private lazy var regex = "(?=.*[0-9]){\(minLength),}$"
    private let login = "89111111111"
    private let password = "00000000"
    private let nc = NotificationCenter.default
    
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
    
    
    
    lazy var logInButton:UIButton = {
        let loginButton = UIButton()
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.backgroundColor = hexStringToUIColor(hex: "#4885CC")
        loginButton.layer.cornerRadius = 10
        loginButton.setTitle("Log in", for: .normal)
        return loginButton
    }()
    
    lazy var messageLabel:UILabel = {
       let lable = UILabel()
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.numberOfLines = 0
        return lable
    }()
    
    override func viewDidLoad(){
        self.navigationController?.navigationBar.isHidden = true
        setupScrollView()
        setupContentView()
        setupLogo()
        setupStackView()
        setupLoginButton()
        setupMessageLabel()
        passwordVk.delegate = self
    }
    private func checkValidation(password: String) {
        if password.count < minLength  {
            messageLabel.text = "Слишком короткий пароль!"
        } else {
            messageLabel.text = ""
            return
        }
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
        logInButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        logInButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        logInButton.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
    }
    
    @objc private func tapAction() {
        lazy var profileVC = ProfileViewController()
        if loginVk.text == "" || passwordVk.text == "" {
            loginVk.text == "" ? loginVk.self.shake() : nil
            passwordVk.text == "" ? passwordVk.self.shake() : nil
        } else {
            loginVk.text == login && passwordVk.text == password ? navigationController?.pushViewController(profileVC, animated: true) : logPassAlert()
        }
    }
        func logPassAlert() {
            lazy var validationAlert = UIAlertController(title: "Не правильный логин или пароль!", message: nil, preferredStyle: .alert)
            lazy var okAction = UIAlertAction(title: "Ok", style: .default) {_ -> Void in
                self.dismiss(animated: true)
            }
            validationAlert.addAction(okAction)
            present(validationAlert, animated: true, completion: nil)
        }
        
        func redTextField() {
           loginVk.textColor = .red
            passwordVk.textColor = .red
        }


    func setupMessageLabel() {
        contentView.addSubview(messageLabel)
        messageLabel.topAnchor.constraint(equalTo: stackViewLogPass.bottomAnchor, constant: 2).isActive = true
        messageLabel.bottomAnchor.constraint(equalTo: logInButton.topAnchor, constant: 2).isActive = true
        messageLabel.trailingAnchor.constraint(equalTo: stackViewLogPass.trailingAnchor).isActive = true
        messageLabel.leadingAnchor.constraint(equalTo: stackViewLogPass.leadingAnchor).isActive = true
        messageLabel.heightAnchor.constraint(equalToConstant: 32).isActive = true
    }
}

// MARK: - UITextFieldDelegate

extension LogInViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let text = (passwordVk.text ?? "") + string
        let res: String

        if range.length == 1 {
            let end = text.index(text.startIndex, offsetBy: text.count - 1)
            res = String(text[text.startIndex..<end])
        } else {
            res = text
        }
        checkValidation(password: res )
        passwordVk.text = res
        return false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
}
extension String {
    func matches (_ regex: String) -> Bool {
        return self.range(of: regex, options: .regularExpression, range: nil, locale: nil) != nil
    }
}

public extension UIView {

    func shake(count : Float = 4,for duration : TimeInterval = 0.5,withTranslation translation : Float = 5) {

        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        animation.repeatCount = count
        animation.duration = duration/TimeInterval(animation.repeatCount)
        animation.autoreverses = true
        animation.values = [translation, -translation]
        layer.add(animation, forKey: "shake")
    }
}
