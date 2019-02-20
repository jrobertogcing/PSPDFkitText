//
//  ManualesViewController.swift
//  
//
//  Created by Jose González on 2/20/19.
//

import UIKit
import PSPDFKit
import PSPDFKitUI

class ManualesViewController: UIViewController {

    var arr = [String]()
    
    @IBOutlet weak var manualesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        arr = ["Pilotos y Sobrecargos viajando sin Boleto", "Carta_Fiesta_Inn_Aeromexico" ,"Así_trabajamos", "Revisión de Seguridad"]

       let nibName = UINib.init(nibName: "ManualesTableViewCell", bundle: Bundle.main)
        
        manualesTableView.register(nibName, forCellReuseIdentifier: "ManualesTableViewCell")
        
        manualesTableView.delegate = self
        manualesTableView.dataSource = self
        
    }
    
    
    

  

}

extension ManualesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = manualesTableView.dequeueReusableCell(withIdentifier: "ManualesTableViewCell", for: indexPath)
        
        guard let newCell = cell as? ManualesTableViewCell else {return cell}
        
        newCell.manualLabelCell.text = arr[indexPath.row]
        
        return newCell
    }
    
    //MARK Select row

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if arr[indexPath.row] == "Pilotos y Sobrecargos viajando sin Boleto"{
        
            let fileURL = Bundle.main.url(forResource: arr[indexPath.row], withExtension: "pdf")!
            let document = PSPDFDocument(url: fileURL)
            
            let pdfController = PSPDFViewController(document: document)
            
            present(UINavigationController(rootViewController: pdfController), animated: true)
        } else if arr[indexPath.row] == "Carta_Fiesta_Inn_Aeromexico"{
            
            let fileURL = Bundle.main.url(forResource: arr[indexPath.row], withExtension: "pdf")!
            let document = PSPDFDocument(url: fileURL)
            
            let pdfController = PSPDFViewController(document: document)
            
            present(UINavigationController(rootViewController: pdfController), animated: true)
        } else if arr[indexPath.row] == "Así_trabajamos"{
            let fileURL = Bundle.main.url(forResource: arr[indexPath.row], withExtension: "pdf")!
            let document = PSPDFDocument(url: fileURL)
        
            let pdfController = PSPDFViewController(document: document)
        
            present(UINavigationController(rootViewController: pdfController), animated: true)
        } else if arr[indexPath.row] == "Revisión de Seguridad"{
            let fileURL = Bundle.main.url(forResource: arr[indexPath.row], withExtension: "pdf")!
            let document = PSPDFDocument(url: fileURL)
            
            let pdfController = PSPDFViewController(document: document)
            
            present(UINavigationController(rootViewController: pdfController), animated: true)
        }
        
        
        
    }
    

}
