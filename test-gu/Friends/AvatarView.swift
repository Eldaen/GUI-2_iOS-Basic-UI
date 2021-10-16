//
//  AvatarView.swift
//  test-gu
//
//  Created by Денис Сизов on 15.10.2021.
//

import UIKit

@IBDesignable class AvatarView: UIView {
    
    var image: UIImage = UIImage() {
        didSet {
            imageView.image = image
        }
    }
    private var imageView: UIImageView = UIImageView()
    private var containerView: UIView = UIView()
    
    @IBInspectable var shadowColor: UIColor = .black {
        didSet {
            self.updateColor()
        }
    }
    @IBInspectable var shadowOpacity: Float = 3.0 {
        didSet {
            self.updateOpacity()
        }
    }
    @IBInspectable var shadowRadius: CGFloat = 4.0 {
        didSet {
            self.updateRadius()
        }
    }
    @IBInspectable var shadowOffset: CGSize = .zero {
        didSet {
            self.updateOffset()
        }
    }
    
    private func setupImage() {
        
        // Чтобы тень рисовалась и круглые картинки были
        containerView.frame = self.bounds
        containerView.layer.cornerRadius = 20
        
        //чтобы округлялось
        imageView.layer.masksToBounds = true
        imageView.frame = containerView.bounds
        imageView.contentMode = .scaleAspectFill // если ставить fit, то что-то не то
        imageView.layer.cornerRadius = imageView.frame.size.width / 2
        imageView.image = image
        
        //вьюхи нужно добавлять только после задания им параметров
        containerView.addSubview(imageView)
        self.addSubview(containerView)
        updateShadows()
    }
    
    private func updateOpacity() {
        
        self.containerView.layer.shadowOpacity = shadowOpacity
    }
    
    private func updateColor() {
        self.containerView.layer.shadowColor = shadowColor.cgColor
    }
    
    private func updateOffset() {
        self.containerView.layer.shadowOffset = shadowOffset
    }
    
    private func updateRadius() {
        self.containerView.layer.shadowRadius = shadowRadius
    }
    
    private func updateShadows() {
        self.containerView.layer.shadowOpacity = shadowOpacity
        self.containerView.layer.shadowColor = shadowColor.cgColor
        self.containerView.layer.shadowOffset = shadowOffset
        self.containerView.layer.shadowRadius = shadowRadius
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupImage()
    }
    
    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
        self.setupImage()
    }
    
}
