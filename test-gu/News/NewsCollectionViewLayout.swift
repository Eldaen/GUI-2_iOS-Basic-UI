//
//  NewsCollectionViewLayout.swift
//  test-gu
//
//  Created by Денис Сизов on 24.10.2021.
//

import UIKit

class NewsCollectionViewLayout: UICollectionViewLayout {
    
    // Хранит атрибуты для заданных индексов
    var cacheAttributes = [IndexPath: UICollectionViewLayoutAttributes]()
    
    // Хранит суммарную высоту всех ячеек
    private var totalCellsHeight: CGFloat = 0
    
}
