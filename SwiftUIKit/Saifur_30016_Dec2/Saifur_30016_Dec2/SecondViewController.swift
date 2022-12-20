//
//  SecondViewController.swift
//  Saifur_30016_Dec2
//
//  Created by BJIT on 2/12/22.
//

import UIKit

class SecondViewController: UIViewController {
    var delegate: ChangeBGColorDelegate?
    
    @IBAction func clickBlackButton(_ sender: Any) {
        delegate?.changeImage(image: UIImage(named: "Aegon_II_Targaryen")!)
        self.dismiss(animated: true)

    }
    @IBAction func clickGreenButton(_ sender: Any) {
        delegate?.changeImage(image: UIImage(named: "download")!)
        self.dismiss(animated: true)
    }
    

    

}


