//
//  LikeControl.swift
//  test-gu
//
//  Created by Денис Сизов on 15.10.2021.
//

import UIKit

class LikeControl: UIControl {
    
    var likesCount: Int = 0
    lazy var tapGestureRecognizer: UITapGestureRecognizer = {
        let recognizer = UITapGestureRecognizer(target: self,
                                                action: #selector(onClick))
        recognizer.numberOfTapsRequired = 1    // Количество нажатий, необходимое для распознавания
        recognizer.numberOfTouchesRequired = 1 // Количество пальцев, которые должны коснуться экрана для распознавания
        return recognizer
    }()
    
    
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
        likesLabel.text = String(likesCount)
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
    
    @objc func onClick() {
        if likesCount == 0 {
            let image = UIImage(systemName: "heart.fill")
            likesImage.image = image
        }
        
        likesCount += 1
        likesLabel.text = String(likesCount)
    }
    
    // оно сюда не заходит, при текущем использовании
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
        addGestureRecognizer(tapGestureRecognizer)
    }
    
    // Стандартный метод, надо бы потом разобраться что такое coder
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupView()
        addGestureRecognizer(tapGestureRecognizer)
    }
}
