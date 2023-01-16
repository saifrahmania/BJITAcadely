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
    
    func getPost(_ completion: @escaping (Welcome)->()){
        guard let url  = URL(string:"https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=0c6314369f734e59878e25fd2cede7b3") else {return}
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
