//
//  CareerObjectiveViewModel.swift
//  CreateMyResume
//
//  Created by Zoeb on 05/03/22.
//

import Foundation

struct CareerObjectiveInputModel {
    let contentModel: CareerObjectiveContentModel
}

class CareerObjectiveViewModel {
    var contentModel: CareerObjectiveContentModel
    
    init(contentModel: CareerObjectiveContentModel) {
        self.contentModel = contentModel
    }
}
