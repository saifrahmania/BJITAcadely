//
//  ViewController.swift
//  Saifur_30016_Nov09
//
//  Created by BJIT on 12/12/22.
//

import UIKit

struct Car{
    var name:String
    var imgId:String
}

extension Car{
    static var car  = [
        Car(name: "Toyota", imgId: "Toyota"),
        Car(name: "Lamborghini", imgId: "Lamborghini"),
        Car(name: "Tesla", imgId: "Tesla"),
        Car(name: "Nissan", imgId: "Nissan"),
        Car(name: "Mercedes", imgId: "Mercedes"),
        Car(name: "Toyota", imgId: "Toyota"),
        Car(name: "Lamborghini", imgId: "Lamborghini"),
        Car(name: "Tesla", imgId: "Tesla"),
        Car(name: "Nissan", imgId: "Nissan"),
        Car(name: "Mercedes", imgId: "Mercedes"),
        Car(name: "Toyota", imgId: "Toyota"),
        Car(name: "Lamborghini", imgId: "Lamborghini"),
        Car(name: "Tesla", imgId: "Tesla"),
        Car(name: "Nissan", imgId: "Nissan"),
        Car(name: "Mercedes", imgId: "Mercedes"),
        Car(name: "Toyota", imgId: "Toyota"),
        Car(name: "Lamborghini", imgId: "Lamborghini"),
        Car(name: "Tesla", imgId: "Tesla"),
        Car(name: "Nissan", imgId: "Nissan"),
        Car(name: "Mercedes", imgId: "Mercedes"),
    ]
    
}

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }


}


extension ViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Car.car.count
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        
        let deleteAction = UIContextualAction(style: .destructive, title: nil ){[weak self] _,_,completion in
            guard let self = self else { return }
            self.handleDeleteAction(indexPath: indexPath)
            completion(true)
        }
        deleteAction.image = UIImage(systemName:  "trash")
        let swipeTrailingAction = UISwipeActionsConfiguration(actions: [deleteAction])
        swipeTrailingAction.performsFirstActionWithFullSwipe = false
        return swipeTrailingAction
    }
    
    func handleDeleteAction(indexPath: IndexPath){
        tableView.beginUpdates()
        Car.car.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .left)
        tableView.endUpdates()
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let editAction = UIContextualAction(style: .normal, title: nil){[weak self] _,_,completion in
            guard let self  = self else { return }
            self.handleUpdatetAction(indexPath: indexPath)
            completion(true)
        }
        editAction.image = UIImage(systemName: "pencil.tip.crop.circle")
        editAction.backgroundColor = .brown
        let swipeHeadingAction = UISwipeActionsConfiguration(actions: [editAction])
        swipeHeadingAction.performsFirstActionWithFullSwipe = false
        return swipeHeadingAction
        
    }
    
    func handleUpdatetAction(indexPath: IndexPath){
         print("Editted!!")
    }
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sampleCell", for: indexPath)
        cell.textLabel?.text = Car.car[indexPath.row].name
        cell.imageView?.image = UIImage(named: Car.car[indexPath.row].imgId)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
            tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}




