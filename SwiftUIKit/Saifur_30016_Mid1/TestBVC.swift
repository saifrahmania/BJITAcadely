//
//  TestBVC.swift
//  Saifur_30016_Mid1
//
//  Created by BJIT on 13/1/23.
//

import UIKit

class TestBVC: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    

    @IBOutlet weak var searchTextfield: UITextField!
    
    @IBOutlet weak var newsTable: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newsTable.dataSource = self
        newsTable.delegate = self
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Constant.category.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableRow = newsTable.dequeueReusableCell(withIdentifier: "bookmarkTable", for: indexPath) as! BookmarkTableRow
        tableRow.bookmarkTitle.text = Constant.category[indexPath.row]
        return tableRow
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        newsTable.deselectRow(at: indexPath, animated: true)
    }

    

}


