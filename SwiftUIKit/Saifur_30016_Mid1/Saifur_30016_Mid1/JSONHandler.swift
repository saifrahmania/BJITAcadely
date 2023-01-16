//
//  JSONHandler.swift
//  Saifur_30016_Mid1
//
//  Created by BJIT on 14/1/23.
//

import Foundation
import UIKit
import CoreData



class JSONHandler{
   
    static let shared = JSONHandler()
    
    func getPost(_ category:String ,_ completion: @escaping (Welcome)->()){
        print("\(category):from getpost")
        guard let url  = URL(string:"\(Constant.apiLink)&category=\(category)&apiKey=\(Constant.apiKey)") else {return}
        let session = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print("There was an error: \(error.localizedDescription)")
            } else {
                guard let data = data else {
                    print("Data not found")
                    return
                }
                do {
                    let jsonRes = try JSONDecoder().decode(Welcome.self, from: data)
                    //print("Title:\(jsonRes.articles[0].title)")
                    completion(
                        jsonRes
                    )
                    
                    
                   
                    
                } catch{
                    print(error.localizedDescription)
                   
                }
                
                
            }
        }.resume()
        
    }
     
    
}
