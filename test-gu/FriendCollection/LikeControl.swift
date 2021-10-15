//
//  LikeControl.swift
//  test-gu
//
//  Created by Денис Сизов on 15.10.2021.
//

import UIKit

class LikeControl: UIControl {
    
    var likesCount: Int = 0
    
    private var stackView: UIStackView = UIStackView()
    private var likesImage: UIImageView = UIImageView()
    private var likesLabel: UILabel = UILabel()
    
    private func setupView() {
        
        // Чтобы вьюха была без фона и не мешала
        self.backgroundColor = .clear
        
        // Тут нам надо добавить в self стэк вью, в стэк вью добавить UIImage view и Label
        
        // Задали imageVue картинку heart с цветом red
        let image = UIImage(systemName: "heart")
        likesImage.image = image
        likesImage.tintColor = .red
        
        //Настраиваем Label
        likesLabel.text = "0"
        likesLabel.textAlignment = .center
        likesLabel.textColor = .red
        likesLabel.font = UIFont.systemFont(ofSize: 16)
        
        //Настраиваем stackView
        stackView.spacing = 0
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.frame = bounds
        
        // Добавляем картинку и текст в стэк
        stackView.addArrangedSubview(likesLabel)
        stackView.addArrangedSubview(likesImage)
        
        self.addSubview(stackView)

    }
    
    
    override init(frame: CGRect) {
         super.init(frame: frame)
        self.setupView()
    }
    
    // Стандартный метод, надо бы потом разобраться что такое coder
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupView()
    }
}
