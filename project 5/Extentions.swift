//
//  Extentions.swift
//  project 5
//
//  Created by Alexey Bondarev on 19.01.2022.
//

import UIKit

extension UIViewController {
    func showAlert (title :String, message : String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        let okAction = UIAlertAction(title: "Ok", style: .default) 
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
}



