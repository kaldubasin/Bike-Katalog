//
//  ViewController.swift
//  project 5
//
//  Created by Alexey Bondarev on 07.01.2022.
//

import UIKit

class ViewController: UIViewController {

    var bikes: [Bikes] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let model1 = Bikes(year: 2014, wheelSize: 28, brand: "Fuji Feather", photoName: "fujiFeather1", fixie: true)
        let model2 = Bikes(year: 2016, wheelSize: 28, brand: "Fuji Declaration", photoName: "fujiDeclaration", fixie: false)
        let model3 = Bikes(year: 2012, wheelSize: 20, brand: "Shilz Eazy", photoName: "sulzEasy", fixie: false)
        let model4 = Bikes(year: 2016, wheelSize: 28, brand: "HVZ", photoName: "hVZfirst", fixie: false)
        let model5 = Bikes(year: 2018, wheelSize: 20, brand: "Shulz Max", photoName: "shulzMAx", fixie: false)
        let model6 = Bikes(year: 2020, wheelSize: 28, brand: "Bearbike Armata", photoName: "bearbikeArmata", fixie: true)
        let model7 = Bikes(year: 2016, wheelSize: 26, brand: "Helkaama", photoName: "helkaama", fixie: false)
        let model8 = Bikes(year: 2020, wheelSize: 28, brand: "Fuji Treck",photoName: "fuji", fixie: false)
        let model9 = Bikes(year: 2022, wheelSize: 28, brand: "CargoBike", photoName: "cargoBike", fixie: false)
        let model10 = Bikes(year: 2022, wheelSize: 28, brand: "Bearbike Caire", photoName: "bearbikeCaire", fixie: false)
  
        bikes.append (model1)
        bikes.append (model2)
        bikes.append (model3)
        bikes.append (model4)
        bikes.append (model5)
        bikes.append (model6)
        bikes.append (model7)
        bikes.append (model8)
        bikes.append (model9)
        bikes.append (model10)
    }

    

    @IBAction func catalog(_ sender: UIButton) {
        let vc = CatalogViewController ()
        vc.bikes = self.bikes
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: false, completion: nil)
        
        
    }
    
    
    @IBAction func addToCatalog(_ sender: UIButton) {
        let vc = NewCardViewController ()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: false, completion: nil)
        
    }
    
    
    //
    
}

