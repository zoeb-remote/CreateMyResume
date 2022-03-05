//
//  WorkViewController.swift
//  CreateMyResume
//
//  Created by Zoeb on 05/03/22.
//

import UIKit

class WorkViewController: UIViewController {
    
    @IBOutlet weak var totalExperienceTextField: UITextField!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var addButton: UIButton!
    
    weak var delegate: NextActionProtocol?
    
    var inputModel: WorkInputModel!
    private lazy var viewModel = WorkViewModel(contentModel: inputModel.contentModel)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalExperienceTextField.text = viewModel.contentModel.totalExperience
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? AddWorkViewController {
            vc.delegate = self
        }
    }
    
    @IBAction func nextButtonTapped(_ sender: UITapGestureRecognizer) {
        viewModel.contentModel.totalExperience = totalExperienceTextField.text ?? ""
        delegate?.performNext(identifier: ContentsViewModel.SegueIdentifier.skills.rawValue)
    }
    
}

private extension WorkViewController {
    func refreshWorkList() {
        
    }
}

extension WorkViewController: AddWorkViewControllerProtocol {
    func didAddWork(model: AddWorkViewModel) {
        self.viewModel.contentModel.workModels.append(model.contentModel)
        refreshWorkList() 
    }
}
