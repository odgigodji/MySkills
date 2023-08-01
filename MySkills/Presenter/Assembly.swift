//
//  Assembly.swift
//  MySkills
//
//  Created by Nikita Evdokimov on 01.08.23.
//

import Foundation

class MainAssembly {
    
    var view                = SkillsViewController()
    let presenter           = SkillsPresenter()
    let skillsModel         = SkillsModel()
    
    func createMainPresenter() {
//        view.output                 = presenter
        view.presenter = presenter
        
//        presenter.view              = view
        presenter.skillsView = view
        presenter.model      = skillsModel
    }
}
