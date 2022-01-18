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
            addButton.isHidden = true
            getInfo()
        }
    }
    
    func getInfo () {
        yearTextField.text = "\(creatableBike.year)"
        brandTextField.text = creatableBike.brand
        wheelSizeTextField.text = "\(creatableBike.wheelSize)"
        fixieblaLabel.text = creatableBike.fixie ? "фикс" : "не фикс"
        bikeImage.image = UIImage(named: creatableBike.photoName)
        bikeImage.backgroundColor = .none
    }
    
    
    @IBAction func NewCardBackButton(_ sender: UIButton) {
        self.dismiss(animated: false, completion: nil)
    }
    
    @IBAction func switchActionButton(_ sender: UISwitch) {
    }
    
    @IBAction func addButtonTap(_ sender: UIButton) {
    }
    
    
    
    
}
