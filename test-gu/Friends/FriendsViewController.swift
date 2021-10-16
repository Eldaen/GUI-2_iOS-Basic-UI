//
//  FriendsViewController.swift
//  test-gu
//
//  Created by Денис Сизов on 13.10.2021.
//

import UIKit

class FriendsViewController: UITableViewController {
    
    var friends = FriendsLoader.iNeedFriends()
    var lettersOfNames = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.sectionHeaderHeight = 40
        self.tableView.backgroundColor = .orange
        self.tableView.showsVerticalScrollIndicator = false
        
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
        return friends.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Кол-во рядов в секции
        return friends[section].data.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let section = friends[section]
        
        return String(section.key)
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FriendsCell", for: indexPath) as? FriendsCell else {
            return UITableViewCell()
        }

        let section = friends[indexPath.section]
        let name = section.data[indexPath.row].name
        let image = section.data[indexPath.row].image
        
        cell.friendName.text = name
        cell.friendImage.image = UIImage(named: image)!
        
        return cell
    }
    
    // Буквы для контрола справа
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return lettersOfNames
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
              
             let section = friends[indexPathSection]
             vc.friend = section.data[indexPathRow]
         }
     }

}
