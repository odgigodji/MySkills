//
//  MainPresenter.swift
//  MySkills
//
//  Created by Nikita Evdokimov on 01.08.23.
//

import Foundation

protocol SkillsPresenterProtocol {
    func viewDidLoad()
    func addSkillButtonTapped(name: String)
    func removeSkillButtonTapped(skill: String)
}

class SkillsPresenter: SkillsPresenterProtocol {
    
    weak var view: SkillsViewProtocol!
    var model: SkillsModelProtocol!
    
    func updateSkills() {
        print("PRESENTER: updateSkills")
        let skills = model.getAllSkills()
        view?.showSkills(skills)
    }
    
    func addSkillButtonTapped(name: String) {
        print("PRESENTER: addskills")
        model.addSkill(name)
        updateSkills()
    }
    
    func removeSkillButtonTapped(skill: String) {
        print("PRESENTER: removeskills")
        model.removeSkill(skill)
        updateSkills()
    }
    
    
    func viewDidLoad() {
        updateSkills()
    }
    
}
