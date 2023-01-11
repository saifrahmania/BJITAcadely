//
//  ViewController.swift
//  FacebookLoginPage
//
//  Created by BJIT on 7/1/23.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Outlets
        
    @IBOutlet weak var value: UITextField!
    
    @IBOutlet weak var addTapped: UIButton!
    
    @IBOutlet weak var deleteTapped: UIButton!
    @IBOutlet weak var showTapped: UIButton!
    
    @IBOutlet weak var label: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Actions
    
    
    @IBAction func add(_ sender: Any) {
        UserDefaults.standard.setValue(value.text!, forKey: "data")
        label.text = "Data Saved"
        
    }
    
    @IBAction func del(_ sender: Any) {
        UserDefaults.standard.removeObject(forKey: "data")
    }
    
    @IBAction func show(_ sender: Any) {
        let showData = UserDefaults.standard.string(forKey: "data")
        if showData == nil {
            label.text = "Data is not available"
        }
        else {
            label.text = showData!
        }
    }
    

}
