//
//  CareerObjectiveViewController.swift
//  CreateMyResume
//
//  Created by Zoeb on 05/03/22.
//

import UIKit

class CareerObjectiveViewController: UIViewController {
    
    @IBOutlet weak var careerObjectiveTextView: UITextView!
    
    weak var delegate: NextActionProtocol?
    
    var inputModel: CareerObjectiveInputModel!
    private lazy var viewModel = CareerObjectiveViewModel(contentModel: inputModel.contentModel)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        careerObjectiveTextView.text = viewModel.contentModel.objective
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        viewModel.contentModel.objective = careerObjectiveTextView.text ?? ""
        delegate?.performNext(identifier: ContentsViewModel.SegueIdentifier.work.rawValue)
    }

}
