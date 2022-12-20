//
//  ViewController.swift
//  AlertVCDemo
//
//  Created by BJIT on 13/12/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

   
    @IBAction func showAlertTapped(_ sender: Any) {
        showAlert()
    }
    
    
    func showAlert(){
        let alertVC = UIAlertController(title: "Alert!", message: "This is an Allert", preferredStyle: .actionSheet)
        //present(alertVC, animated: true)
        
        let addItemAction = UIAlertAction(title: "Add Item", style: .default){
            [weak self] _ in
            guard let self = self else { return }
            self.additem(item: "item 1")
            if let input = alertVC.textFields?[0].text{
                 self.additem(item: input)
                 
            }
        }
        
        let addItemAction1 = UIAlertAction(title: "Add Item", style: .default){
            [weak self] _ in
            guard let self = self else { return }
            self.additem(item: "item 1")
            if let input = alertVC.textFields?[0].text{
                 self.additem(item: input)
                 
            }
        }
        
        let addItemAction2 = UIAlertAction(title: "Add Item", style: .default){
            [weak self] _ in
            guard let self = self else { return }
            self.additem(item: "item 1")
            if let input = alertVC.textFields?[0].text{
                 self.additem(item: input)
                 
            }
        }
        
        let addItemAction3 = UIAlertAction(title: "Add Item", style: .default){
            [weak self] _ in
            guard let self = self else { return }
            self.additem(item: "item 1")
            if ((alertVC.textFields?.isEmpty) != nil){
            if let input = alertVC.textFields?[0].text{
                 self.additem(item: input)
                 
                }
            }
        }
        
        alertVC.addAction(addItemAction)
        alertVC.addAction(addItemAction1)
        alertVC.addAction(addItemAction2)
        alertVC.addAction(addItemAction3)
        present(alertVC, animated: true)
//        alertVC.addTextField(){ textField in
//            textField.placeholder =  "Enter Item name Here "
//
//        }
        
        }
    
    func additem(item:String){
        print("\(item) has been added")
    }
}

