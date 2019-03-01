//
//  MultiplePDFViewController.swift
//  PSPDFKitTest
//
//  Created by Jose González on 2/21/19.
//  Copyright © 2019 Gonet. All rights reserved.
//

import UIKit
import PSPDFKitUI
import PSPDFKit

class MultiplePDFViewController: PSPDFMultiDocumentViewController
 {

    override func viewDidLoad() {
        super.viewDidLoad()
      //  delegate = self
       // addNewPDF()

    }
    
    
    func addNewPDF() {
        
//
        let fileURL = Bundle.main.url(forResource: "camara", withExtension: "pdf")!
        let document = PSPDFDocument(url: fileURL)


        let controller = PSPDFViewController(document: document, configuration: PSPDFConfiguration { builder in
            // builder.thumbnailBarMode = .none
            builder.shouldShowUserInterfaceOnViewWillAppear = false
            builder.isPageLabelEnabled = false
        })

       // addDocument(document, makeVisible: true, animated: true)

//
//        present(UINavigationController(rootViewController: controller), animated: true)
       
        
        
        
        
        
    }
    

   
   
}
