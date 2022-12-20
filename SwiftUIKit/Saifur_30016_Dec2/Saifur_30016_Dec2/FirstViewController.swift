//
//  FirstViewController.swift
//  Saifur_30016_Dec2
//
//  Created by BJIT on 2/12/22.
//

import UIKit
protocol ChangeBGColorDelegate{
    func changeImage(image:UIImage)
}
class FirstViewController: UIViewController, ChangeBGColorDelegate {
    
    @IBOutlet weak var bgImage: UIImageView!
    
    func changeImage(image: UIImage){
        bgImage.image = image
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MoveToSecondVC"{
            if let segu = segue.destination as? SecondViewController{
                segu.delegate = self
            }
        }
    }



}
