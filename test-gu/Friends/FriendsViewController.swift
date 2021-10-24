//
//  FriendsViewController.swift
//  test-gu
//
//  Created by Денис Сизов on 13.10.2021.
//

import UIKit

/// Отображает список всех пользователей
class FriendsViewController: UITableViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var friends = FriendsLoader.iNeedFriends()
    var lettersOfNames = [String]()
    // lazy чтобы можно было так объявить до доступности self
    lazy var filteredData = friends
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.showsVerticalScrollIndicator = false
        tableView.sectionHeaderTopPadding = 0
        
        //нужно объявить. что поиском будет заниматься вот этот searchBar
        searchBar.delegate = self
        
        loadLetters()
    }
    
    func loadLetters() {
        for user in friends {
            lettersOfNames.append(String(user.key))
        }
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // Кол-во секций
        return filteredData.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Кол-во рядов в секции
        return filteredData[section].data.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let section = friends[section]
        
        return String(section.key)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FriendsCell", for: indexPath) as? FriendsTableViewCell else {
            return UITableViewCell()
        }
        
        let section = filteredData[indexPath.section]
        let name = section.data[indexPath.row].name
        let image = section.data[indexPath.row].image
        // конфигурируем и возвращаем готовую ячейку
        cell.configure(name: name, image: UIImage(named: image)!)
        
        return cell
    }
    
    /// Создаёт массив заголовков секций, по одной букве, с которой начинаются имена друзей
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return lettersOfNames
    }
    
    // настройка хедера ячеек и добавление букв в него
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        //Создаём кастомную вьюху заголовка
        let header = UIView()
        header.backgroundColor = .lightGray.withAlphaComponent(0.5)
        
        let leter: UILabel = UILabel(frame: CGRect(x: 30, y: 5, width: 20, height: 20))
        leter.textColor = UIColor.black.withAlphaComponent(0.5)  // прозрачность только надписи
        leter.text = String(filteredData[section].key) // В зависимости от номера секции - даём ей разные названия из массива имён секций
        leter.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.light)
        header.addSubview(leter)
        
        return header
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is FriendCollectionController {
            guard let vc = segue.destination as? FriendCollectionController else {
                return
            }
            guard let indexPathSection = tableView.indexPathForSelectedRow?.section else {
                return
            }
            guard let indexPathRow = tableView.indexPathForSelectedRow?.row else {
                return
            }
            
            let section = filteredData[indexPathSection]
            vc.friend = section.data[indexPathRow]
        }
    }
    
}

// MARK: UISearchBarDelegate

extension FriendsViewController: UISearchBarDelegate {
    
    // Наверное, этот метод мог бы быть проще и быстрее, но при проектировании работы системы изначально поиск не задумывался, так что вот так.
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        //занулим для повторных поисков
        filteredData = []
        
        // Если поиск пустой, то ничего фильтровать нам не нужно
        if searchText == "" {
            filteredData = friends
        } else {
            for section in friends { // сначала перебираем массив секций с друзьями
                for (_, friend) in section.data.enumerated() { // потом перебираем массивы друзей в секциях
                    if friend.name.lowercased().contains(searchText.lowercased()) { // Ищем в имени нужный текст, оба текста сравниваем в нижнем регистре
                        var searchedSection = section
                        
                        // Если фильтр пустой, то можно сразу добавлять
                        if filteredData.isEmpty {
                            searchedSection.data = [friend]
                            filteredData.append(searchedSection)
                            break
                        }
                        // Если в массиве секций уже есть секция с таким ключом, то нужно к имеющемуся массиву друзей добавить друга
                        var found = false
                        for (sectionIndex, filteredSection) in filteredData.enumerated() {
                            if filteredSection.key == section.key {
                                filteredData[sectionIndex].data.append(friend)
                                found = true
                                break
                            }
                        }
                        // Если такого ключа ещё нет, то создаём новый массив с нашим найденным другом
                        if !found {
                            searchedSection.data = [friend]
                            filteredData.append(searchedSection)
                        }
                    }
                }
            }
            
        }
        //обновляем данные
        self.tableView.reloadData()
        
    }
}
