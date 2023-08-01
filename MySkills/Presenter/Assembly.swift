//
//  Assembly.swift
//  MySkills
//
//  Created by Nikita Evdokimov on 01.08.23.
//

import Foundation

class MainAssembly {
    
    var view                = MainTableViewController()
    let presenter           = SkillsPresenter()
    let model               = SkillsModel()
    
//    var mainView            = MainViewController()
    
    func createMainPresenter() {
        view.presenter = presenter
        presenter.view = view
        presenter.model  = model
        
//        mainView.skillsViewController        = skillsView
    }
}
