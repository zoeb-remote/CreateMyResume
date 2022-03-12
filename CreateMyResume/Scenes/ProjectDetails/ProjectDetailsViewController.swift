//
//  ProjectDetailsViewController.swift
//  CreateMyResume
//
//  Created by Zoeb on 05/03/22.
//

import UIKit

class ProjectDetailsViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var tableViewHeightLC: NSLayoutConstraint!
    
    weak var delegate: NextActionProtocol?
    
    var inputModel: ProjectDetailsInputModel!
    private lazy var viewModel = ProjectDetailsViewModel(contentModel: inputModel.contentModel)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refresh()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? AddProjectViewController {
            vc.delegate = self
        }
    }
    
    private func refresh() {
        tableViewHeightLC.constant = viewModel.tableViewHeight
        self.view.layoutIfNeeded()
        self.tableView.reloadData()
    }
    
    @IBAction private func nextButtonTapped(_ sender: UIButton) {
        delegate?.performNext(identifier: ContentsViewModel.SegueIdentifier.pdfPreview.rawValue)
    }
    
}

extension ProjectDetailsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = self.viewModel.contentModel.projectsModels.count
        tableView.isHidden = count == 0
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProjectDetailsViewModel.Constants.cellIdentifier, for: indexPath) as? ProjectDetailsTableViewCell else {
            return UITableViewCell()
        }
        
        let model = self.viewModel.contentModel.projectsModels[indexPath.item]
        cell.projectNameLabel.text = model.projectName
        cell.teamSizeLabel.text = "Team Size: \(model.teamSize)"
        cell.summaryLabel.text = "Summary: \(model.summary)"
        cell.techUsedLabel.text = "Technology used: \(model.technologyUsed)"
        cell.roleLabel.text = "Role: \(model.role)"
        cell.projectIndex = indexPath.item
        cell.delegate = self
        
        return cell
    }
}

extension ProjectDetailsViewController: AddProjectViewControllerProtocol {
    func didAddProject(model: AddProjectViewModel) {
        self.viewModel.contentModel.projectsModels.append(model.contentModel)
        refresh()
    }
}

extension ProjectDetailsViewController: ProjectDetailsTableViewCellProtocol {
    func didRemoveProject(projectIndex: Int) {
        self.viewModel.contentModel.projectsModels.remove(at: projectIndex)
        refresh()
    }
}
