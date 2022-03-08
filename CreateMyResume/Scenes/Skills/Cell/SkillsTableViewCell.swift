//
//  SkillsTableViewCell.swift
//  CreateMyResume
//
//  Created by Zoeb on 06/03/22.
//

import UIKit

protocol SkillsTableViewProtocol: class {
    func didRemoveSkill(skillIndex: Int)
}

class SkillsTableViewCell: UITableViewCell {
    @IBOutlet weak var skillNameLabel: UILabel!
    var skillIndex: Int = 0
    weak var delegate: SkillsTableViewProtocol?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func deleteButtonTapped(_ sender: UIButton) {
        delegate?.didRemoveSkill(skillIndex: skillIndex)
    }

}
