//
//  NewsCell.swift
//  test-gu
//
//  Created by Денис Сизов on 23.10.2021.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    static var xibIdentifier = "NewsCellXib"
    static var cellIdentifier = "NewsCell"

    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var postDate: UILabel!
    @IBOutlet weak var postText: UITextView!
    
    
    
}
