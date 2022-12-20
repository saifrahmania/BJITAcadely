//
//  ViewController.swift
//  UIKitPreparation
//
//  Created by BJIT on 13/12/22.
//

import UIKit

struct Car{
    var carBrand:String
    var carName:String
    
    static let car = [
   // Car(carBrand: "Toyota", carName: "Toyota"),
    Car(carBrand: "Toyota", carName: "Toyota1"),
    Car(carBrand: "Toyota", carName: "Toyota2"),
    Car(carBrand: "Toyota", carName: "Toyota3"),
    Car(carBrand: "Nissan", carName: "Nissan"),
    Car(carBrand: "Nissan", carName: "Nissan1"),
    Car(carBrand: "Nissan", carName: "Nissan2"),
    Car(carBrand: "Nissan", carName: "Nissan3"),
    Car(carBrand: "Lamborghini", carName: "Lamborghini"),
    Car(carBrand: "Lamborghini", carName: "Lamborghini1"),
    Car(carBrand: "Lamborghini", carName: "Lamborghini2"),
    Car(carBrand: "Lamborghini", carName: "Lamborghini3"),
    Car(carBrand: "Mercedes", carName: "Mercedes"),
    Car(carBrand: "Mercedes", carName: "Mercedes1"),
    Car(carBrand: "Mercedes", carName: "Mercedes2"),
    Car(carBrand: "Mercedes", carName: "Mercedes2"),
    Car(carBrand: "Tesla", carName: "Tesla"),
    Car(carBrand: "Tesla", carName: "Tesla1"),
    Car(carBrand: "Tesla", carName: "Tesla2"),
    Car(carBrand: "Tesla", carName: "Tesla3")
    ]
}



class ViewController: UIViewController {
    @IBOutlet weak var brandCollection: UICollectionView!
    
    @IBOutlet weak var carCollection: UITableViewCell!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


}

