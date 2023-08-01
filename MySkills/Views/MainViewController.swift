//
//  ViewController.swift
//  MySkills
//
//  Created by Nikita Evdokimov on 01.08.23.
//

import UIKit

class MainViewController: UIViewController {

    var output: MainPresenterOutput!
    
    override func viewDidLoad() {
//        print("tadam")
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .yellow
        
        let logoImageView = UIImageView(image: UIImage(named: "your_logo_image_name"))
               logoImageView.contentMode = .scaleAspectFit // Установите режим отображения по необходимости
               
               // Добавляем логотип на главный экран
               view.addSubview(logoImageView)
               
               // Устанавливаем ограничения (constraints) для центрирования логотипа
               logoImageView.translatesAutoresizingMaskIntoConstraints = false
               NSLayoutConstraint.activate([
                   logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                   logoImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                   logoImageView.widthAnchor.constraint(equalToConstant: 200), // Установите ширину логотипа по необходимости
                   logoImageView.heightAnchor.constraint(equalToConstant: 100) // Установите высоту логотипа по необходимости
               ])
    }

}

extension MainViewController: MainPresenterInput {
    func setTraineeDirections() {
        //        traineeDirections = output.getTraineeDirection()
    }
}
