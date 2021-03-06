//
//  ContentsViewController.swift
//  CreateMyResume
//
//  Created by Zoeb on 05/03/22.
//

import UIKit

class ContentsViewController: BaseViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    var inputModel: ContentsInputModel!
    private lazy var viewModel = ContentsViewModel(resume: inputModel.resume)

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? AboutViewController {
            vc.inputModel = AboutInputModel(contentModel: viewModel.resume.about, resumeId: viewModel.resume.resumeId)
            vc.delegate = self
        } else if let vc = segue.destination as? ContactViewController {
            vc.inputModel = ContactInputModel(contentModel: viewModel.resume.contact)
            vc.delegate = self
        } else if let vc = segue.destination as? CareerObjectiveViewController {
            vc.inputModel = CareerObjectiveInputModel(contentModel: viewModel.resume.careerObjective)
            vc.delegate = self
        } else if let vc = segue.destination as? WorkViewController {
            vc.inputModel = WorkInputModel(contentModel: viewModel.resume.workSummary)
            vc.delegate = self
        } else if let vc = segue.destination as? SkillsViewController {
            vc.inputModel = SkillsInputModel(contentModel: viewModel.resume.skills)
            vc.delegate = self
        } else if let vc = segue.destination as? EducationViewController {
            vc.inputModel = EducationInputModel(contentModel: viewModel.resume.educationDetails)
            vc.delegate = self
        } else if let vc = segue.destination as? ProjectDetailsViewController {
            vc.inputModel = ProjectDetailsInputModel(contentModel: viewModel.resume.projectDetails)
            vc.delegate = self
        } else if let vc = segue.destination as? PDFResumeViewController {
            vc.inputModel = PDFResumeInputModel(resumeModel: viewModel.resume)
        }
    }

}

//MARK: - UITableViewDataSource and UITableViewDelegate

extension ContentsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.records.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: viewModel.cellIdentifier, for: indexPath)
        
        //Default Content Configuration
        var content = cell.defaultContentConfiguration()
        content.text = viewModel.records[indexPath.item]
        let imageName = ContentsViewModel.ContentItem.allCases[indexPath.item].rawValue
        content.image = UIImage(systemName: imageName)
        
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let identifier = ContentsViewModel.SegueIdentifier.allCases[indexPath.item].rawValue
        performSegue(withIdentifier: identifier, sender: self)
    }
}

//MARK: - NextActionProtocol

extension ContentsViewController: NextActionProtocol {
    func performNext(identifier: String) {
        ResumeViewModel.writeResume(self.viewModel.resume)
        
        self.navigationController?.popViewController(animated: false)
        performSegue(withIdentifier: identifier, sender: self)
    }
}
