//
//  AboutTableViewCell.swift
//  MySkills
//
//  Created by Nikita Evdokimov on 01.08.23.
//

import UIKit

class AboutTableViewCell: UITableViewCell {
    
    static let identifier = "AboutTableViewCell"

    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let firstTextLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier) 

        titleLabel.text = "О себе"
        firstTextLabel.text = "Был ответственным за координацию команды по продажам из 5 человек. За 6 месяцев работы в команде мне удалось достичь увеличения выручки на 20%"
        
        addSubview(titleLabel)
        addSubview(firstTextLabel)
        
        NSLayoutConstraint.activate([
            
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            firstTextLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            firstTextLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            firstTextLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)

        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
