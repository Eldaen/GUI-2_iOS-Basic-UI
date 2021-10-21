//
//  FriendsLoader.swift
//  test-gu
//
//  Created by Денис Сизов on 13.10.2021.
//

// Возвращаем какой-то массив данных, тут могла бы быть подгрузка из API
class FriendsLoader {
    
    // Можно было бы сразу отсортировать тестовые данные как надо, но я что-то решил сделать сотировалки, чтобы потом не переделывать, если будет подгрузка
    static var friends = [UserModel(name: "Vasia", image: "vasia"),
                          UserModel(name: "Petia", image: "petia"),
                          UserModel(name: "Dima", image: "dima"),
                          UserModel(name: "Andrey", image: "misha"),
                          UserModel(name: "Bob", image: "petia"),
                          UserModel(name: "Coby", image: "dima"),
                          UserModel(name: "Misha", image: "misha"),
                          UserModel(name: "Nick", image: "petia"),
                          UserModel(name: "Kane", image: "dima"),
                          UserModel(name: "Stepan", image: "misha"),
                          UserModel(name: "Kira", image: "petia"),
                          UserModel(name: "James", image: "dima"),
                          UserModel(name: "Walter", image: "misha"),
                          UserModel(name: "Oprah", image: "petia"),
                          UserModel(name: "Vitalik", image: "dima"),
                          UserModel(name: "Harold", image: "misha"),
    ]
    
    static func iNeedFriends() -> [FriendsSection] {
        let sortedArray = sortFriends(friends)
        let sectionsArray = formFriendsSections(sortedArray)
        return sectionsArray
    }
    
    // Раскидываем друзей по ключам, в зависимости от первой буквы имени
    static func sortFriends(_ array: [UserModel]) -> [Character: [UserModel]] {
        
        var newArray: [Character: [UserModel]] = [:]
        for user in array {
            //проверяем, чтобы строка имени не оказалась пустой
            guard let firstChar = user.name.first else {
                continue
            }

            // Если секции с таким ключом нет, то создадим её
            guard var array = newArray[firstChar] else {
                let newValue = [user]
                newArray.updateValue(newValue, forKey: firstChar)
                continue
            }
            
            // Если секция нашлась, то добавим в массив ещё модель
            array.append(user)
            newArray.updateValue(array, forKey: firstChar)
        }
        return newArray
    }
    
    static func formFriendsSections(_ array: [Character: [UserModel]]) -> [FriendsSection] {
        var sectionsArray: [FriendsSection] = []
        for (key, array) in array {
            sectionsArray.append(FriendsSection(key: key, data: array))
        }
        
        //Сортируем секции по алфавиту
        sectionsArray.sort { $0 < $1 }
        
        return sectionsArray
    }
}
