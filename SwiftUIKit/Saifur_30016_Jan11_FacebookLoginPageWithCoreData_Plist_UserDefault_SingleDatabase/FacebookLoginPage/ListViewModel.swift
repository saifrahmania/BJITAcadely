//
//  ListViewModel.swift
//  FacebookLoginPage
//
//  Created by BJIT on 10/1/23.
//

import Foundation

class ListViewModel{
    var listArray = [List]()
    let coreDataHelper = CoreDataHelper()
    
    func fetchData(){
        listArray = coreDataHelper.fetchData() ?? [List]()
    }
    
    func saveData(title: String){
        coreDataHelper.saveData(title: title)
    }
    
    func deleteData(index:Int){
        coreDataHelper.deleteData(index: index)
    }
}
