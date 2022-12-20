//
//  ViewController.swift
//  ButtonPractice
//
//  Created by BJIT on 25/11/22.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet weak var textField1: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func mediumButtonClicked(_ sender: Any) {
        print("Medium  Button Clicked")
        textField1.text = "Medium Button"
    }
    
    @IBAction func largeButtonClicked(_ sender: Any) {
        print("Large Button Clicked ")
        textField1.text = "Large Button"

    }
    
    @IBAction func smallButtonClicked(_ sender: Any) {
        print("Small Button Clicked")
        textField1.text = "Small Button"

    }
}

