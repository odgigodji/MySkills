//
//  Assembly.swift
//  MySkills
//
//  Created by Nikita Evdokimov on 01.08.23.
//

import Foundation

class MainAssembly {
    
    var skillsView          = SkillsViewController()
    let presenter           = SkillsPresenter()
    let skillsModel         = SkillsModel()
    
//    var mainView            = MainViewController()
    
    func createMainPresenter() {
        skillsView.presenter = presenter
        presenter.skillsView = skillsView
        presenter.model      = skillsModel
        
//        mainView.skillsViewController        = skillsView
    }
}
