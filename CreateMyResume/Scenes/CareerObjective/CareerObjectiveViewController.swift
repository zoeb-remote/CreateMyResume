//
//  CareerObjectiveViewController.swift
//  CreateMyResume
//
//  Created by Zoeb on 05/03/22.
//

import UIKit

class CareerObjectiveViewController: BaseViewController {
    
    @IBOutlet private weak var careerObjectiveTextView: ValidatorTextView!
    
    weak var delegate: NextActionProtocol?
    
    var inputModel: CareerObjectiveInputModel!
    private lazy var viewModel = CareerObjectiveViewModel(contentModel: inputModel.contentModel)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        careerObjectiveTextView.text = viewModel.contentModel.objective
    }
    
    @IBAction private func nextButtonTapped(_ sender: UIButton) {
        guard isFormValid else { return }
        
        viewModel.contentModel.objective = careerObjectiveTextView.text ?? ""
        delegate?.performNext(identifier: ContentsViewModel.SegueIdentifier.work.rawValue)
    }

}
