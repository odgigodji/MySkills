//
//  MainPresenter.swift
//  MySkills
//
//  Created by Nikita Evdokimov on 01.08.23.
//

import Foundation

protocol MainPresenterOutput: AnyObject {
    func getTraineeDirection() -> [String]
}

protocol MainPresenterInput: AnyObject {
    func setTraineeDirections()
}

final class MainPresenter: MainPresenterOutput {
   
    weak var view: MainPresenterInput!
    
//    var dataManager: DataManager!
    
    func getTraineeDirection() -> [String] {
        ["he", "hee"]
//        dataManager.getTraineeDirections()
    }
}
