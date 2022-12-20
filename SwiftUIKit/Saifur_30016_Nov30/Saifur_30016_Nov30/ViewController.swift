//
//  ViewController.swift
//  Saifur_30016_Nov30
//
//  Created by BJIT on 30/11/22.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var textInput: UITextField!
    
    @IBOutlet weak var textOutput: UILabel!
    
    @IBAction func Append(_ sender: Any) {
        guard let textInp = textInput.text,
              let textOut = textOutput.text else{
            return
        }
        textOutput.text = textInp + textOut
    }
    
    
    @IBAction func Cancel(_ sender: Any) {
        textOutput.text = ""
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


}

