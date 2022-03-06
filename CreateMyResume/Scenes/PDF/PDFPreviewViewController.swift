//
//  PDFPreviewViewController.swift
//  PDFGenerator
//
//  Created by Suguru Kishimoto on 2016/02/06.
//
//

import UIKit
import WebKit

class PDFPreviewViewController: UIViewController {

    @IBOutlet private weak var webView: WKWebView!
    var url: URL!
    override func viewDidLoad() {
        super.viewDidLoad()
        let req = NSMutableURLRequest(url: url)
        req.timeoutInterval = 60.0
        req.cachePolicy = .reloadIgnoringLocalAndRemoteCacheData

        // webView.scalesPageToFit = true
        webView.load(req as URLRequest)
        
        let btnShare = UIBarButtonItem(barButtonSystemItem:.action, target: self, action: #selector(sharePDF))
        self.navigationItem.rightBarButtonItem = btnShare
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction private func close(_ sender: AnyObject!) {
        dismiss(animated: true, completion: nil)
    }

    func setupWithURL(_ url: URL) {
        self.url = url
    }
    
    @objc func sharePDF() {
        if FileManager.default.fileExists(atPath: url.path){
            
            let urlValue = URL(fileURLWithPath: url.path)
            let activityViewController: UIActivityViewController = UIActivityViewController(activityItems: [urlValue], applicationActivities: nil)
            activityViewController.popoverPresentationController?.sourceView=self.view
            
            //If user on iPad
            if UIDevice.current.userInterfaceIdiom == .pad {
                if activityViewController.responds(to: #selector(getter: UIViewController.popoverPresentationController)) {
                }
            }
            present(activityViewController, animated: true, completion: nil)
            
        }
        else {
            debugPrint("document was not found")
        }
    }
}
