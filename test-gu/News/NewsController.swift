//
//  NewsController.swift
//  test-gu
//
//  Created by Денис Сизов on 23.10.2021.
//

import UIKit

class NewsController: UITableViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let news = NewsLoader.iNeedNews()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 600
    }

  
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return news.count
    }

    // отрисовываем ячейки
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as? NewsTableViewCell else {
            return UITableViewCell()
        }
                // конфигурируем ячейку
                cell.configure(with: news[indexPath.row])

        return cell
    }
}


