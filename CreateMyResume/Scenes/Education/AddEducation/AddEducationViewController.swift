//
//  AddEducationViewController.swift
//  CreateMyResume
//
//  Created by Zoeb on 06/03/22.
//

import UIKit

protocol AddEducationViewControllerProtocol: AnyObject {
    func didAddEducation(model: AddEducationViewModel)
}

class AddEducationViewController: BaseViewController {
    @IBOutlet private weak var classTextField: ValidatorTextField!
    @IBOutlet private weak var passingYearTextField: ValidatorTextField!
    @IBOutlet private weak var percentageTextField: ValidatorTextField!
    
    private lazy var viewModel = AddEducationViewModel(contentModel: AddEducationModel())
    weak var delegate: AddEducationViewControllerProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction private func saveButtonTapped(_ sender: UIButton) {
        guard isFormValid else { return }
        
        viewModel.contentModel.classDetails = classTextField.text ?? ""
        viewModel.contentModel.passingYear = Int(passingYearTextField.text ?? "1990") ?? 1990
        viewModel.contentModel.percentage = Double(percentageTextField.text ?? "0") ?? 0
        
        delegate?.didAddEducation(model: viewModel)
        self.dismiss(animated: true, completion: nil)
    }

}
