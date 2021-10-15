//
//  FriendCollectionController.swift
//  test-gu
//
//  Created by Денис Сизов on 13.10.2021.
//

import UIKit

class FriendCollectionController: UIViewController {
    
    var friend: UserModel?

    override func viewDidLoad() {
        super.viewDidLoad()

    }



}

// MARK: UICollectionViewDataSource

extension FriendCollectionController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FriendCell", for: indexPath) as? FriendCollectionCell else {
            return UICollectionViewCell()
        }
        
        if let friendCell = friend {
            cell.friendImage.image = UIImage(named: friendCell.image)
            cell.friendName.text = friendCell.name
        }
    
        return cell
    }
}
