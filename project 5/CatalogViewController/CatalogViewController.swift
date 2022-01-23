//
//  CatalogViewController.swift
//  project 5
//
//  Created by Alexey Bondarev on 13.01.2022.
//

import UIKit

class CatalogViewController: UIViewController {

    
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var editeButtonOutlete: UIButton!
    
    var bikes : [Bikes] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bikes = DataService.shared.bikes
        
        table.delegate = self
        table.dataSource = self
        
    }

    @IBAction func backButtonTap() {
        self.dismiss(animated: false, completion: nil)
    }
    
    @IBAction func editeAction(_ sender: UIButton) {
        table.isEditing.toggle()
        if table.isEditing {
            editeButtonOutlete.setTitle("Ok", for: .normal)
        } else {
            editeButtonOutlete.setTitle("Edite", for: .normal)
            DataService.shared.bikes = bikes
        }
    }
}




extension CatalogViewController: UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        bikes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        let bike = bikes [indexPath.row]
        let bikeImage = DataService.loadImage(name: bike.photoName)
        cell.textLabel?.text = bike.brand
        cell.accessoryType = bike.fixie ? .checkmark : .none
        cell.detailTextLabel?.text = "Year: \(bike.year), Wheel size \(bike.wheelSize)"
        cell.backgroundColor = indexPath.row % 2 == 0 ? .lightGray : .white
        cell.imageView?.image = bikeImage ?? UIImage(named: bike.photoName)
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
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true // возможность перемещать ячейки в режиме редактирования
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        .none // скрывает значек делит
    }
    
    func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false // убирает смещение данных влево
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let elementToMove = bikes[sourceIndexPath.row]
        bikes.remove(at: sourceIndexPath.row)
        bikes.insert(elementToMove, at: destinationIndexPath.row)
    } // изменяем последовательность строк в момент работы с экраном
    
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let fix = fixProperty (at: indexPath)
        return UISwipeActionsConfiguration(actions: [fix])
    }
    
    func fixProperty (at indexPath: IndexPath)-> UIContextualAction {
        let action = UIContextualAction(style: .normal, title: "зафиксировали"){
            (action, view, completion)  in
            print("Выполнение кода")
            self.bikes[indexPath.row].fixie.toggle()
            DataService.shared.bikes = self.bikes
            self.table.reloadData()
            //self.table.reloadRows(at: [indexPath], with: .automatic) //попробовать разные анимации и посмотреть работает ли с ними
        }
        action.backgroundColor = .green
        return action
    }
    
    func deleteBikes(at indexPath: IndexPath)-> UIContextualAction{
        let action = UIContextualAction(style: .normal, title: "удалить"){
            (action, view, completion)  in
            print("удаление")
            self.alertAscConfirmation(title: "Внимание", message: "Точно удаляем?"){
                result in
                if result {
                    self.bikes.remove(at: indexPath.row) //удаляем сначала из локального массива!!!
                    DataService.shared.bikes = self.bikes
                    self.table.deleteRows(at: [indexPath], with: .bottom)
                } else {
                     self.table.reloadData() // перезагружаем таблицу что бы не было видно удаления
                }
            }

            
        }
        action.backgroundColor = .red
        return action
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let fix = deleteBikes (at: indexPath)
        return UISwipeActionsConfiguration(actions: [fix])
    }
    
}

