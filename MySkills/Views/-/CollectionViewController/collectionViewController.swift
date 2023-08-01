//
//  collectionViewController.swift
//  MySkills
//
//  Created by Nikita Evdokimov on 01.08.23.
//

import UIKit

class MainCollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        setupCustomTitle()

//        collectionView.register(InfoCollectionViewCell.self, forCellWithReuseIdentifier: InfoCollectionViewCell.identifier)
//        collectionView.register(SkillsCollectionViewCell.self, forCellWithReuseIdentifier: SkillsCollectionViewCell.identifier)

        collectionView.backgroundColor = .blue
//        collectionView.showsVerticalScrollIndicator = false
    }
    
    // MARK: - UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        switch indexPath.item {
//        case 0:
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: InfoCollectionViewCell.identifier, for: indexPath) as! InfoCollectionViewCell
        let cell = UICollectionViewCell()
            return cell
//        default:
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SkillsCollectionViewCell.identifier, for: indexPath) as! SkillsCollectionViewCell
//            cell.skillsNames = ["asdf", "21", "aasdkfjkjl", "kjkj", "asiii", "1234", "iii", "hfhasdf"]
//            return cell
//        }
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        switch indexPath.item {
//        case 0:
            return CGSize(width: collectionView.frame.width, height: 300)
//        default:
//            return CGSize(width: collectionView.frame.width, height: 500)
//        }
    }
    
    // ...

    func setupCustomTitle() {
        let titleLabel = UILabel()
        titleLabel.text = "Профиль"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        titleLabel.sizeToFit()
        
        navigationItem.titleView = titleLabel
    }
}
