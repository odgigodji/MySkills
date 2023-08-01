//
//  collectionviewcon.swift
//  MySkills
//
//  Created by Nikita Evdokimov on 01.08.23.
//

import UIKit

class SimpleCollectionViewController: UICollectionViewController {

    // Массив данных, которые будут отображаться в коллекции
    let colors: [UIColor] = [.red, .blue, .green, .yellow, .orange, .purple, .cyan]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 100, height: 100) // Установите размер ячейки
        layout.minimumInteritemSpacing = 10 // Установите минимальный интервал между ячейками по горизонтали
        layout.minimumLineSpacing = 10 // Установите минимальный интервал между ячейками по вертикали
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10) // Установите отступы для секции коллекции
        
//        let collectionView = UICollectionView(frame: view.frame)
//        collectionView.delegate = self
//        collectionView.dataSource = self
//        view.addSubview(collectionView)
        
        // Инициализируем UICollectionView с указанием layout
        let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
//
//        // Регистрируем ячейку, которая будет отображать элементы в коллекции
        collectionView.register(ColorCollectionViewCell.self, forCellWithReuseIdentifier: ColorCollectionViewCell.identifier)
//
//        // Назначаем делегата и источник данных для коллекции
        collectionView.dataSource = self
        collectionView.delegate = self
//        view.addSubview(collectionView)
////
//        // Назначаем фон для коллекции
        collectionView.backgroundColor = .white
        
        // ... (остально

    }
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        view.backgroundColor = .yellow
//    }

    // MARK: - UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colors.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // Создаем ячейку
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ColorCollectionViewCell.identifier, for: indexPath) as! ColorCollectionViewCell
        
        // Получаем цвет из массива данных и устанавливаем его для ячейки
        let color = colors[indexPath.item]
        cell.setColor(color)
        
        return cell
    }
    
    
}
