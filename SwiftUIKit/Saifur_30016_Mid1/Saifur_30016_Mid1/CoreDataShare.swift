//
//  CoreDataHandler.swift
//  Saifur_30016_Mid1
//
//  Created by BJIT on 17/1/23.
//

import Foundation
import UIKit
import CoreData



class CoreDataShare{
    static let coreShare = CoreDataShare()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var models = [News]()

    private init() {}

    //return All data from the persistant container
    func getAllItems() -> [News]  {
        do{
            models = try context.fetch(News.fetchRequest())
         
     

        } catch{
            print(error)
        }
        return models
        
    }

    func createEntry(author:String,category:String,content:String,description:String,name:String,publishedAt:String,title:String,url:String,urlToImage:String){
        let newsEntry = News(context: context)
        newsEntry.author = author
        newsEntry.category = category
        newsEntry.content = content
        newsEntry.descript = description
        newsEntry.name = name
        newsEntry.publishedAt = publishedAt
        newsEntry.title = title
        newsEntry.url = url
        newsEntry.urlToImage = urlToImage
        
        /*do{
            try context.save()
        } catch{
            print(error.localizedDescription)
        }*/
       
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {return}
            
            do{
                try self.context.save()
            } catch{
                print(error.localizedDescription)
            }



        }
        
    }

    
}
