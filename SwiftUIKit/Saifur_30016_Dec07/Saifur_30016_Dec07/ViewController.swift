//
//  ViewController.swift
//  Saifur_30016_Dec07
//
//  Created by BJIT on 7/12/22.
//

import UIKit

struct Car{
    var name:String
    var imgId:String
}
//Toyota, Lamborghini,Tesla,Nissan,Mercedes

extension Car{
    static var car  = [
        Car(name: "Toyota", imgId: "Toyota"),
        Car(name: "Lamborghini", imgId: "Lamborghini"),
        Car(name: "Tesla", imgId: "Tesla"),
        Car(name: "Nissan", imgId: "Nissan"),
        Car(name: "Mercedes", imgId: "Mercedes")
    ]
    
}

class ViewController:UIViewController  {
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        let nib = UINib(nibName: "CustomHeaderView", bundle: nil)
        tableView.register(nib, forHeaderFooterViewReuseIdentifier: "CustomHeaderView")
        let nib2 = UINib(nibName: "CustomFooterView", bundle: nil)
         tableView.register(nib2, forHeaderFooterViewReuseIdentifier: "CustomFooterView")
    }
    
    @IBAction func addValue(_ sender: Any) {
        appendItemToTable(item: Car(name: "Toyota", imgId: "Toyota"))
    }
    
    func appendItemToTable(item : Car){
    Car.car.append(item)
        tableView.reloadSections([0], with: .fade	)
        /*
        let indexPath = IndexPath(row: Car.car.count-1, section: 0)
        tableView.beginUpdates()
        tableView.insertRows(at: [indexPath], with: .fade)
        tableView.endUpdates()
         */
    //tableView.reloadData()
}
}
    
    extension ViewController: UITableViewDelegate{
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            
            return Car.car.count
        }
        
        func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
        /*
        func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            
            return "Template A"
        
    }*/
        
    }
    
    
    extension ViewController:UITableViewDataSource{
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell0 = tableView.dequeueReusableCell(withIdentifier: "firstTemplate", for: indexPath)
            cell0.textLabel?.text = Car.car[indexPath.row].name
            cell0.imageView?.image = UIImage(named: Car.car[indexPath.row].imgId)
           return  cell0
        }
        
          
        
        func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
            return .delete
        }
        
        func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            if editingStyle == .delete{
                Car.car.remove(at: indexPath.row)
                //tableView.reloadData()
                tableView.beginUpdates()
                tableView.deleteRows(at: [indexPath], with: .fade)
                tableView.endUpdates()
            }
        }
        
        func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            if section == 0{
                let sectionHeader =  tableView.dequeueReusableHeaderFooterView(withIdentifier: "CustomHeaderView")
                return sectionHeader
            }
            return UIView()
        }
        func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 50
        }
        func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
            if section == 0{
                let sectionFooter = tableView.dequeueReusableHeaderFooterView(withIdentifier: "CustomFooterView")
                return sectionFooter
            }
            return UIView()
        }
        
        func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
            return 50
        }
    }





