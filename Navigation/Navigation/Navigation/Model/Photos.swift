//
//  Photos.swift
//  Navigation
//
//  Created by Konstantin Antonov on 20.05.2022.
//

import UIKit



struct Photos {
    
    var image:UIImage
    
    static func makePhotosModel() -> [Photos] {
        var images = [Photos]()
        for i in 0...19 {
            images.append(Photos(image: UIImage(named: "image\(i)")!))
        }
        return images
    }
}
