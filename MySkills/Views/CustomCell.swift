//
//  CustomCell.swift
//  MySkills
//
//  Created by Nikita Evdokimov on 01.08.23.
//

import UIKit

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    let customImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 50 // Радиус для создания круглой картинки
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .center // Выравнивание текста по центру
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let firstTextLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center // Выравнивание текста по центру
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let secondTextLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center // Выравнивание текста по центру
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let locationImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "mappin.and.ellipse"))
        imageView.tintColor = .systemBlue // Цвет системной картинки геолокации
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // Добавляем подвиды (subviews) в ячейку
        addSubview(customImageView)
        addSubview(titleLabel)
        addSubview(firstTextLabel)
        addSubview(secondTextLabel)
        addSubview(locationImageView)
        
        let textStackView: UIStackView = {
            let stackView = UIStackView(arrangedSubviews: [locationImageView, secondTextLabel])
                stackView.axis = .horizontal
                stackView.spacing = 5
                stackView.translatesAutoresizingMaskIntoConstraints = false
            
//            stackView.backgroundColor = .yellow
                return stackView
        }()
        
        addSubview(textStackView)
        
//        locationStackView.axis = .horizontal
//        locationStackView.spacing = 5
//        addSubview(locationStackView)
//        textStackView.addArrangedSubview(locationStackView)
        
        // Настраиваем ограничения (constraints) для подвидов
        NSLayoutConstraint.activate([
            customImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            customImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            customImageView.widthAnchor.constraint(equalToConstant: 100), // Ширина круглой картинки
            customImageView.heightAnchor.constraint(equalToConstant: 100), // Высота круглой картинки
            
            titleLabel.topAnchor.constraint(equalTo: customImageView.bottomAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            firstTextLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            firstTextLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            firstTextLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            textStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            textStackView.topAnchor.constraint(equalTo: firstTextLabel.bottomAnchor, constant: 5)
            
//            secondTextLabel.topAnchor.constraint(equalTo: firstTextLabel.bottomAnchor, constant: 5),
//            secondTextLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
//            secondTextLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            
//            locationImageView.centerYAnchor.constraint(equalTo: secondTextLabel.centerYAnchor),
//            locationImageView.trailingAnchor.constraint(equalTo: secondTextLabel.leadingAnchor)
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
