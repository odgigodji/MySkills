//
//  Assembly.swift
//  MySkills
//
//  Created by Nikita Evdokimov on 01.08.23.
//

import Foundation

class MainAssembly {
    
    var view                = MainViewController()
    let presenter           = MainPresenter()
//    let dataManager         = DataManagerImpl()
    
    func createMainPresenter() {
        view.output                 = presenter
        
        presenter.view              = view
//        presenter.dataManager       = dataManager
    }
}
