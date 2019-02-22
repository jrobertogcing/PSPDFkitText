//
//  ManualesViewController.swift
//  
//
//  Created by Jose González on 2/20/19.
//

import UIKit
import PSPDFKit
import PSPDFKitUI

class ManualesViewController: UIViewController, PSPDFTabbedViewControllerDelegate  {

    var arr = [String]()
    var arrayManuales = [String]()
    
    var flagPDFController = false
    
    var document: PSPDFDocument?
    var fileURL: URL?
    var controller = PSPDFViewController()
    var pdfMultipleController = PSPDFTabbedViewController()
    
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
    
    
    func addDocument(_ document: PSPDFDocument, makeVisible shouldMakeDocumentVisible: Bool, animated: Bool){
        
        
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
        
        
        
        // read array NSUserdefault
        let defaults = UserDefaults.standard
        arrayManuales = defaults.stringArray(forKey: "arrayManuales") ?? [String]()

        print("arrayManuales valores:")
        print(arrayManuales)


        if !arrayManuales.contains(arr[indexPath.row]) {

            arrayManuales.append(arr[indexPath.row])

            //seve new data in NSUserdefault
            defaults.set(arrayManuales, forKey: "arrayManuales")

            print("arrayManuales valores despues de guardar:")
            print(arrayManuales)

            for documentArray in arrayManuales {

                fileURL = Bundle.main.url(forResource: documentArray, withExtension: "pdf")!
                document = PSPDFDocument(url: fileURL!)

                if flagPDFController == false {
                    flagPDFController = true
                    controller = PSPDFViewController(document: document, configuration: PSPDFConfiguration { builder in
                        // builder.thumbnailBarMode = .none
                        builder.shouldShowUserInterfaceOnViewWillAppear = false
                        builder.isPageLabelEnabled = false
                    })
                   
                    pdfMultipleController = PSPDFTabbedViewController(pdfViewController: controller)

                }


                pdfMultipleController.addDocument(document!, makeVisible: true, animated: true)

            }

        } else {

            print("No esta en el array")
        }
        
        present(UINavigationController(rootViewController: pdfMultipleController), animated: true)



        
//      //PRUEBA MANDANDO 2 PDF EN TABS
//
//        let fileURL1 = Bundle.main.url(forResource: arr[2], withExtension: "pdf")!
//        let document1 = PSPDFDocument(url: fileURL1)
//
//        let controller1 = PSPDFViewController(document: document, configuration: PSPDFConfiguration { builder in
//            // builder.thumbnailBarMode = .none
//            builder.shouldShowUserInterfaceOnViewWillAppear = false
//            builder.isPageLabelEnabled = false
//        })
//
//        let fileURL2 = Bundle.main.url(forResource: arr[indexPath.row], withExtension: "pdf")!
//        let document2 = PSPDFDocument(url: fileURL2)
//
//        let controller2 = PSPDFViewController(document: document2, configuration: PSPDFConfiguration { builder in
//            // builder.thumbnailBarMode = .none
//            builder.shouldShowUserInterfaceOnViewWillAppear = false
//            builder.isPageLabelEnabled = false
//        })
//
//
//
//
//        let pdfMultipleController = PSPDFTabbedViewController(pdfViewController: controller1)
//
//        pdfMultipleController.addDocument(document1, makeVisible: true, animated: true)
//        pdfMultipleController.addDocument(document2, makeVisible: true, animated: true)
//
//
//        present(UINavigationController(rootViewController: pdfMultipleController), animated: true)

        
        
        
        
        // Go to the last page using a transitioning animation.
        //        let lastPage = document.pageCount - 1
        //        pdfController.setPageIndex(lastPage, animated: true)
        
      
       // Send to Favoritos view TEST
//        let favoritosVC = storyboard?.instantiateViewController(withIdentifier: "FavoritosViewController") as! FavoritosViewController
//
//        favoritosVC.pdfName = arr[indexPath.row]
//
//            self.present(favoritosVC, animated:true, completion:nil)

        
    }
    

}
