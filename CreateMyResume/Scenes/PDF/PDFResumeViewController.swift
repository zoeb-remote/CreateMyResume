//
//  PDFResumeViewController.swift
//  CreateMyResume
//
//  Created by Bigsur on 06/03/22.
//

import UIKit
import PDFGenerator

class PDFResumeViewController: UIViewController {
    
    @IBOutlet private weak var contentView: UIView!
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var phoneLabel: UILabel!
    @IBOutlet private weak var emailLabel: UILabel!
    @IBOutlet private weak var addressLabel: UILabel!
    @IBOutlet private weak var careerObjectiveLabel: UILabel!
    @IBOutlet private weak var experienceLabel: UILabel!
    @IBOutlet private weak var skillsLabel: UILabel!
    @IBOutlet private weak var experienceStackView: UIStackView!
    @IBOutlet private weak var educationStackView: UIStackView!
    @IBOutlet private weak var projectDetailsStackView: UIStackView!
    
    var inputModel: PDFResumeInputModel!
    private lazy var viewModel = PDFResumeViewModel(resumeModel: inputModel.resumeModel)
    
    private var outputAsData: Bool = false
    
    private func getDestinationPath() -> String {
        return NSHomeDirectory() + "/" + viewModel.resumeModel.title.replacingOccurrences(of: " ", with: "_") + ".pdf"
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let pdfPreviewVC = segue.destination as? PDFPreviewViewController, let pdfPath = sender as? String {
            let url = URL(fileURLWithPath: pdfPath)
            pdfPreviewVC.setupWithURL(url)
        }
    }
    
    @IBAction private func generateSamplePDFFromViews(_ sender: AnyObject?) {
        generatePDF()
    }
    
    private func openPDFViewer(_ pdfPath: String) {
        self.performSegue(withIdentifier: PDFResumeViewModel.Constants.previewVCIdentifier, sender: pdfPath)
    }
    
    private func generatePDF() {
        do {
            let dst = getDestinationPath()
            if outputAsData {
                let data = try PDFGenerator.generated(by: [contentView])
                try data.write(to: URL(fileURLWithPath: dst))
            } else {
                try PDFGenerator.generate([contentView], to: dst)
            }
            openPDFViewer(dst)
        } catch let e {
            print(e)
        }
    }
    
    private func setup() {
        let imageName = viewModel.resumeModel.about.picture
        if imageName.isEmpty == false {
            let image = ImageStore.retrieve(imageNamed: imageName)
            imageView.image = image
        } else {
            imageView.isHidden = true
        }
        
        nameLabel.text = viewModel.resumeModel.title
        phoneLabel.text = PDFResumeViewModel.Constants.phoneKey + viewModel.resumeModel.contact.mobile
        emailLabel.text = PDFResumeViewModel.Constants.emailKey + viewModel.resumeModel.contact.email
        addressLabel.text = viewModel.resumeModel.contact.address
        careerObjectiveLabel.text = viewModel.resumeModel.careerObjective.objective
        experienceLabel.text = viewModel.resumeModel.workSummary.totalExperience
        skillsLabel.text = viewModel.skillsText
        
        if viewModel.resumeModel.workSummary.workModels.isEmpty {
            experienceStackView.isHidden = true
        } else {
            for workModel in viewModel.resumeModel.workSummary.workModels {
                let companyNameLabel = UILabel()
                companyNameLabel.font = PDFResumeViewModel.Constants.systemFontMedium
                let durationLabel = UILabel()
                durationLabel.font = PDFResumeViewModel.Constants.systemFont
                companyNameLabel.text = workModel.companyName
                durationLabel.text = workModel.duration
                let stackView = createStackView(views: [companyNameLabel, durationLabel])
                experienceStackView.addArrangedSubview(stackView)
            }
        }
        
        if viewModel.resumeModel.educationDetails.educationModels.isEmpty {
            educationStackView.isHidden = true
        } else {
            for educationModel in viewModel.resumeModel.educationDetails.educationModels {
                let classLabel = UILabel()
                classLabel.font = PDFResumeViewModel.Constants.systemFontMedium
                let passingYearLabel = UILabel()
                passingYearLabel.font = PDFResumeViewModel.Constants.systemFont
                let percentageLabel = UILabel()
                percentageLabel.font = PDFResumeViewModel.Constants.systemFontMedium
                let percentageValueLabel = UILabel()
                percentageValueLabel.font = PDFResumeViewModel.Constants.systemFont
                classLabel.text = educationModel.classDetails
                passingYearLabel.text = "\(educationModel.passingYear)"
                
                percentageLabel.text = PDFResumeViewModel.Constants.percentageKey
                percentageValueLabel.text = "\(educationModel.percentage)"
                let stackView = createStackView(views: [classLabel, passingYearLabel])
                let stackViewPercentage = createStackView(views: [percentageLabel, percentageValueLabel])
                
                let finalStackView = createStackView(views: [stackView, stackViewPercentage], axis: .vertical)
                educationStackView.addArrangedSubview(finalStackView)
            }
        }
        
        if viewModel.resumeModel.projectDetails.projectsModels.isEmpty {
            projectDetailsStackView.isHidden = true
        } else {
            for projectsModel in viewModel.resumeModel.projectDetails.projectsModels {
                let projectNameLabel = UILabel()
                projectNameLabel.font = PDFResumeViewModel.Constants.systemFontMedium
                let projectNameValueLabel = UILabel()
                projectNameValueLabel.font = PDFResumeViewModel.Constants.systemFont
                
                let teamSizeLabel = UILabel()
                teamSizeLabel.font = PDFResumeViewModel.Constants.systemFontMedium
                let teamSizeValueLabel = UILabel()
                teamSizeValueLabel.font = PDFResumeViewModel.Constants.systemFont
                
                let techUsedLabel = UILabel()
                techUsedLabel.font = PDFResumeViewModel.Constants.systemFontMedium
                
                let roleLabel = UILabel()
                roleLabel.font = PDFResumeViewModel.Constants.systemFontMedium
                
                projectNameLabel.text = PDFResumeViewModel.Constants.projectNameKey
                projectNameValueLabel.text = projectsModel.projectName
                teamSizeLabel.text = PDFResumeViewModel.Constants.teamSizeKey
                teamSizeValueLabel.text = "\(projectsModel.teamSize)"
                
                techUsedLabel.text = PDFResumeViewModel.Constants.technologyUsedKey + projectsModel.technologyUsed
                roleLabel.text = PDFResumeViewModel.Constants.roleKey + projectsModel.role
                
                let stackView = createStackView(views: [projectNameLabel, projectNameValueLabel])
                let stackViewTeamSize = createStackView(views: [teamSizeLabel, teamSizeValueLabel])
                
                let finalStackView = createStackView(views: [stackView, stackViewTeamSize, techUsedLabel, roleLabel], axis: .vertical)
                projectDetailsStackView.addArrangedSubview(finalStackView)
            }
        }
        
    }
    
    func createStackView(views: [UIView], axis: NSLayoutConstraint.Axis = .horizontal) -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: views)
        stackView.axis = axis
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 15
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }

}
