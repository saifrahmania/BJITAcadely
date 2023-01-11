//
//  CoreDataHelper.swift
//  FacebookLoginPage
//
//  Created by BJIT on 10/1/23.
//

import Foundation
import UIKit

class CoreDataHelper{
    static let share = CoreDataHelper()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func fetchData() -> [List]?{
        do{
            return try self.context.fetch(List.fetchRequest())
        } catch{
            print("Error: \(error.localizedDescription)")
        }
        return nil
    }
    
    func saveData(title:String){
        let list = List(context: context)
        list.title =  title
        do {
            try self.context.save()
        } catch{
            print("Error: \(error.localizedDescription)")
        }
    }
    
    func deleteData(index: Int){
        if let dataArray = fetchData(){
            context.delete(dataArray[index])
            do {
                try self.context.save()
            } catch{
                print("Error: \(error.localizedDescription)")
            } 
        }
    }
    
}
