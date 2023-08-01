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
        print("MODEL: get all skills")
        return skillsSet
    }
    
    func addSkill(_ skill: String) {
        print("MODEL: add")
        skillsSet.insert(skill)
        print(skillsSet)
    }
    
    func removeSkill(_ skill: String) {
        print("MODEL: remove")
        skillsSet.remove(skill)
    }
}
