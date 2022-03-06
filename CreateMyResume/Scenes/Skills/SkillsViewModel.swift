//
//  SkillsViewModel.swift
//  CreateMyResume
//
//  Created by Zoeb on 05/03/22.
//

import Foundation
import UIKit

struct SkillsInputModel {
    let contentModels: [SkillContentModel]
}

class SkillsViewModel {
    enum Constants {
        static let cellHeight: CGFloat = 90
        static let cellIdentifier = "SkillsTableViewCellIdentifier"
    }
    var contentModels: [SkillContentModel]
    
    init(contentModels: [SkillContentModel]) {
        self.contentModels = contentModels
    }
    
    var tableViewHeight: CGFloat {
        let count = CGFloat(self.contentModels.count)
        return Constants.cellHeight * count
    }
}
