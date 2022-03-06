//
//  AddEducationViewController.swift
//  CreateMyResume
//
//  Created by Bigsur on 06/03/22.
//

import UIKit

protocol AddEducationViewControllerProtocol: class {
    func didAddEducation(model: AddEducationViewModel)
}

class AddEducationViewController: UIViewController {
    @IBOutlet weak var classTextField: UITextField!
    @IBOutlet weak var passingYearTextField: UITextField!
    @IBOutlet weak var percentageTextField: UITextField!
    
    private lazy var viewModel = AddEducationViewModel(contentModel: AddEducationModel())
    weak var delegate: AddEducationViewControllerProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        viewModel.contentModel.classDetails = classTextField.text ?? ""
        viewModel.contentModel.passingYear = Int(passingYearTextField.text ?? "1990") ?? 1990
        viewModel.contentModel.percentage = Double(percentageTextField.text ?? "0") ?? 0
        
        delegate?.didAddEducation(model: viewModel)
        self.dismiss(animated: true, completion: nil)
    }

}
