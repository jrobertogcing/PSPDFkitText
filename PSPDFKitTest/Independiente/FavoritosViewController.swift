//
//  FavoritosViewController.swift
//  PSPDFKitTest
//
//  Created by Jose González on 2/20/19.
//  Copyright © 2019 Gonet. All rights reserved.
//

import UIKit
import PSPDFKitUI
import PSPDFKit

class FavoritosViewController: UIViewController, PSPDFTabbedViewControllerDelegate {

    
    @IBOutlet weak var pdfView: UIView!
    
    var pdfName = ""
    var window: UIWindow?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let window = UIWindow(frame: pdfView.bounds)
//        self.window = window
//        window.backgroundColor = UIColor.white
//
//        let fileURL = Bundle.main.bundleURL.appendingPathComponent("camara.pdf")
//
//        let document = PSPDFDocument(url: fileURL)
//        let configuration = PSPDFConfiguration { builder in
//            builder.thumbnailBarMode = .scrollable
//        }
//        let pdfController = PDFViewController(document: document, configuration: configuration)
//
////        self.window?.rootViewController = UINavigationController(rootViewController: pdfController)
////        self.window?.makeKeyAndVisible()
//
//        present(UINavigationController(rootViewController: pdfController), animated: true)
//

    }
    
    @IBAction func addButtonAction(_ sender: UIButton) {
//
        let fileURL = Bundle.main.url(forResource: pdfName, withExtension: "pdf")!
        let document = PSPDFDocument(url: fileURL)
        

        //Se puede tomar un controlar customizado PDFViewController
//
        let pdfController = PSPDFViewController(document: document, configuration: PSPDFConfiguration { builder in
            // builder.thumbnailBarMode = .none
            builder.shouldShowUserInterfaceOnViewWillAppear = false
            builder.isPageLabelEnabled = false
        })
        
        
        let fileURL2 = Bundle.main.url(forResource: "Revisión de Seguridad", withExtension: "pdf")!
        let document2 = PSPDFDocument(url: fileURL2)
        //
        
       // let pdfMultipleController = PSPDFMultiDocumentViewController(pdfViewController: pdfController)
        let pdfMultipleController = PSPDFTabbedViewController(pdfViewController: pdfController)
//        let configuration = PSPDFConfiguration { builder in
//            builder.thumbnailBarMode = .scrollable
//        }
////
        // Set delegate to PSPDFTabbedViewCpontroller
        pdfMultipleController.delegate = self
        
        // Add two  documents
        pdfMultipleController.addDocument(document, makeVisible: true, animated: true)
        pdfMultipleController.addDocument(document2, makeVisible: true, animated: true)
        
        
//
//        let pdfController = MultiplePDFViewController(document: document, configuration: configuration)
        //let pdfController = MultiplePDFViewController
        //let pdfController = MultiplePDFViewController.init(coder: )
//
      present(UINavigationController(rootViewController: pdfMultipleController), animated: true)

        
    }
    
    
//    func tabbedPDFController(_ tabbedPDFController: PSPDFTabbedViewController, didClose document: PSPDFDocument) {
//        print(document.documentIdString!)
//        
//    }
//    
//    func tabbedPDFController(_ tabbedPDFController: PSPDFTabbedViewController, shouldClose document: PSPDFDocument) -> Bool {
//
//        return false
//    }
//
//
//    func tabbedPDFController(_ tabbedPDFController: PSPDFTabbedViewController, didChangeVisibleDocument oldVisibleDocument: PSPDFDocument?) {
//        print(oldVisibleDocument!)
//
//    }
//
//    func tabbedPDFController(_ tabbedPDFController: PSPDFTabbedViewController, shouldChangeVisibleDocument newVisibleDocument: PSPDFDocument?) -> Bool {
//        return true
//    }
    
}
