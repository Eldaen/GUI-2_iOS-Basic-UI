//
//  GroupsLoader.swift
//  test-gu
//
//  Created by Денис Сизов on 13.10.2021.
//

import Foundation

// Возвращаем какой-то массив данных, тут могла бы быть подгрузка из API
class GroupsLoader {
    static func iNeedGroups() -> [(name: String, image: String)] {
        return [(name: "В душе пираты", image: "pepe-pirate"),
                (name: "Дворник это призвание", image: "pepe-yard-keeper"),
                (name: "Лайфхаки из Тиктока", image: "pepe-dunno"),
                (name: "Годнота", image: "pepe-like"),
        ]
    }
}
