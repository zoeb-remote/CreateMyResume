//
//  ProjectDetailsTableViewCell.swift
//  CreateMyResume
//
//  Created by Bigsur on 06/03/22.
//

import UIKit

protocol ProjectDetailsTableViewCellProtocol: class {
    func didRemoveProject(projectIndex: Int)
}

class ProjectDetailsTableViewCell: UITableViewCell {
    @IBOutlet weak var projectNameLabel: UILabel!
    @IBOutlet weak var teamSizeLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var techUsedLabel: UILabel!
    @IBOutlet weak var roleLabel: UILabel!
    
    var projectIndex: Int = 0
    weak var delegate: ProjectDetailsTableViewCellProtocol?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func deleteButtonTapped(_ sender: UIButton) {
        delegate?.didRemoveProject(projectIndex: projectIndex)
    }

}
