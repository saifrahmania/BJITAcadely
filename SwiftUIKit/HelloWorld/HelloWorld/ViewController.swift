//
//  ViewController.swift
//  HelloWorld
//
//  Created by BJIT on 25/11/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func NewAction(_ sender: UIButton) {
        print("Any Message")
    }
    
    @IBAction func SmallButton(_ sender: Any) {
        print("Small Button Clicked")
    }
    
    @IBAction func LaregeButton(_ sender: Any) {
        print("Large Button Clicked")
    }
    
    
    @IBAction func MediumButton(_ sender: Any) {
        print("Medium Button Clicked")
    }
}


