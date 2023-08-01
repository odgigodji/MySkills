//
//  CustomCell.swift
//  MySkills
//
//  Created by Nikita Evdokimov on 01.08.23.
//

//fix second label lenght
import UIKit

class InfoTableViewCell: UITableViewCell {
    
    static let identifier = "InfoTableViewCell"
    
    let customImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 50
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let firstTextLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let secondTextLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let locationImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "mappin.and.ellipse"))
        imageView.tintColor = .systemGray
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        customImageView.image = UIImage(named: "imageName")
        titleLabel.text = "Иванов Иван Иванович"
        firstTextLabel.text = "Миддл опыт более 2х лет, лаодлофвыоа офывдлао жлдфоывладо жфдлыова ждлфовлао"
        secondTextLabel.text = "Ростов на дону"
        
        isUserInteractionEnabled = false
        
        addSubview(customImageView)
        addSubview(titleLabel)
        addSubview(firstTextLabel)
        addSubview(secondTextLabel)
        addSubview(locationImageView)
        
        let locationTextStackView: UIStackView = {
            let stackView = UIStackView(arrangedSubviews: [locationImageView, secondTextLabel])
            stackView.axis = .horizontal
            stackView.spacing = 5
            stackView.translatesAutoresizingMaskIntoConstraints = false
            
            return stackView
        }()
        
        addSubview(locationTextStackView)
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
            
            locationTextStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            locationTextStackView.topAnchor.constraint(equalTo: firstTextLabel.bottomAnchor, constant: 5)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
