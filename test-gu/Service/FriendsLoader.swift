//
//  FriendsLoader.swift
//  test-gu
//
//  Created by Денис Сизов on 13.10.2021.
//

import Foundation

// Возвращаем какой-то массив данных, тут могла бы быть подгрузка из API
class FriendsLoader {
    static func iNeedFriends() -> [UserModel] {
        return [UserModel(name: "Vasia", image: "vasia"),
                UserModel(name: "Petia", image: "petia"),
                UserModel(name: "Dima", image: "dima"),
                UserModel(name: "Misha", image: "misha"),
        ]
    }
}
