//
//  ViewController.swift
//  Saifur_30016_Dec5
//
//  Created by BJIT on 5/12/22.
//

import UIKit

struct Car{
    var image:UIImage
    var name: String
    var description: String
    var price: String
    
}

let car : [Car] = [
    Car(image: UIImage(named: "Lamborghini")!, name: "Lamborghini", description: "Lamborghini s a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available. It is also used to temporarily replace text in a process called greeking, which allows designers to consider the form of a webpage or publication, without the meaning of the text influencing the design.",price: "20_000_000"),
    Car(image: UIImage(named: "Toyota")!, name: "Toyota", description: "Toyota s a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available. It is also used to temporarily replace text in a process called greeking, which allows designers to consider the form of a webpage or publication, without the meaning of the text influencing the design.",price: "300_000"),
    Car(image: UIImage(named: "Mercedes")!, name: "Mercedes", description: "Mercedes s a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available. It is also used to temporarily replace text in a process called greeking, which allows designers to consider the form of a webpage or publication, without the meaning of the text influencing the design.",price: "60_000_000"),
    Car(image: UIImage(named: "Tesla")!, name: "Tesla", description: "Tesla s a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available. It is also used to temporarily replace text in a process called greeking, which allows designers to consider the form of a webpage or publication, without the meaning of the text influencing the design.",price: "120_000"),
    Car(image: UIImage(named: "Nissan")!, name: "Nissan", description: "Nissan s a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available. It is also used to temporarily replace text in a process called greeking, which allows designers to consider the form of a webpage or publication, without the meaning of the text influencing the design.",price: "1_000_000")
    
                   
]

class ViewController: UIViewController {
    

    //let cars = ["Lamborghini","Mercedes","Toyota","Tesla","Nissan"]
    

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }


}

extension ViewController:UITableViewDelegate, UITableViewDataSource{
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 1{
            let sectionTwo = tableView.dequeueReusableCell(withIdentifier: "secondSection", for: indexPath)
            sectionTwo.textLabel?.text = car[indexPath.row].name
            sectionTwo.detailTextLabel?.text = car[indexPath.row].price
            return sectionTwo
        }
        
        let sectionOne = tableView.dequeueReusableCell(withIdentifier: "firstSection", for: indexPath) as! FirstTableViewCell
       
        
        
        sectionOne.imgView.image = car[indexPath.row].image
        sectionOne.txtLable.text = car[indexPath.row].name
        
        
        
        return sectionOne
         
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath)")
        performSegue(withIdentifier: Constants.detailsViewSegue, sender: nil)
    }
}

