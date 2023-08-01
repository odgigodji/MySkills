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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Добавляем подвиды (subviews) в ячейку
        addSubview(titleLabel)
        
        // Настраиваем ограничения (constraints) для titleLabel
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        // Настраиваем закругленные углы для ячейки
        layer.cornerRadius = 10
        clipsToBounds = true
        backgroundColor = .blue // Здесь вы можете задать желаемый цвет фона для каждой ячейки в коллекции
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
