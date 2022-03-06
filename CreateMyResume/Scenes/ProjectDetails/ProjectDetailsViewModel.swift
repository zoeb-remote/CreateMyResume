//
//  ProjectDetailsViewModel.swift
//  CreateMyResume
//
//  Created by Zoeb on 05/03/22.
//

import Foundation
import UIKit

struct ProjectDetailsInputModel {
    let contentModel: ProjectDetailsContentModel
}

class ProjectDetailsViewModel {
    enum Constants {
        static let cellHeight: CGFloat = 300
        static let cellIdentifier = "ProjectDetailsTableViewCellIdentifier"
    }
    var contentModel: ProjectDetailsContentModel
    
    init(contentModel: ProjectDetailsContentModel) {
        self.contentModel = contentModel
    }
    
    var tableViewHeight: CGFloat {
        let isEmpty = self.contentModel.projectsModels.isEmpty
        return isEmpty ? 0 : Constants.cellHeight
    }
}
