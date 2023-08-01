//
//  MainTableViewController.swift
//  MySkills
//
//  Created by Nikita Evdokimov on 01.08.23.
//

import UIKit

protocol SkillsViewProtocol: AnyObject {
    func showSkills(_ skills: Set<String>)
    func showAddSkillAlert()
}

class MainTableViewController: UITableViewController {
    
    var presenter: SkillsPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCustomTitle()

        tableView.register(InfoTableViewCell.self, forCellReuseIdentifier: InfoTableViewCell.identifier)
        tableView.register(SkillsTableViewCell.self, forCellReuseIdentifier: SkillsTableViewCell.identifier)
        
        tableView.isUserInteractionEnabled = true
        
        tableView.separatorStyle = .none // Изменим стиль разделителя на "singleLine"
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0) // Установим нулевой отступ разделител
    }
    
    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 2
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Установка данных для ячейки
        
        switch indexPath.row {
        case 0:
            //конструктор
            let cell = tableView.dequeueReusableCell(withIdentifier: InfoTableViewCell.identifier, for: indexPath) as! InfoTableViewCell

            return cell
        default:
            //        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: SkillsTableViewCell.identifier, for: indexPath) as! SkillsTableViewCell
            
            cell.isUserInteractionEnabled = true
            
            cell.headerImageView.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
            
            cell.skillsNames = ["asdf", "21", "aasdkfjkjl", "kjkj", "asiii", "1234", "iii", "hfhasdf"]
            
            return cell
//        default:
//            print("none")
        }
        
//        return cell
    }
    
    @objc func tapButton() {
        showAlertWithTextField(title: "Добавление навыка", message: "Введите название навыка которым вы владеете", viewController: self) { text in
            print(text!)
        }
        
    }

    
    func setupCustomTitle() {
        let titleLabel = UILabel()
        titleLabel.text = "Профиль"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        titleLabel.sizeToFit()
        
        navigationItem.titleView = titleLabel
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0: return 300
//        case 1: 400
        default: return 500
        }
    }

 
    
    //MARK: Logic
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


extension MainTableViewController: SkillsViewProtocol {
    func showSkills(_ skills: Set<String>) {
        print("showSkills")
    }
    
    func showAddSkillAlert() {
        print("showAddskil")
    }
    
    
}
