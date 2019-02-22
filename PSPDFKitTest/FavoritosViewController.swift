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

class FavoritosViewController: UIViewController,  PSPDFTabbedViewControllerDelegate {

    
    @IBOutlet weak var pdfView: UIView!
    
    var pdfName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        print(pdfName)
//            let fileURL = Bundle.main.url(forResource: pdfName, withExtension: "pdf")!
//            let document = PSPDFDocument(url: fileURL)
//
//           // addDocument(document2, makeVisible: true, animated: true)
//
//           // let pdfController = PSPDFViewController(document: document)
//
//
//            // Go to the last page using a transitioning animation.
//    //        let lastPage = document.pageCount - 1
//    //        pdfController.setPageIndex(lastPage, animated: true)
//
//            //let document = PSPDFDocument(url: documentURL)
//            let controller = PSPDFViewController(document: document, configuration: PSPDFConfiguration { builder in
//               // builder.thumbnailBarMode = .none
//                builder.shouldShowUserInterfaceOnViewWillAppear = false
//                builder.isPageLabelEnabled = false
//            })
//
//       // present(UINavigationController(rootViewController: controller), animated: true)

    }
    
    @IBAction func addButtonAction(_ sender: UIButton) {
//
        let fileURL = Bundle.main.url(forResource: pdfName, withExtension: "pdf")!
        let document = PSPDFDocument(url: fileURL)
//
//
        let pdfController = PSPDFViewController(document: document, configuration: PSPDFConfiguration { builder in
            // builder.thumbnailBarMode = .none
            builder.shouldShowUserInterfaceOnViewWillAppear = false
            builder.isPageLabelEnabled = false
        })
        
        let fileURL2 = Bundle.main.url(forResource: "Revisión de Seguridad", withExtension: "pdf")!
        let document2 = PSPDFDocument(url: fileURL2)
        //
        //
        let pdfController2 = PSPDFViewController(document: document2, configuration: PSPDFConfiguration { builder in
            // builder.thumbnailBarMode = .none
            builder.shouldShowUserInterfaceOnViewWillAppear = false
            builder.isPageLabelEnabled = false
        })

        
        //addDocument(document2, makeVisible: true, animated: true)
        
       // let pdfMultipleController = PSPDFMultiDocumentViewController(pdfViewController: pdfController)
        let pdfMultipleController = PSPDFTabbedViewController(pdfViewController: pdfController)
//        let configuration = PSPDFConfiguration { builder in
//            builder.thumbnailBarMode = .scrollable
//        }
////
        pdfMultipleController.addDocument(document, makeVisible: true, animated: true)
        pdfMultipleController.addDocument(document2, makeVisible: true, animated: true)
        
        //pdfMultipleController.addChild(pdfController2)
        
        
////        present(UINavigationController(rootViewController: controller), animated: true)
//
//        let pdfController = MultiplePDFViewController(document: document, configuration: configuration)
        //let pdfController = MultiplePDFViewController
        //let pdfController = MultiplePDFViewController.init(coder: )
//
      present(UINavigationController(rootViewController: pdfMultipleController), animated: true)

       
        
        
    }
    
  
    
}
