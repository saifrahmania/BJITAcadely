//
//  JSONHandler.swift
//  Saifur_30016_Mid1
//
//  Created by BJIT on 14/1/23.
//

import Foundation
import UIKit
import CoreData



class APICaller{
    
    static let jsonShare = APICaller()
    var entryCreation = CoreDataShare.coreShare
    
    private init() {}
    
    func getPost(_ category:String ,_ completion: @escaping (Welcome)->()){
        print("\(category):from getpost")
        guard let url  = URL(string:"\(Constant.apiLink)&category=\(category != "all" ? category : "")&apiKey=\(Constant.apiKey)") else {return}
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
                    for i in 0..<jsonRes.articles.count{
                        self.entryCreation.createEntry(author: jsonRes.articles[i].author ?? "Not Found", category: category, content: jsonRes.articles[i].content ?? "Not Found", description: jsonRes.articles[i].description ?? "Not Found", name: jsonRes.articles[i].source.name ?? "Not Found", publishedAt: jsonRes.articles[i].publishedAt ?? "Not Found", title: jsonRes.articles[i].title, url: jsonRes.articles[i].url ?? "Not Found", urlToImage: jsonRes.articles[i].urlToImage ?? "Not Found")
                    }
                    
                } catch{
                    print(error.localizedDescription)
                    
                }
                
                
            }
        }.resume()
        
    }
}


