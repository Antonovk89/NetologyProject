//
//  UIView+Extension.swift
//  Navigation
//
//  Created by Konstantin Antonov on 16.05.2022.
//

import UIKit

extension UIView {
    static var identifire: String {
        return String(describing: self)
    }
}

extension UICollectionViewCell {
    static var id: String {
        return String(describing: self)
    }
}
