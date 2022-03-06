//
//  AddProjectViewController.swift
//  CreateMyResume
//
//  Created by Bigsur on 06/03/22.
//

import UIKit

protocol AddProjectViewControllerProtocol: class {
    func didAddProject(model: AddProjectViewModel)
}

class AddProjectViewController: UIViewController {
    @IBOutlet weak var projectNameTextField: UITextField!
    @IBOutlet weak var teamSizeTextField: UITextField!
    @IBOutlet weak var summaryTextField: UITextField!
    @IBOutlet weak var techUsedTextField: UITextField!
    @IBOutlet weak var roleTextField: UITextField!
    
    private lazy var viewModel = AddProjectViewModel(contentModel: AddProjectModel())
    weak var delegate: AddProjectViewControllerProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        viewModel.contentModel.projectName = projectNameTextField.text ?? ""
        viewModel.contentModel.teamSize = Int(teamSizeTextField.text ?? "1") ?? 1
        viewModel.contentModel.summary = summaryTextField.text ?? ""
        viewModel.contentModel.technologyUsed = techUsedTextField.text ?? ""
        viewModel.contentModel.role = roleTextField.text ?? ""
        
        delegate?.didAddProject(model: viewModel)
        self.dismiss(animated: true, completion: nil)
    }

}
