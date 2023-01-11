//
//  UIViewController.swift
//  FacebookLoginPage
//
//  Created by BJIT on 10/1/23.
//

import Foundation
import UIKit

extension UIViewController{
    func alertWithTextField(with title:String, _ message: String,
                            _ actionBuittonTitle:String,
                            _ cancelButtonTittle:String, _ placeholder: String, completion: @escaping(String)->()) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addTextField{ textField in
            textField.placeholder = placeholder
            
        }
        let actionButton = UIAlertAction(title: actionBuittonTitle, style: .default){action in
            completion(alertController.textFields?[0].text ?? "")
        }
        let cancelButton = UIAlertAction(title: cancelButtonTittle, style: .cancel, handler: nil)
        alertController.addAction(actionButton)
        alertController.addAction(cancelButton)
        present(alertController, animated: true,completion: nil)
    }
}
