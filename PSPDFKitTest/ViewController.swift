//
//  ViewController.swift
//  PSPDFKitTest
//
//  Created by Jose González on 2/20/19.
//  Copyright © 2019 Gonet. All rights reserved.
//

import UIKit
import PSPDFKit
import PSPDFKitUI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
      
     

        
        
    }

    @IBAction func pdfButtonAction(_ sender: UIButton) {
        
        
        let fileURL = Bundle.main.url(forResource: "camara", withExtension: "pdf")!
        let document = PSPDFDocument(url: fileURL)
        
        let pdfController = PSPDFViewController(document: document)
        
        present(UINavigationController(rootViewController: pdfController), animated: true)
        
    }
    
    
    
    
    
}

