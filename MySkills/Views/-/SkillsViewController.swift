//
//  SkillsViewController.swift
//  MySkills
//
//  Created by Nikita Evdokimov on 01.08.23.
//

import UIKit

//protocol SkillsViewProtocol: AnyObject {
//    func showSkills(_ skills: Set<String>)
//    func showAddSkillAlert()
//}

class SkillsViewController: UIViewController, SkillsViewProtocol {
    
    var presenter: SkillsPresenterProtocol!
    var skills = Set<String>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = .green
//        presenter.viewDidLoad()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(tapGesture)
    }

    @objc func viewTapped() {
        showAddSkillAlert()
    }
    
    func showSkills(_ skills: Set<String>) {
        self.skills = skills // Сортируем, чтобы отобразить в алфавитном порядке
//        tableView.reloadData()
        print(self.skills)
    }
    
    func showAddSkillAlert() {
        let alert = UIAlertController(title: "Добавить навык", message: "Введите название навыка", preferredStyle: .alert)
        alert.addTextField { textField in
            textField.placeholder = "Название навыка"
        }
        
        let addAction = UIAlertAction(title: "Добавить", style: .default) { [weak self] _ in
            if let text = alert.textFields?.first?.text, !text.isEmpty {
                self?.presenter.addSkillButtonTapped(name: text)
            }
        }
        
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        
        alert.addAction(addAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    // ...
    // Реализация логики для кнопки редактирования и добавления навыков
    // ...
}
