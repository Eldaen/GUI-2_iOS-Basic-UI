//
//  User.swift
//  test-gu
//
//  Created by Денис Сизов on 13.10.2021.
//

import UIKit

// Делаем самые простые модели, т.к. они нам чисто показать данные, а потом можно их и переделать.
struct UserModel {
    let name: String
    let image: String
    let uiImage: UIImage
    
    init(name: String, image: String) {
        self.name = name
        self.image = image
        
        uiImage = UIImage(named: image) ?? UIImage()
    }
}
