//
//  WorkViewModel.swift
//  CreateMyResume
//
//  Created by Zoeb on 05/03/22.
//

import Foundation

struct WorkInputModel {
    let contentModel: WorkContentModel
}

class WorkViewModel {
    var contentModel: WorkContentModel
    
    init(contentModel: WorkContentModel) {
        self.contentModel = contentModel
    }
}
