//
//  FormPage.swift
//  Saifur_30016_UIKitExam
//
//  Created by BJIT on 14/12/22.
//

import UIKit

class FormPage: UIViewController {
    var delegate: ViewController?
    var indexPath: IndexPath?
    @IBOutlet weak var formTitle: UITextField!
    
    @IBOutlet weak var formCost: UITextField!
    
    @IBOutlet weak var formDescription: UITextField!
    /*
    let titl:String = formTitle!.text
    let cost:String = formCost!.text
    let descript: String = formDescription!.text
  */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Entry Form"
        
        if let indexPath = indexPath {
            formTitle.text = Expenditure.details[indexPath.row].title
            formCost.text = Expenditure.details[indexPath.row].cost
            formDescription.text = Expenditure.details[indexPath.row].description
        }

        // Do any additional setup after loading the view.
    }
    
    @IBAction func Update(_ sender: Any) {
        if indexPath == nil{
            self.appendToTable(item: Expenditure(title: formTitle.text!, cost: formCost.text!, description: formDescription.text!))
            
            delegate?.tableView.reloadData()
            dismiss(animated: true)
        }
        
        else{
            Expenditure.details[indexPath!.row].title = formTitle.text!
            Expenditure.details[indexPath!.row].cost = formCost.text!
            Expenditure.details[indexPath!.row].description = formDescription.text!
            
            delegate?.tableView.reloadData()
            dismiss(animated: true)
            
            
        }
        
        
        //appendToTable(item: Expenditure(title: formTitle.text!, cost: formCost.text!, description: formDescription.text!))
        //Expenditure.details.insert(Expenditure.init(title: formTitle.text!, cost: formCost.text!, description: formDescription.text!), at: 0)
        
        
    }
    
    func appendToTable(item: Expenditure){
        Expenditure.details.append(item)
        delegate?.tableView.reloadSections([0], with: .fade)
        
        self.dismiss(animated: true)
        
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
