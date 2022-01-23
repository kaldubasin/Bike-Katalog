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
    
    func alertAscConfirmation (title :String, message : String, complition: @escaping(_ result: Bool) -> Void) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "ДА", style: .destructive, handler: { action in
            complition(true)
        }))
        alertController.addAction(UIAlertAction(title: "НЕТ", style: .cancel, handler: { action in
            complition(false)
        }))
        self.present(alertController, animated: true, completion: nil)
        
    }
    
}



