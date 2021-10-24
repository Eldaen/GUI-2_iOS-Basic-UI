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
    @IBOutlet weak var collectionView: UICollectionView!
    var newsImages: [String] = []
    

    
    
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
        if newsImages.count > 4 {
            return 4
        } else {
            return newsImages.count
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewsCollectionViewCell", for: indexPath) as? NewsCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let image = UIImage(named: newsImages[indexPath.row]) ?? UIImage()
        
        // если есть больше 4х картинок, то нужно показать что их больше
        // для этого сделаем полупрозрачную вьюху, положем её поверх картинки и ещё текст добавим
        if indexPath.row == 3 && newsImages.count > 4 {
            let frameCV = collectionView.frame
            let cellSize = CGRect(x: 0, y: 0, width: frameCV.width / 2,
                              height: frameCV.height / 2)
            
            let newView = UIView(frame: cellSize)
            newView.backgroundColor = .white.withAlphaComponent(0.8)
            
            let extraImagesCount = UILabel(frame: cellSize)
            extraImagesCount.textAlignment = .center
            extraImagesCount.text = "+" + String( newsImages.count - 3 )
            extraImagesCount.font = UIFont.boldSystemFont(ofSize: 48.0)
            extraImagesCount.textColor = .black

            cell.newsImage.addSubview(newView)
            newView.addSubview(extraImagesCount)
        }
        
        cell.configure(with: image)
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {

        return 0
    }
    
    
    // TODO: не знаю как почистить для реюза =(
    override func prepareForReuse() {
        newsImages = []
    }

}
