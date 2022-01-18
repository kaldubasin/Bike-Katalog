//
//  CatalogViewController.swift
//  project 5
//
//  Created by Alexey Bondarev on 13.01.2022.
//

import UIKit

class CatalogViewController: UIViewController {

    
    @IBOutlet weak var table: UITableView!
    
    var bikes : [Bikes] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.delegate = self
        table.dataSource = self
        
    }

    @IBAction func backButtonTap() {
        self.dismiss(animated: false, completion: nil)
    }
}


extension CatalogViewController: UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        bikes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        let bike = bikes [indexPath.row]
        cell.textLabel?.text = bike.brand
        cell.accessoryType = bike.fixie ? .checkmark : .none
        cell.detailTextLabel?.text = "Year: \(bike.year), Wheel size \(bike.wheelSize)"
        cell.backgroundColor = indexPath.row % 2 == 0 ? .lightGray : .white
        cell.imageView?.image = UIImage(named: bike.photoName)
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let bike = bikes [indexPath.row]
        let vc = NewCardViewController()
        vc.creatableBike = bike
        vc.isCreate = false
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: false, completion: nil)
    }
    
}

