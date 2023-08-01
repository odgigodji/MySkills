//
//  ViewController.swift
//  MySkills
//
//  Created by Nikita Evdokimov on 01.08.23.
//

import UIKit


class MainViewController: UIViewController {

//    var output: MainPresenterOutput!
    
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
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(logoTapped))
        logoImageView.isUserInteractionEnabled = true
        logoImageView.addGestureRecognizer(tapGesture)
    }

    @objc func logoTapped() {
        // Ваш код для обработки нажатия на логотип
        print("Логотип был нажат!")
//        showAlert(title: "Добавление навыка", message: "Введите название навыка которым вы владеете", viewController: self)
        showAlertWithTextField(title: "Добавление навыка", message: "Введите название навыка которым вы владеете", viewController: self) { text in
//            if text == nil {
//                print("empty")
//            } else {
//                print(text!)
//            }
        }
    }
    
//    func showAlert(title: String, message: String, viewController: UIViewController) {
//        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
//        let addAction = UIAlertAction(title: "Добавить", style: .default, handler: nil)
//        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
//
//        alert.addAction(addAction)
//        alert.addAction(cancelAction)
//
//        viewController.present(alert, animated: true, completion: nil)
//    }
    
    func showAlertWithTextField(title: String, message: String, viewController: UIViewController, completion: @escaping (String?) -> Void) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        // Добавляем текстовое поле в алерт
        alert.addTextField { textField in
            textField.placeholder = "Введите название"
        }
        
        // Добавляем кнопку "Отмена" с обработчиком действия
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel) { _ in
            completion(nil) // Вызываем обработчик с nil, чтобы указать, что пользователь отменил ввод
        }
        alert.addAction(cancelAction)
        
        // Добавляем кнопку "Добавить" с обработчиком действия
        let addAction = UIAlertAction(title: "Добавить", style: .default) { _ in
            if let textField = alert.textFields?.first, let text = textField.text {
                completion(text) // Вызываем обработчик с введенным текстом
            } else {
                completion(nil) // Вызываем обработчик с nil, если текст не был введен
            }
        }
        alert.addAction(addAction)
        
        viewController.present(alert, animated: true, completion: nil)
    }


}

//extension MainViewController: MainPresenterInput {
//    func setTraineeDirections() {
//        //        traineeDirections = output.getTraineeDirection()
//    }
//}
