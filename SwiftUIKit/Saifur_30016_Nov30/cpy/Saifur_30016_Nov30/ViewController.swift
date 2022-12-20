//
//  ViewController.swift
//  Saifur_30016_Nov30
//
//  Created by BJIT on 30/11/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var TextField: UITextField!
    
    @IBOutlet weak var TextView: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func Append(_ sender: Any) {
        guard let _ = TextView.text, let _ = TextField.text else{
            return
        }
        TextView.text = TextField.text! + TextView.text!
        
    }
    
    
    @IBAction func Cancel(_ sender: Any) {
        TextView.text = ""
        
    }
}

