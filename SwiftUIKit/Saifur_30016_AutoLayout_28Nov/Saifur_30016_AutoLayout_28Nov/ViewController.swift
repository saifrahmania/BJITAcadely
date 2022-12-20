//
//  ViewController.swift
//  Saifur_30016_AutoLayout_28Nov
//
//  Created by BJIT on 28/11/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelView: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func RedButton(_ sender: Any) {
        labelView.text = "Red"
        labelView.textColor = UIColor.red
    }
    
    @IBAction func BlueButton(_ sender: Any) {
        labelView.text = "Blue"
        labelView.textColor = UIColor.blue
    }
    
    @IBAction func YellowButton(_ sender: Any) {
        labelView.text = "Yellow"
        labelView.textColor = UIColor.yellow
    }
    
    
}

