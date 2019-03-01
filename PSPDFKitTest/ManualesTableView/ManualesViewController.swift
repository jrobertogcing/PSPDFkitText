//
//  ManualesViewController.swift
//  
//
//  Created by Jose González on 2/20/19.
//

import UIKit
import PSPDFKit
import PSPDFKitUI

class ManualesViewController: UIViewController,  PSPDFMultiDocumentViewControllerDelegate {

    var arr = [String]()
    var arrayManuales = [String]()
    
    var flagPDFController = false
    
    var document: PSPDFDocument?
    var fileURL: URL?
    var controller = PSPDFViewController()
    var pdfMultipleController = PSPDFTabbedViewController()
    var pdfMultipleController2 = PSPDFMultiDocumentViewController()
    var tabSelected = PSPDFDocument()
    
    var window: UIWindow?

    
    @IBOutlet weak var pdfView: UIView!
    
    @IBOutlet weak var manualesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        arr = ["Pilotos y Sobrecargos viajando sin Boleto", "Carta_Fiesta_Inn_Aeromexico" ,"Así_trabajamos", "Revisión de Seguridad"]

       let nibName = UINib.init(nibName: "ManualesTableViewCell", bundle: Bundle.main)
        
        manualesTableView.register(nibName, forCellReuseIdentifier: "ManualesTableViewCell")
        
        manualesTableView.delegate = self
        manualesTableView.dataSource = self
        
        let defaults = UserDefaults.standard

        defaults.removeObject(forKey: "arrayManuales")
        

    }
    
    
    @IBAction func deleteButtonAction(_ sender: Any) {
        
//
//        pdfMultipleController.removeDocument(at: 0, animated: true)
//
//        arrayManuales.remove(at: 0)
        
    }
}

extension ManualesViewController: UITableViewDelegate, UITableViewDataSource, PSPDFTabbedViewControllerDelegate {
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
        
        let window = UIWindow(frame: pdfView.bounds)
        self.window = window
        window.backgroundColor = UIColor.white
        pdfView.addSubview(window)
        // read array NSUserdefault
        let defaults = UserDefaults.standard
        arrayManuales = defaults.stringArray(forKey: "arrayManuales") ?? [String]()

        print("arrayManuales valores:")
        print(arrayManuales)


        if !arrayManuales.contains(arr[indexPath.row]) {

            arrayManuales.append(arr[indexPath.row])

            //save new data in NSUserdefault
            saveDocumentName(arrayManuales: arrayManuales)

            for documentArray in arrayManuales {

                fileURL = Bundle.main.url(forResource: documentArray, withExtension: "pdf")!
                document = PSPDFDocument(url: fileURL!)

                if flagPDFController == false {
                    flagPDFController = true
                    
                    controller = PSPDFViewController(document: document, configuration:PSPDFConfiguration { builder in
                      
                        builder.shouldShowUserInterfaceOnViewWillAppear = true
                        builder.isPageLabelEnabled = true
                        
                        
                    })
                    
                   
                pdfMultipleController = PSPDFTabbedViewController(pdfViewController: controller)
                    
                // Set delegate to PSPDFTabbedViewCpontroller
                pdfMultipleController.delegate = self

                    //tabbedPDFController:didCloseDocument
                    
                    
                //Custom TabbbedBar
                pdfMultipleController.tabbedBar.barHeight = 100
                pdfMultipleController.tabbedBar.tintColor = UIColor.blue

                }
                
                pdfMultipleController.addDocument(document!, makeVisible: true, animated: true)
            }

        } else {

            
            pdfMultipleController.updateTabbedBarFrame(animated: true)
            
            fileURL = Bundle.main.url(forResource: arrayManuales[indexPath.row], withExtension: "pdf")!
            document = PSPDFDocument(url: fileURL!)
            
            
            pdfMultipleController.setVisibleDocument(document, scrollToPosition: true, animated: true)
            
            print("Ya esta en el array y debe mostar el mismo documento.")
            if arrayManuales.count == 0 {
                
            }
            
            
            }
        

       window.rootViewController = UINavigationController(rootViewController: pdfMultipleController)
       window.makeKeyAndVisible()
        
        
     
        }
    
    func saveDocumentName(arrayManuales: [String])  {
       
        let defaults = UserDefaults.standard

        //seve new data in NSUserdefault
        defaults.set(arrayManuales, forKey: "arrayManuales")
        
        print("arrayManuales valores despues de guardar:")
        print(arrayManuales)

        
    }
    
    func removeDocumentName(name: String) {
        
        print("Nombre para borrar")
        print(name)
        let defaults = UserDefaults.standard
        
        // Remove from array
        for removeName in arrayManuales {
            
            if removeName + ".pdf" == name {
                
                if let indexToRemove = arrayManuales.index(of: removeName) {
                
                arrayManuales.remove(at: indexToRemove)
                
                break
                }
            }
        }
        
        print("Despues de borrar")
        print(arrayManuales)
        
        
        // Remove from nsuserdefault
        defaults.set(arrayManuales, forKey: "arrayManuales")
        print("arrayManuales valores despues de borrar y volver a guardar:")
        print(arrayManuales)

    }
    
        
    func tabbedPDFController(_ tabbedPDFController: PSPDFTabbedViewController, didClose document: PSPDFDocument) {
        
        
        // arrayManuales.remove(at: )
        if let documentName = document.fileName {
            print(documentName)
        // Remove Document NSUserdefault
        removeDocumentName(name: documentName)
            
        }
        
    }
    
   
    func tabbedPDFController(_ tabbedPDFController: PSPDFTabbedViewController, shouldChangeVisibleDocument newVisibleDocument: PSPDFDocument?) -> Bool {
        
        
        print(newVisibleDocument!)
        return true
    }
    
//    func tabbedPDFController(_ tabbedPDFController: PSPDFTabbedViewController, shouldClose document: PSPDFDocument) -> Bool {
//        print(document)
//
//        return true
//    }
    
    
}
