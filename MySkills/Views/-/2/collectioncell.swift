//
//  collectioncell.swift
//  MySkills
//
//  Created by Nikita Evdokimov on 01.08.23.
//

import UIKit

class ColorCollectionViewCell: UICollectionViewCell {
    
    // Идентификатор ячейки
    static let identifier = "ColorCollectionViewCell"
    
    // View для отображения цвета фона ячейки
    private let colorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Добавляем colorView на ячейку
        addSubview(colorView)
        
        // Устанавливаем constraints для colorView, чтобы он занимал всю площадь ячейки
        NSLayoutConstraint.activate([
            colorView.topAnchor.constraint(equalTo: topAnchor),
            colorView.leadingAnchor.constraint(equalTo: leadingAnchor),
            colorView.trailingAnchor.constraint(equalTo: trailingAnchor),
            colorView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    // Функция для установки цвета фона ячейки
    func setColor(_ color: UIColor) {
        colorView.backgroundColor = color
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
