//
//  PDFResumeViewController.swift
//  CreateMyResume
//
//  Created by Bigsur on 06/03/22.
//

import UIKit
import PDFGenerator

class PDFResumeViewController: UIViewController {
    
    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var careerObjectiveLabel: UILabel!
    @IBOutlet weak var experienceLabel: UILabel!
    @IBOutlet weak var skillsLabel: UILabel!
    @IBOutlet weak var experienceStackView: UIStackView!
    @IBOutlet weak var educationStackView: UIStackView!
    @IBOutlet weak var projectDetailsStackView: UIStackView!
    
    var inputModel: PDFResumeInputModel!
    private lazy var viewModel = PDFResumeViewModel(resumeModel: inputModel.resumeModel)
    
    fileprivate var outputAsData: Bool = false
    
    fileprivate func getDestinationPath() -> String {
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
    
    @IBAction fileprivate func generateSamplePDFFromViews(_ sender: AnyObject?) {
        generatePDF()
    }
    
    fileprivate func openPDFViewer(_ pdfPath: String) {
        self.performSegue(withIdentifier: "PreviewVC", sender: pdfPath)
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
        phoneLabel.text = "Phone: " + viewModel.resumeModel.contact.mobile
        emailLabel.text = "Email: " + viewModel.resumeModel.contact.email
        addressLabel.text = viewModel.resumeModel.contact.address
        careerObjectiveLabel.text = viewModel.resumeModel.careerObjective.objective
        experienceLabel.text = viewModel.resumeModel.workSummary.totalExperience
        skillsLabel.text = ""
        for skill in viewModel.resumeModel.skills.skillModels {
            if skillsLabel.text?.isEmpty == false {
                skillsLabel.text = (skillsLabel.text ?? "") + ", "
            }
            skillsLabel.text = (skillsLabel.text ?? "") + skill.skill
        }
        
        if viewModel.resumeModel.workSummary.workModels.isEmpty {
            experienceStackView.isHidden = true
        } else {
            for workModel in viewModel.resumeModel.workSummary.workModels {
                let companyNameLabel = UILabel()
                companyNameLabel.font = UIFont.systemFont(ofSize: 15, weight: .medium)
                let durationLabel = UILabel()
                durationLabel.font = UIFont.systemFont(ofSize: 15.0)
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
                classLabel.font = UIFont.systemFont(ofSize: 15, weight: .medium)
                let passingYearLabel = UILabel()
                passingYearLabel.font = UIFont.systemFont(ofSize: 15.0)
                let percentageLabel = UILabel()
                percentageLabel.font = UIFont.systemFont(ofSize: 15, weight: .medium)
                let percentageValueLabel = UILabel()
                percentageValueLabel.font = UIFont.systemFont(ofSize: 15.0)
                classLabel.text = educationModel.classDetails
                passingYearLabel.text = "\(educationModel.passingYear)"
                
                percentageLabel.text = "Percentage/CGPA"
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
                projectNameLabel.font = UIFont.systemFont(ofSize: 15, weight: .medium)
                let projectNameValueLabel = UILabel()
                projectNameValueLabel.font = UIFont.systemFont(ofSize: 15.0)
                
                let teamSizeLabel = UILabel()
                teamSizeLabel.font = UIFont.systemFont(ofSize: 15, weight: .medium)
                let teamSizeValueLabel = UILabel()
                teamSizeValueLabel.font = UIFont.systemFont(ofSize: 15.0)
                
                let techUsedLabel = UILabel()
                techUsedLabel.font = UIFont.systemFont(ofSize: 15, weight: .medium)
                
                let roleLabel = UILabel()
                roleLabel.font = UIFont.systemFont(ofSize: 15, weight: .medium)
                
                projectNameLabel.text = "Project Name"
                projectNameValueLabel.text = projectsModel.projectName
                teamSizeLabel.text = "Team Size"
                teamSizeValueLabel.text = "\(projectsModel.teamSize)"
                
                techUsedLabel.text = "Technology used: \(projectsModel.technologyUsed)"
                roleLabel.text = "Role: \(projectsModel.role)"
                
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
