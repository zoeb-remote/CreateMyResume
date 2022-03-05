//
//  SkillsViewModel.swift
//  CreateMyResume
//
//  Created by Zoeb on 05/03/22.
//

import Foundation

struct SkillsInputModel {
    let contentModels: [SkillContentModel]
}

class SkillsViewModel {
    var contentModels: [SkillContentModel]
    
    init(contentModels: [SkillContentModel]) {
        self.contentModels = contentModels
    }
}
