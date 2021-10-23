//
//  NewsCell.swift
//  test-gu
//
//  Created by Денис Сизов on 23.10.2021.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var postDate: UILabel!
    @IBOutlet weak var postText: UITextView!
    var newsImages: [String]!
    

    
    
    /// Конфигурирует ячейку NewsTableViewCell
    /// - Parameters:
    ///   - model: Модель новости, которую нужно отобразить
    func configure (with model: NewsModel) {
        userImage.image = UIImage(named: model.user.image) ?? UIImage() // чтобы не крашнулось, если аватарки нет
        userName.text = model.user.name
        self.postDate.text = model.postDate
        postText.text = model.postText
        newsImages = model.images
    }
    
}

// MARK: collection view extension

extension NewsTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        newsImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewsCollectionViewCell", for: indexPath) as? NewsCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.configure(with: UIImage(named: newsImages[indexPath.row]) ?? UIImage())
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let frameCV = collectionView.frame
        var widthCell = frameCV.width
        var heightCell = frameCV.height
        
        if newsImages.count > 1 {
            widthCell = frameCV.width / 2
            heightCell = frameCV.height
        }
        
        return CGSize(width: widthCell, height: heightCell)
    }
}
