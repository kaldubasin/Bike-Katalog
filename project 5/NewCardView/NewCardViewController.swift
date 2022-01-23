//
//  NewCardViewController.swift
//  project 5
//
//  Created by Alexey Bondarev on 07.01.2022.
//

import UIKit

class NewCardViewController: UIViewController {

    @IBOutlet weak var yearTextField: UITextField!
    @IBOutlet weak var brandTextField: UITextField!
    @IBOutlet weak var wheelSizeTextField: UITextField!
    
    @IBOutlet weak var fixiebleSwitch: UISwitch!
    @IBOutlet weak var fixieblaLabel: UILabel!
    
    
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var bikeImage: UIImageView!
    
    var creatableBike : Bikes!
    var isCreate : Bool = true
//    var newBike = Bikes(year: 0, wheelSize: 0, brand: "none", photoName: "none", fixie: true)
//
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeSetaps()
        
    }

    func changeSetaps () {
        if !isCreate {
            yearTextField.isEnabled = false
            brandTextField.isEnabled = false
            wheelSizeTextField.isEnabled = false
            fixiebleSwitch.isHidden = true
            addButton.setTitle("Удалить", for: .normal)
            getInfo()
            
        }
    }
    
    func getInfo () {
        yearTextField.text = "\(creatableBike.year)"
        brandTextField.text = creatableBike.brand
        wheelSizeTextField.text = "\(creatableBike.wheelSize)"
        fixieblaLabel.text = creatableBike.fixie ? "фикс" : "не фикс"
        let newBikeImage = DataService.loadImage(name: creatableBike.photoName)
        bikeImage.image = newBikeImage ?? UIImage(named: creatableBike.photoName)
        bikeImage.backgroundColor = .none
    }
    
    
    func saveNewBike() {
        guard yearTextField.text != ""  else {
            showAlert(title: "Внимание", message: "Год не заполнен")
            return
        }
        guard let year : Int = Int(yearTextField.text!)  else {
            showAlert(title: "Внимание", message: "Введите цифры")
            return
        }
        guard let brand = brandTextField.text, brand != "" else {
            showAlert(title: "Внимание", message: "Введите бренд велосипеда")
            return
        }
        guard wheelSizeTextField.text != ""  else {
            showAlert(title: "Внимание", message: "Введите размер колеса")
            return
        }
        guard let wheel : Int = Int(wheelSizeTextField.text!)  else {
            showAlert(title: "Внимание", message: "Введите цифры")
            return
        }
        
        if bikeImage.image == nil {
            showAlert(title: "Внимание", message: "Добавьте фото")
            return
        } else {
        let nameImage = String(Int(Date().timeIntervalSince1970))
            DataService.saveImageDocumentDirectory(tempImage: bikeImage.image!, name: nameImage)
        
        let newBike = Bikes(year: year, wheelSize: wheel, brand: brand, photoName: nameImage, fixie: fixiebleSwitch.isOn)
        DataService.shared.bikes.append(newBike)
    }
    }
    
    
    func deleteNewBike() {
        
        
    }
    
    
    @IBAction func NewCardBackButton(_ sender: UIButton) {
        self.dismiss(animated: false, completion: nil)
    }
    
    @IBAction func switchActionButton(_ sender: UISwitch) {
    }
    @IBAction func addImageTap(_ sender: UIButton) {
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present (vc, animated:true)
    }
    
    @IBAction func addButtonTap(_ sender: UIButton) {
//        newBike.brand = brandTextField.text
//        newBike.year = Int(yearTextField.text)
//        newBike.wheelSize = Int(wheelSizeTextField.text)
//        fixiebleSwitch.isOn ? newBike.fixie == true : newBike.fixie == false
        saveNewBike ()
        self.dismiss(animated: false, completion: nil)
        
    }
}


 extension NewCardViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {

 func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info:
 [UIImagePickerController.InfoKey : Any]) {

    if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
        bikeImage.image = image
        
 }
 picker.dismiss(animated: true, completion: nil)
 }

 func imagePickerControllerDidCancel(_ picker: UIImagePickerController){
 picker.dismiss(animated: true, completion: nil)
 }
 }


 
