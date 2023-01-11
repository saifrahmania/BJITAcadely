//
//  Plist.swift
//  FacebookLoginPage
//
//  Created by BJIT on 7/1/23.
//

import UIKit

class PassData:Codable{
    var storeData:String = ""
}

class Plist: UIViewController {
    var dictionary: [String: Any] = ["Dummy":"First Data"]

    

    // MARK: - Outlets
    @IBOutlet weak var updateTapped: UIButton!
    @IBOutlet weak var deleteTapped: UIButton!
    @IBOutlet weak var addTapped: UIButton!
    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    // MARK: - Actions
    
    @IBAction func addAction(_ sender: Any) {
        let key = email.text!
        let val = password.text!
       
        
        writeObjectToPlist(key: key, value: val)
    }
    @IBAction func deleteAction(_ sender: Any) {
        deleteFromPlist()
    }
    @IBAction func update(_ sender: Any) {
        
        updatePlist()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        writeToPlist(with: dictionary)
        

        // Do any additional setup after loading the view.
    }
    
    
    func writeToPlist(with dict: [String:Any]){
        guard let resourceDirPath = Bundle.main.resourcePath else {return}
        print(resourceDirPath)
        let filePath = URL(filePath: resourceDirPath).appending(path: "dummy.plist")
        
        do{
            let data = try PropertyListSerialization.data(fromPropertyList: dictionary, format: .xml, options: 0)
            try data.write(to: filePath)
        } catch{
            print(error)
        }
    }
    
    func writeObjectToPlist( key:String,  value:String){
        guard var plist = readFromPlist() else {return}
        
        let test = PassData()
        test.storeData = value
        guard let resourceDirPath = Bundle.main.resourcePath else { return }
        print(resourceDirPath)
        let filePath = URL(filePath: resourceDirPath).appending(path: "dummy.plist")
        do{
            let objData = try JSONEncoder().encode(test)
           
            plist[key] = objData
            let dictData = try PropertyListSerialization.data(fromPropertyList: plist, format: .xml, options: 0)
        //print(type(of: dictData))
        
        try dictData.write(to: filePath)
            print(readFromPlist() as Any)
    } catch {
        print(error)
    }
        
        
        
        
    }
    
    func readFromPlist() -> [String:Any]? {
        guard let resourceDirPath = Bundle.main.resourcePath else { return nil }
        let filePath = URL(filePath: resourceDirPath).appending(path: "dummy.plist")
        print(filePath)
        
        guard let data = try? Data(contentsOf: filePath) else { return nil }
        
        guard let plist = try? PropertyListSerialization.propertyList(from: data, options: .mutableContainersAndLeaves, format: nil) as? [String : Any] else { return nil }
        
        return plist
    }
    
    func updatePlist(){
        guard var plist = readFromPlist() else {return}
        plist.updateValue(password.text!, forKey: email.text!)
        print(plist)
        
    }
    
    func deleteFromPlist(){
        guard var plist = readFromPlist() else {return}
        plist.removeValue(forKey: email.text!)
        print(plist)
        writeToPlist(with: plist)
    }
    
    
    

}
