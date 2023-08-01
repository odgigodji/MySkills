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
    
    weak var skillsView: SkillsViewProtocol!
    var model: SkillsModelProtocol!
    
    func updateSkills() {
        let skills = model.getAllSkills()
        skillsView?.showSkills(skills)
    }
    
    func addSkillButtonTapped(name: String) {
        model.addSkill(name)
        updateSkills()
    }
    
    func removeSkillButtonTapped(skill: String) {
        model.removeSkill(skill)
        updateSkills()
    }
    
    
    func viewDidLoad() {
        updateSkills()
    }
    
}
