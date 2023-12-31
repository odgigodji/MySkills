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

protocol MainTableViewControllerDelegate: AnyObject {
    func dataDidUpdate(newData: [String])
    func editingDidTapped()
}

class MainTableViewController: UITableViewController {
    
    weak var delegate: MainTableViewControllerDelegate?
    
    var skills = Set<String>()
    var presenter: SkillsPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCustomTitle()

        tableView.register(InfoTableViewCell.self, forCellReuseIdentifier: InfoTableViewCell.identifier)
        tableView.register(SkillsTableViewCell.self, forCellReuseIdentifier: SkillsTableViewCell.identifier)
        tableView.register(AboutTableViewCell.self, forCellReuseIdentifier: AboutTableViewCell.identifier)
        
        tableView.isUserInteractionEnabled = true
        
        tableView.separatorStyle = .none
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        skills = presenter.model.getAllSkills()
        
    }
    
    
    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 3
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: InfoTableViewCell.identifier, for: indexPath) as! InfoTableViewCell
            return cell
            
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: SkillsTableViewCell.identifier, for: indexPath) as! SkillsTableViewCell
            delegate = cell
            cell.delegate = self
            
            cell.isUserInteractionEnabled = true
            cell.settingsButton.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
            cell.skillsNames = Array(skills)
            
            print("VIEW: Skildls name \(skills)")
            
            return cell
            
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: AboutTableViewCell.identifier, for: indexPath) as! AboutTableViewCell
            return cell
        }
    }
    
    @objc func tapButton() {
        print("TAP BUTTON ON VC")
        
        delegate?.editingDidTapped()

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
        case 0: return 250
        case 1: return 300
        default: return 200
        }
    }
    
    
    //MARK: Logic
    func showAlertWithTextField(title: String, message: String, viewController: UIViewController, completion: @escaping (String?) -> Void) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addTextField { textField in
            textField.placeholder = "Введите название"
        }
        
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel) { _ in
            completion(nil)
        }
        alert.addAction(cancelAction)
        
        let addAction = UIAlertAction(title: "Добавить", style: .default) { _ in
            if let textField = alert.textFields?.first, let text = textField.text {
                completion(text)
//                self.delegate?.editingDidTapped()
            } else {
                completion(nil)
            }
        }
        alert.addAction(addAction)
        viewController.present(alert, animated: true, completion: nil)
    }

}


extension MainTableViewController: SkillsViewProtocol {
    func showSkills(_ skills: Set<String>) {
        print("VIEW: showSkills")
        self.skills = presenter.model.getAllSkills()
        self.delegate?.dataDidUpdate(newData: Array(self.skills))
        tableView.reloadData()
    }
    
    func showAddSkillAlert() {
        print("VIEW: showAddskilALERT")
    }
    
}

extension MainTableViewController: SkillsTableViewCellProtocol {
    func removeSkill(name: String) {
        self.presenter.removeSkillButtonTapped(skill: name)
        self.tableView.reloadData()
    }
    
    func plusDidTapped() {
        showAlertWithTextField(title: "Добавление навыка", message: "Введите название навыка которым вы владеете", viewController: self) { text in
            guard let text = text else {
                return
            }
            self.presenter.addSkillButtonTapped(name: text)
            self.tableView.reloadData()
        }
    }
    
    
}
