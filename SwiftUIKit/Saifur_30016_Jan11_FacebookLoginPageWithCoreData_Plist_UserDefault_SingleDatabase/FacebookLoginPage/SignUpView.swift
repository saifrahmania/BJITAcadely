//
//  SignUpView.swift
//  FacebookLoginPage
//
//  Created by BJIT on 6/1/23.
//

import UIKit
import Security

/*struct UserInfo:Codable{
    var userName:String
    var userEmail:String
    var userPassword:String
    
}*/

class SignUpView: UIViewController {

    @IBOutlet weak var signUpName: UITextField!
    
    @IBOutlet weak var signUpEmail: UITextField!
    
    @IBOutlet weak var signUpPassword: UITextField!
    
    @IBOutlet weak var submit: UIButton!
    
    @IBOutlet weak var back: UIButton!
    
    @IBOutlet weak var update: UIButton!
    
    @IBOutlet weak var delete: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        readFromKeychain()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func submitTapped(_ sender: Any) {
        if (self.signUpName.text == "" || self.signUpEmail.text == "" || self.signUpPassword.text == "" ){
            let alrt = UIAlertController(title: "Alert", message: "Submit the your info", preferredStyle: .alert)
           let ext = UIAlertAction(title: "Yes", style: .default){ _ in
               alrt.dismiss(animated: true)
               
           }
           let no = UIAlertAction(title: "No", style: .destructive){_ in
               self.dismiss(animated: true)
               
           }
           alrt.addAction(ext)
           alrt.addAction(no)
           present(alrt, animated: true)
        }
        else {
         let userData =      self.signUpPassword.text!
            guard let data = try? JSONEncoder().encode(userData) else { return}
         writeToKeychain(data: data)
        }
        
        
    }
    
    
    @IBAction func backTapped(_ sender: Any) {
        
        let alrt = UIAlertController(title: "Alert", message: "Do you undo the submission", preferredStyle: .alert)
        let ext = UIAlertAction(title: "Yes", style: .default){ _ in
            self.dismiss(animated: true)
        }
        let no = UIAlertAction(title: "No", style: .destructive){_ in
            alrt.dismiss(animated: true)
            
        }
        alrt.addAction(ext)
        alrt.addAction(no)
        present(alrt, animated: true)
    }
    
    @IBAction func updateTapped(_ sender: Any) {
        if (self.signUpName.text == "" || self.signUpEmail.text == "" || self.signUpPassword.text == "" ){
            let alrt = UIAlertController(title: "Alert", message: "Submit the your info", preferredStyle: .alert)
           let ext = UIAlertAction(title: "Yes", style: .default){ _ in
               alrt.dismiss(animated: true)
               
           }
           let no = UIAlertAction(title: "No", style: .destructive){_ in
               self.dismiss(animated: true)
               
           }
           alrt.addAction(ext)
           alrt.addAction(no)
           present(alrt, animated: true)
        }
        else {
            let userData =      self.signUpPassword.text!
            guard let data = try? JSONEncoder().encode(userData) else { return}
            update(data: data)
         
        }
    }
    
    @IBAction func deleteTapped(_ sender: Any) {
        if (self.signUpName.text == "" || self.signUpEmail.text == "" || self.signUpPassword.text == "" ){
            let alrt = UIAlertController(title: "Alert", message: "Submit the your info", preferredStyle: .alert)
           let ext = UIAlertAction(title: "Yes", style: .default){ _ in
               alrt.dismiss(animated: true)
               
           }
           let no = UIAlertAction(title: "No", style: .destructive){_ in
               self.dismiss(animated: true)
               
           }
           alrt.addAction(ext)
           alrt.addAction(no)
           present(alrt, animated: true)
        } else {
            
            let userData =      self.signUpPassword.text!
            guard let data = try? JSONEncoder().encode(userData) else { return}
            
            
            delete(data: data)
            
            
            
        }
    }
    
    // MARK: - Write value to keychain
    func writeToKeychain(data: Data){
        //guard let data = try? JSONDecoder().decode(data, from: data) else {return}
        let email  = signUpEmail.text!
        let password = data
        let query : [CFString:Any] = [
            kSecClass:kSecClassGenericPassword,
            kSecAttrAccount: email,
            kSecAttrService: "password",
            kSecValueData: password
        ]
        
       
        
        var result:AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &result)
        
        if status == errSecSuccess{
            print("This Email Already is in use")
            
        } else {
            print("data added")
            SecItemAdd( query as CFDictionary, nil)
        }
        
        
        /*
                    //MARK: - CFDictionary Casting:
         
         CF dictionary can be casted into multiple way where one is used above and the another one is
         let query : [CFString:Any] = [
             kSecClass:kSecClassGenericPassword,
             kSecAttrAccount: email,
             kSecAttrService: password,
             kSecValueData: name
         ] as CFDictionary
         
         SecItemAdd( query , nil)
         
         */
        
    }
    
    
    func update(data  :  Data){
       
        let email  = signUpEmail.text!
        let password = data
        
        let query = [
            kSecClass:kSecClassGenericPassword,
            kSecAttrAccount: email,
            kSecAttrService: "password"
            
        ] as CFDictionary
        print(password)
        //guard let newData = try? JSONDecoder().decode(String.self, from: data) else {return}
        //print(newData)
        let attributesToUpdate = [
            kSecValueData: password
        ]  as CFDictionary
        
        let status = SecItemUpdate(query, attributesToUpdate)
        
        if status == errSecSuccess {
            print("update successful")
        } else {
            print("Update failed")
        }
    }
    
    func delete(data:Data){
        
        let email  = signUpEmail.text!
        let query = [
            kSecClass:kSecClassGenericPassword,
            kSecAttrAccount: email,
            kSecAttrService: "password"
        ] as CFDictionary
        
        var result:AnyObject?
        let status = SecItemCopyMatching(query , &result)
        
        
        if status == errSecSuccess{
            SecItemDelete(query)
            print("Data has been deleted")
            
        } else {
            print("data added is not available")
            
        }
        
    }
    
   /* func readFromKeychain(name: String, email:String, password:String){
        let query  = [
            kSecClass:kSecClassGenericPassword,
            kSecAttrAccount: email,
            kSecAttrService: password,
            kSecValueData: name,
            kSecReturnData:true,
            kSecReturnAttributes:true
        ] as CFDictionary
        
        var result: CFTypeRef?
        let status = SecItemCopyMatching(query, &result)
        
        if status == errSecSuccess {
            if let result = result as? [CFString : Any] {
                print(result[kSecValueData])
                print(result[kSecAttrAccount])
                print(result[kSecAttrService])
                
                if let data = result[kSecValueData] as? Data {
                    let password = try? JSONDecoder().decode(String.self, from: data)
                    print(password)
                }
            }
        } else {
            print(status)
        }
        
        
    } */
    

    func readFromKeychain(){
        let query: [String: Any] = [kSecClass as String: kSecClassGenericPassword,
                                                        kSecReturnData as String: true,
                                                        kSecMatchLimit as String: kSecMatchLimitAll]

                            var result: AnyObject?

                            let status = SecItemCopyMatching(query as CFDictionary, &result)

                            if status == errSecSuccess {
                                if let data = result as? [[String: Any]] {
                                    for item in data {
                                        if let key = item[kSecAttrAccount as String] as? String, let value = item[kSecValueData as String] as? Data {
                                            print("Key: \(key) Value: \(value)")
                                        }
                                    }
                                }
                            }
                            




}
    

}
