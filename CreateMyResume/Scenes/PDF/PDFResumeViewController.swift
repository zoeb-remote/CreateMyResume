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
    
    var inputModel: PDFResumeInputModel!
    private lazy var viewModel = PDFResumeViewModel(resumeModel: inputModel.resumeModel)
    
    fileprivate var outputAsData: Bool = false
    
    fileprivate func getDestinationPath() -> String {
        return NSHomeDirectory() + "/" + viewModel.resumeModel.title.replacingOccurrences(of: " ", with: "_") + ".pdf"
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        generatePDF()
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
        
    }

}
