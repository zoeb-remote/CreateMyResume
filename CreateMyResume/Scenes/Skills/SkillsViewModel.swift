//
//  SkillsViewModel.swift
//  CreateMyResume
//
//  Created by Zoeb on 05/03/22.
//

import Foundation
import UIKit

struct SkillsInputModel {
    let contentModel: SkillContentModel
}

class SkillsViewModel {
    enum Constants {
        static let cellHeight: CGFloat = 90
        static let cellIdentifier = "SkillsTableViewCellIdentifier"
        static let emptySkillMessage = "Enter Skill first"
    }
    var contentModel: SkillContentModel
    
    init(contentModel: SkillContentModel) {
        self.contentModel = contentModel
    }
    
    var tableViewHeight: CGFloat {
        let count = CGFloat(self.contentModel.skillModels.count)
        return Constants.cellHeight * count
    }
}
