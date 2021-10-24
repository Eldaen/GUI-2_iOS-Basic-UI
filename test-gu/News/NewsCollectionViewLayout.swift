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

    // Количество столбцов
    var columnsCount = 2

    // Высота ячейки
    var cellHeight: CGFloat = 170

    // Хранит суммарную высоту всех ячеек
    private var totalCellsHeight: CGFloat = 0

    override func prepare() {
        // Инициализируем атрибуты
        self.cacheAttributes = [:]

        // Проверяем наличие collectionView
        guard let collectionView = self.collectionView else { return }

        // Проверяем, что в секции есть хотя бы одна ячейка
        let itemsCount = collectionView.numberOfItems(inSection: 0)
        guard itemsCount > 0 else { return }

        let bigCellWidth = collectionView.frame.width
        let smallCellWidth = collectionView.frame.width / CGFloat(self.columnsCount)

        var lastY: CGFloat = 0
        var lastX: CGFloat = 0

        for index in 0..<itemsCount {
            let indexPath = IndexPath(item: index, section: 0)
            let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)


                attributes.frame = CGRect(x: lastX, y: lastY,
                                          width: smallCellWidth, height: self.cellHeight)

                let isLastColumn = (index + 2) % (self.columnsCount + 1) == 0 || index == itemsCount - 1
                if isLastColumn {
                    lastX = 0
                    lastY += self.cellHeight
                } else {
                    lastX += smallCellWidth
                }

            cacheAttributes[indexPath] = attributes
        }
        self.totalCellsHeight = lastY
    }

    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return cacheAttributes.values.filter { attributes in
            return rect.intersects(attributes.frame)
        }
    }

    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return cacheAttributes[indexPath]
    }

    override var collectionViewContentSize: CGSize {
        collectionView?.addConstraint(NSLayoutConstraint(
            item: collectionView ?? UICollectionView(),
            attribute: .height,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1.0,
            constant: self.totalCellsHeight
        ))
        return CGSize(width: self.collectionView?.frame.width ?? 0,
                      height: self.totalCellsHeight)
    }
}
