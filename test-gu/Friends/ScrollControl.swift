//
//  ScrollControl.swift
//  test-gu
//
//  Created by Денис Сизов on 16.10.2021.
//

import UIKit

class ScrollControl: UIControl {
    
    var sections: [FriendsSection] = [] {
        didSet {
            setupView()
        }
    }
    var buttons: [UIButton] = []
    var stackView: UIStackView!
    
    private func setupView() {
        for section in sections {
            let button = UIButton(type: .system)
            button.setTitle(String(section.key), for: .normal)
            button.setTitleColor(.lightGray, for: .normal)
            button.setTitleColor(.white, for: .selected)
            //button.addTarget(self, action: #selector(selectSection(_:)), for: .touchUpInside)
            self.buttons.append(button)
        }
        
        stackView = UIStackView(arrangedSubviews: self.buttons)
        self.addSubview(stackView)
        
        stackView.spacing = 8
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        stackView.frame = bounds
    }
    
    
    // оно сюда не заходит, при текущем использовании
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
        //addGestureRecognizer(tapGestureRecognizer)
    }
    
    // Стандартный метод, надо бы потом разобраться что такое coder
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupView()
        //addGestureRecognizer(tapGestureRecognizer)
    }
}
