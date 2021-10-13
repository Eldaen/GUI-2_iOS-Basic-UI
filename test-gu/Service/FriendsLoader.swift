//
//  FriendsLoader.swift
//  test-gu
//
//  Created by Денис Сизов on 13.10.2021.
//

import Foundation

// Возвращаем какой-то массив данных, тут могла бы быть подгрузка из API
class FriendsLoader {
    static func iNeedFriends() -> [User] {
        return [User(name: "Vasia", image: "vasia"),
                User(name: "Petia", image: "petia"),
                User(name: "Dima", image: "dima"),
                User(name: "Misha", image: "misha"),
        ]
    }
}
