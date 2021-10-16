//
//  FriendsViewController.swift
//  test-gu
//
//  Created by Денис Сизов on 13.10.2021.
//

import UIKit

class FriendsViewController: UITableViewController {
    
    var friends = FriendsLoader.iNeedFriends()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.sectionHeaderHeight = 40
        self.tableView.backgroundColor = .orange
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
//        let name = friends[indexPath.row].name
//        let image = friends[indexPath.row].image
//
        cell.friendName.text = name
        cell.friendImage.image = UIImage(named: image)!
        
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

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
