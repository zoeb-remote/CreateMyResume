//
//  EducationModel.swift
//  CreateMyResume
//
//  Created by Zoeb on 05/03/22.
//

import Foundation

class EducationContentModel: Codable {
    var educationModels: [AddEducationModel]
    
    init() {
        self.educationModels = [AddEducationModel]()
    }
    
}
