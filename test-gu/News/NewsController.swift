//
//  NewsController.swift
//  test-gu
//
//  Created by Денис Сизов on 23.10.2021.
//

import UIKit

class NewsController: UIViewController {

    let news = NewsLoader.iNeedNews()
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }

}

extension NewsController: UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return news.count
    }

    // отрисовываем ячейки
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as? NewsTableViewCell else {
            return UITableViewCell()
        }
                // конфигурируем ячейку
                cell.configure(with: news[indexPath.row])

        return cell
    }
}


