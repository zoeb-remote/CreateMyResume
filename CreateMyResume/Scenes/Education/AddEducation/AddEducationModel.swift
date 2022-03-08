//
//  AddEducationModel.swift
//  CreateMyResume
//
//  Created by Zoeb on 06/03/22.
//

import Foundation

class AddEducationModel: Codable {
    var classDetails: String
    var passingYear: Int
    var percentage: Double
    
    init() {
        self.classDetails = ""
        self.passingYear = 0
        self.percentage = 0
    }
    
}
