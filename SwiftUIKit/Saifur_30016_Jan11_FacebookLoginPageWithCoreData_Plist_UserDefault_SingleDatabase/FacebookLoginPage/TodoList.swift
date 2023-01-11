//
//  TodoList.swift
//  FacebookLoginPage
//
//  Created by BJIT on 10/1/23.
//

import UIKit

class TodoList: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let viewModel = ListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()

        // Do any additional setup after loading the view.
    }
    
    func updateTableView(){
        viewModel.fetchData()
        tableView.reloadData()
    }
    

    @IBAction func addTapped(_ sender: Any) {
        alertWithTextField(with: "Add Item", "", "Add", "Cancel", "Enter Here"){ text in 
            if !text.isEmpty{
                self.viewModel.saveData(title: text )
                self.updateTableView()
                
            }
        }
    }
    

}

extension TodoList:UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.listArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoList")!
        cell.textLabel?.text = viewModel.listArray[indexPath.row].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            viewModel.deleteData(index: indexPath.row  )
            updateTableView()
        }
    }
    
    
}
