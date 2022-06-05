//
//  Post.swift
//  Navigation
//
//  Created by Konstantin Antonov on 04.05.2022.
//

import UIKit

struct Post {
   // var title: String
    var author: String //- никнейм автора публикации
    var description: String? //- текст публикации
    var image: UIImage? //- имя картинки из каталога Assets.xcassets
    var likes: Int // - количество лайков
    var views: Int // - количество просмотров
    
    static func makePost() -> [Post] {
        var post = [Post]()
        post.append(Post(author: "Raoul Duke", description: " Мы были уже на краю пустыни, когда нас начало накрывать…", image: UIImage(named: "tompson-"), likes: 0, views: 200))
        post.append(Post(author: "Raoul Duke", description: "За рулём мой адвокат, а не какой-нибудь козёл с дороги!", image: UIImage(named: "images"), likes: 0, views: 300))
        post.append(Post(author: "Raoul Duke", description: "Это был неподходящий город. Угрожающие вибрации шли со всех сторон.", image: UIImage(named: "85a18facae654d1196528c1a7d92"), likes: 0, views: 230))
        post.append(Post(author: "Oscar Acosta", description: "Как адвокат, советую купить мотоцикл, иначе материал не будет правдивым.", image: UIImage(named: "5"), likes: 0,  views: 700))
        return post
    }
}
