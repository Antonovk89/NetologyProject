//
//  InfoViewController.swift
//  Navigation
//
//  Created by Konstantin Antonov on 04.05.2022.
//

import UIKit

class InfoViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        makeButton()
    }
    private func makeButton() {
        let buttonInfo = UIButton(frame:CGRect(x: 0, y: 0, width: 200, height: 40))
        buttonInfo.center = view.center
        buttonInfo.setTitle("Информация", for: .normal)
        buttonInfo.backgroundColor = .gray
        buttonInfo.layer.cornerRadius = 12
        buttonInfo.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
        view.addSubview(buttonInfo)
    }
    @objc private func tapAction() {
        let vcInfoAlert = UIAlertController(title: "Вопрос проверяющему!", message: "Задание выполненно?", preferredStyle: .alert)
        let yesAction = UIAlertAction(title: "Да", style: .default) {_ -> Void in
            print("Супер!!!")
            self.dismiss(animated: true)
        }
        let noAction = UIAlertAction(title: "Нет", style: .destructive) {_ -> Void in
            print("Что не так?")
            self.dismiss(animated: true)
        }
        vcInfoAlert.addAction(yesAction)
        vcInfoAlert.addAction(noAction)
        present(vcInfoAlert, animated: true, completion: nil)
        
    }
}
