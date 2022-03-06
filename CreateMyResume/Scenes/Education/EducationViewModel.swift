//
//  EducationViewModel.swift
//  CreateMyResume
//
//  Created by Zoeb on 05/03/22.
//

import Foundation
import UIKit

struct EducationInputModel {
    let contentModel: EducationContentModel
}

class EducationViewModel {
    enum Constants {
        static let cellHeight: CGFloat = 140
        static let cellIdentifier = "EducationDetailsTableViewCellIdentifier"
    }
    var contentModel: EducationContentModel
    
    init(contentModel: EducationContentModel) {
        self.contentModel = contentModel
    }
    
    var tableViewHeight: CGFloat {
        let count = CGFloat(self.contentModel.educationModels.count)
        return Constants.cellHeight * count
    }
}
