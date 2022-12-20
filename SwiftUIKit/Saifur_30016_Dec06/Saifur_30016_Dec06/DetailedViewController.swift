//
//  DetailedViewController.swift
//  Saifur_30016_Dec06
//
//  Created by BJIT on 7/12/22.
//

import UIKit

class DetailedViewController: UIViewController {
    var deleGete: ViewController?
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var descr: UILabel!
    
    var tmpImg:UIImage?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let index = deleGete?.tableView.indexPathForSelectedRow
        
        if(index!.section == 0){
            //image.image = Car.car[index!.row].image
            name.text = Car.car[index!.row].name
            descr.text = Car.car[index!.row].description

        } else if(index!.section == 1){
            image.image = Car.car[index!.row].image
            name.text = Car.car[index!.row].name
            //descr.text = Car.car[index!.row].description

        }
        else{
            //image.image = Car.car[index!.row].image
            name.text = Car.car[index!.row].name
            //descr.text = Car.car[index!.row].description
        }
//        
        
        
    }
}
