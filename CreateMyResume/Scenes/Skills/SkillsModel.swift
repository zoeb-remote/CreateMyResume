//
//  SkillsModel.swift
//  CreateMyResume
//
//  Created by Zoeb on 05/03/22.
//

import Foundation

class SkillContentModel: Codable {
    var skillModels: [AddSkillModel]
    
    init() {
        self.skillModels = [AddSkillModel]()
    }
    
}

class AddSkillModel: Codable {
    var skill: String
    
    init() {
        self.skill = ""
    }
    
}
