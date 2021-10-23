//
//  NewsLoader.swift
//  test-gu
//
//  Created by Денис Сизов on 23.10.2021.
//

import Foundation

// Возвращаем какой-то массив данных, тут могла бы быть подгрузка из API
class NewsLoader {
    static func iNeedNews() -> [NewsModel] {
        return [NewsModel(user: UserModel(name: "Vasia", image: "vasia"),
                          postDate: "1.1.1970", postText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus dapibus leo id ex lacinia dapibus. Quisque nunc quam, mollis vel. ", images: ["vasia", "vasia", "vasia", "vasia"]),
                NewsModel(user: UserModel(name: "Vasia", image: "vasia"),
                          postDate: "1.1.1970", postText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus dapibus leo id ex lacinia dapibus. Quisque nunc quam, mollis vel. ", images: ["vasia"]),
                NewsModel(user: UserModel(name: "Vasia", image: "vasia"),
                          postDate: "1.1.1970", postText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus dapibus leo id ex lacinia dapibus. Quisque nunc quam, mollis vel. ", images: ["vasia"]),
                NewsModel(user: UserModel(name: "Vasia", image: "vasia"),
                          postDate: "1.1.1970", postText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus dapibus leo id ex lacinia dapibus. Quisque nunc quam, mollis vel. ", images: ["vasia"]),
                NewsModel(user: UserModel(name: "Vasia", image: "vasia"),
                          postDate: "1.1.1970", postText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus dapibus leo id ex lacinia dapibus. Quisque nunc quam, mollis vel. ", images: ["vasia"]),
                NewsModel(user: UserModel(name: "Vasia", image: "vasia"),
                          postDate: "1.1.1970", postText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus dapibus leo id ex lacinia dapibus. Quisque nunc quam, mollis vel. ", images: ["vasia"]),
        ]
    }
}
