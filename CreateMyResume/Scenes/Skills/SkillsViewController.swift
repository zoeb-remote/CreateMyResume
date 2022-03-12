//
//  SkillsViewController.swift
//  CreateMyResume
//
//  Created by Zoeb on 05/03/22.
//

import UIKit

class SkillsViewController: UIViewController {
    
    @IBOutlet private weak var skillsTextField: UITextField!
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var tableViewHeightLC: NSLayoutConstraint!
    
    weak var delegate: NextActionProtocol?
    
    var inputModel: SkillsInputModel!
    private lazy var viewModel = SkillsViewModel(contentModel: inputModel.contentModel)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refresh()
    }
    
    @IBAction private func nextButtonTapped(_ sender: UIButton) {
        delegate?.performNext(identifier: ContentsViewModel.SegueIdentifier.education.rawValue)
    }
    
    @IBAction private func addButtonTapped(_ sender: UIButton) {
        if let skill = skillsTextField.text, skill.isEmpty == false {
            didAddSkill(skill)
            skillsTextField.text = ""
        }
    }
    
}

extension SkillsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = self.viewModel.contentModel.skillModels.count
        tableView.isHidden = count == 0
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SkillsViewModel.Constants.cellIdentifier, for: indexPath) as? SkillsTableViewCell else {
            return UITableViewCell()
        }
        
        let model = self.viewModel.contentModel.skillModels[indexPath.item]
        cell.skillNameLabel.text = model.skill
        cell.skillIndex = indexPath.item
        cell.delegate = self
        
        return cell
    }
}

private extension SkillsViewController {
    
    func refresh() {
        tableViewHeightLC.constant = viewModel.tableViewHeight
        self.view.layoutIfNeeded()
        self.tableView.reloadData()
    }
    
    func didAddSkill(_ skill: String) {
        let skillModel = AddSkillModel()
        skillModel.skill = skill
        self.viewModel.contentModel.skillModels.append(skillModel)
        refresh()
    }
}

extension SkillsViewController: SkillsTableViewProtocol {
    func didRemoveSkill(skillIndex: Int) {
        self.viewModel.contentModel.skillModels.remove(at: skillIndex)
        refresh()
    }
}
