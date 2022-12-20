//
//  ViewController.swift
//  Saifur_30016_Dec06
//
//  Created by BJIT on 6/12/22.
//

import UIKit

struct Car{
    var name:String
    var image:UIImage
    var description:String
    var price:String
}
// Toyota, Lamborghini,Tesla,Nissan,Mercedes
// will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful.
extension Car{
    static let car  = [
        Car(name: "Toyota", image: UIImage(named: "Toyota")!, description: "Toyota will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful.", price: "50,000"),
        Car(name: "Lamborghini", image: UIImage(named: "Lamborghini")!, description: "Lamborghini will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful.", price: "6,550,000"),
        Car(name: "Tesla", image: UIImage(named: "Tesla")!, description: "Tesla will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful.", price: "120,000"),
        Car(name: "Nissan", image: UIImage(named: "Nissan")!, description: "Nissan will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful.", price: "75,000"),
        Car(name: "Mercedes", image: UIImage(named: "Mercedes")!, description: "Mercedes will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful.", price: "9,550,000")
        

    ]
}


class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }


}

extension ViewController:UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            let cell1 = tableView.dequeueReusableCell(withIdentifier: Constant.firstTableIdentifier, for: indexPath)
            cell1.textLabel?.text = Car.car[indexPath.row].name
            cell1.detailTextLabel?.text = Car.car[indexPath.row].price
            
            return cell1
        }
        
        else if indexPath.section == 1{
            let cell2 = tableView.dequeueReusableCell(withIdentifier: Constant.secondTableIdentifier, for: indexPath) as! SecondTableViewCell
            cell2.imgView.image = Car.car[indexPath.row].image
            cell2.txtLabel.text = Car.car[indexPath.row].name
            
            return cell2
            
        }
        let cell3 = tableView.dequeueReusableCell(withIdentifier: Constant.thirdTableIdentifire, for: indexPath)
        cell3.textLabel?.text = Car.car[indexPath.row].name
        return cell3
        
        
        
        
        
    }
    
    
    
    
}

extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath)")
//        performSegue(withIdentifier: "segueSwitch", sender: self)
        performSegue(withIdentifier: Constant.segueWindow, sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender:Any?){
        if segue.identifier == Constant.segueWindow {
            if let second = segue.destination as? DetailedViewController {
                second.deleGete = self
                //second.loadViewIfNeeded()
//                let path = tableView.indexPathForSelectedRow
//
//                second.tmpImg = Car.car[path!.row].image
//                second.name.text = Car.car[path!.row].name
//                second.descr.text = Car.car[path!.row].description
                
//                let index = tableView.indexPathForSelectedRow
//
//                if(index!.section == 0){
//                    second.image.image = Car.car[index!.row].image
//                    second.name.text = Car.car[index!.row].name
//                    second.descr.text = Car.car[index!.row].description
//
//                } else if(index!.section == 1){
//                    second.image.image = Car.car[index!.row].image
//                    second.name.text = Car.car[index!.row].name
//                    second.descr.text = Car.car[index!.row].description
//
//                }
//                else{
//                    second.image.image = Car.car[index!.row].image
//                    second.name.text = Car.car[index!.row].name
//                    second.descr.text = Car.car[index!.row].description
//                }
                
            }
        }
        
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if section == 1{
            return "Cars with picture"
        }
        else if section == 0{
            return "Price of Cars"
        }
        return "Other Tables"
    }
}

