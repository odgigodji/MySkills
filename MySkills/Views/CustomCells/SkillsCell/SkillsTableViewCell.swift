//
//  SkillsTableViewCell.swift
//  MySkills
//
//  Created by Nikita Evdokimov on 01.08.23.
//

import UIKit

class SkillsTableViewCell: UITableViewCell {
    
    var skillsNames: [String] = []
    static let identifier = "SkillsTableViewCell"

    let headerLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Мои навыки"
        
        label.backgroundColor = .blue
        return label
    }()
    
    let settingsButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.setBackgroundImage(UIImage(systemName: "pencil"), for: .normal)
        button.isUserInteractionEnabled = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = 10
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(SkillCollectionViewCell.self, forCellWithReuseIdentifier: SkillCollectionViewCell.identifier)
        
        collectionView.backgroundColor = .yellow
        
        return collectionView
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
//        isUserInteractionEnabled = true
        selectionStyle = .none
        
        backgroundColor = .green
        
        contentView.addSubview(settingsButton)
        addSubview(headerLabel)
        addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            headerLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            headerLabel.heightAnchor.constraint(equalToConstant: 24),
            
            settingsButton.topAnchor.constraint(equalTo: headerLabel.topAnchor),
            settingsButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            settingsButton.heightAnchor.constraint(equalTo: headerLabel.heightAnchor),
            settingsButton.widthAnchor.constraint(equalTo: settingsButton.heightAnchor),
            
            collectionView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 10),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
//            collectionView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


extension SkillsTableViewCell: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        print("STVC: \(skillsNames)")
        return skillsNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SkillCollectionViewCell.identifier, for: indexPath) as! SkillCollectionViewCell
        cell.titleLabel.text = skillsNames[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let text = skillsNames[indexPath.item]
        let width = text.size(withAttributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16)]).width + 20
        return CGSize(width: width, height: 44)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(skillsNames[indexPath.row])
        if skillsNames[indexPath.row] == "+" {
            print("ADD ELEM")
        }
    }
}


extension SkillsTableViewCell: MainTableViewControllerDelegate {
    func editingDidTapped() {
        skillsNames.append("+")
        collectionView.reloadData()
    }
    
    func dataDidUpdate(newData: [String]) {
        skillsNames = newData
        collectionView.reloadData()
    }
    
    func didPressPlus() {
        
    }
}
