//
//  SkillCollectionViewCell.swift
//  MySkills
//
//  Created by Nikita Evdokimov on 01.08.23.
//

import UIKit

class SkillCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "SkillCollectionViewCell"
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
//    let crossButton: UIButton = {
//        let button = UIButton()
////        button.isHidden = true
//        button.setBackgroundImage(UIImage(systemName: "delete.left"), for: .normal)
//        button.isUserInteractionEnabled = true
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.backgroundColor = .black
//        return button
//    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(titleLabel)
//        addSubview(crossButton)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            
//            crossButton.topAnchor.constraint(equalTo: topAnchor),
//            crossButton.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 5),
//            crossButton.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        layer.cornerRadius = 10
        clipsToBounds = true
        backgroundColor = .systemGray
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        let attributes = super.preferredLayoutAttributesFitting(layoutAttributes)
        let targetSize = CGSize(width: layoutAttributes.frame.width, height: UIView.layoutFittingCompressedSize.height)
        let size = titleLabel.sizeThatFits(targetSize)
        attributes.frame.size.height = size.height
        return attributes
    }
}


