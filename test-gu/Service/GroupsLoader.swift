//
//  GroupsLoader.swift
//  test-gu
//
//  Created by Денис Сизов on 13.10.2021.
//

import Foundation

// Возвращаем какой-то массив данных, тут могла бы быть подгрузка из API
class GroupsLoader {
    static func iNeedGroups() -> [Group] {
        return [Group(name: "В душе пираты", image: "pepe-pirate"),
                Group(name: "Дворник это призвание", image: "pepe-yard-keeper"),
                Group(name: "Лайфхаки из Тиктока", image: "pepe-dunno"),
                Group(name: "Годнота", image: "pepe-like"),
        ]
    }
}
