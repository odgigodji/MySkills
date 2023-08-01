//
//  DataManager.swift
//  MySkills
//
//  Created by Nikita Evdokimov on 01.08.23.
//

import Foundation

protocol SkillsModelProtocol {
    func getAllSkills() -> Set<String>
    func addSkill(_ skill: String)
    func removeSkill(_ skill: String)
}

class SkillsModel: SkillsModelProtocol {
    private var skillsSet: Set<String> = ["UIKit", "GCD"]
    
    func getAllSkills() -> Set<String> {
        return skillsSet
    }
    
    func addSkill(_ skill: String) {
        skillsSet.insert(skill)
    }
    
    func removeSkill(_ skill: String) {
        skillsSet.remove(skill)
    }
}
