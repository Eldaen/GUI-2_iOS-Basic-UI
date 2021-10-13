//
//  FriendsLoader.swift
//  test-gu
//
//  Created by Денис Сизов on 13.10.2021.
//

import Foundation

// Возвращаем какой-то массив данных, тут могла бы быть подгрузка из API
class FriendsLoader {
    static func iNeedFriends() -> [(name: String, image: String)] {
        return [(name: "Vasia", image: "vasia"),
                (name: "Petia", image: "petia"),
                (name: "Dima", image: "dima"),
                (name: "Misha", image: "misha"),
        ]
    }
}
