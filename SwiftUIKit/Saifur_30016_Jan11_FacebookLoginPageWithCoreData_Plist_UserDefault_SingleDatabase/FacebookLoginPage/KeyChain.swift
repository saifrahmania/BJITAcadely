//
//  ViewController.swift
//  FacebookLoginPage
//
//  Created by BJIT on 1/12/22.
//

import UIKit



class KeyChain: UIViewController {
    var personalMail = ""
    var loginPassword = ""
    
    @IBOutlet weak var signInEmail: UITextField!
    
    @IBOutlet weak var signInPassword: UITextField!
    
    @IBOutlet weak var login: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        if(self.signInEmail.text == "" || self.signInPassword.text == ""){
            let alrt = UIAlertController(title: "Alert", message: "Submit the your info", preferredStyle: .alert)
            let ext = UIAlertAction(title: "Yes", style: .default){ _ in
                alrt.dismiss(animated: true)
                
            }
            
            alrt.addAction(ext)
            
            present(alrt, animated: true)
            //self.login.addTarget(self,action: #selector(animateAdd(sender: )),  for: .touchUpOutside)
        }
        else {
            
            let query  = [
                kSecClass : kSecClassGenericPassword,
                kSecAttrAccount : signInEmail.text!,
                kSecAttrService : "password",
                kSecReturnData: true,
                kSecReturnAttributes: true
            
            ] as CFDictionary
            
            var result:AnyObject?
            let status = SecItemCopyMatching(query , &result)
            
            if status == errSecSuccess{
                if let result = result as? [CFString:Any]{
                    personalMail   = result[kSecAttrAccount] as! String
                    if let data = result[kSecValueData] as? Data {
                        let password = try? JSONDecoder().decode(String.self, from: data)
                        loginPassword = password!
                        print(loginPassword)
                    }
                    
                }
                
                if loginPassword == signInPassword.text{
                    performSegue(withIdentifier: "successfulLogin", sender: self)
                    
                    
                }
                
                else {
                    print("login failed")
                }
                
                
            }
            else {
                print("status failed")
            }
            
        }
        
        
        
        
        /*
         //MARK: - tried to add animaion to login Button
         @objc func animateAdd(sender:UIButton){
         self.animatedView(sender)
         }
         
         func animatedView(_ viewToAnimate:UIView){
         UIView.animate(withDuration: 0.15, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.5,options: .curveEaseInOut, animations: {
         viewToAnimate.transform = CGAffineTransform(scaleX: 0.92, y: 0.92)
         }) { (_) in
         UIView.animate(withDuration: 0.15, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 2,options: .curveEaseInOut, animations: {
         viewToAnimate.transform = CGAffineTransform(scaleX: 1, y: 1)
         },completion: nil)
         }
         }
         */
        
        /*  func readFromKeyChain(account: String, service: String) {
         
         let query = [
         kSecClass : kSecClassGenericPassword,
         kSecAttrAccount: account,
         kSecAttrService: service,
         kSecReturnData: true,
         kSecReturnAttributes: true
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
        
//        func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//                if segue.identifier == "successfulLogin" {
//                    let destinationVC = segue.destination as! SuccessfulLogin
//                    destinationVC.status.text = "Login Successful"
//                }
//            }
        
        

        
        func readFromKeyChain(account: String, service: String) -> (String,String) {
            
            var accountX = ""
            var passwordX = ""
            
            let query = [
                kSecClass : kSecClassGenericPassword,
                kSecAttrAccount: account,
                kSecAttrService: service,
                kSecReturnData: true,
                kSecReturnAttributes: true
            ] as CFDictionary
            
            var result: CFTypeRef?
            let status = SecItemCopyMatching(query, &result)
            
            if status ==  errSecSuccess {
                if let result = result as? [CFString : Any] {
                    //                print(result[kSecValueData])
                    //                print(result[kSecAttrAccount]!)
                    //                print(result[kSecAttrService])
                    //
                    accountX = result[kSecAttrAccount] as! String
                    
                    
                    if let data = result[kSecValueData] as? Data {
                        let password = try? JSONDecoder().decode(String.self, from: data)
                        passwordX = password!
                        //print(password)
                    }
                }
            } else {
                print(status)
            }
            
            return (accountX, passwordX)
            
            
        }
        
    }
}
extension KeyChain{
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "successfulLogin" {
            if let destinationVC = segue.destination as? SuccessfulLogin{
                destinationVC.loadViewIfNeeded()
                destinationVC.status.text! = "Login Successful"
            }
        }
    }
}

