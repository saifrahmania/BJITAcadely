//
//  ViewController.swift
//  Saifur_30016_UIKitExam
//
//  Created by BJIT on 14/12/22.
//

import UIKit

struct Expenditure{
    var title:String
    var cost:String
    var description:String
    
    static var details:[Expenditure] = [
        Expenditure(title: "Tea" , cost: "15", description: "Milk Tea"),
        Expenditure(title: "Coffee", cost: "75" , description: "Cold Coffee" ),
        Expenditure(title: "Snacks", cost: "85" , description: "Burger"),
        
    ]
}

class ViewController: UIViewController {
    
    var selectIndexPath : IndexPath!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Home"
        tableView.delegate = self
        tableView.dataSource = self
        let headerNib = UINib(nibName: "CustomHeader", bundle: nil)
        tableView.register(headerNib, forHeaderFooterViewReuseIdentifier: "CustomHeader")
        
    }


}

extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "editSegue", sender: nil)
    }
}

extension ViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //UITableViewCell()
        let cell = tableView.dequeueReusableCell(withIdentifier: "expenseCollection", for: indexPath) as! ExpenseTable
        let name = Expenditure.details[indexPath.row].title
        let cost = Expenditure.details[indexPath.row].cost
        let description = Expenditure.details[indexPath.row].description
        cell.expenseTitle.text = name
        cell.expenseCost.text = cost
        cell.expenseDescription.text = description
        
        return cell
        
        
        
        
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: nil){[weak self] _, _, completion in
            guard let _ = self else {
                completion(false)
                return
            }
            self?.handleDeleteAction(at: indexPath)
            completion(true)
        }
        deleteAction.image = UIImage(systemName: "trash")
        deleteAction.backgroundColor = .systemRed
        let swipeConfig = UISwipeActionsConfiguration(actions: [deleteAction])
        swipeConfig.performsFirstActionWithFullSwipe = false
        
        return swipeConfig
        
    }
    
    func handleDeleteAction(at indexPath: IndexPath) {
        Expenditure.details.remove(at: indexPath.row)
        tableView.beginUpdates()
        tableView.deleteRows(at: [indexPath], with: .left)
        tableView.endUpdates()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    /*
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        if section == 0 {
            let sectionHeader = tableView.dequeueReusableHeaderFooterView(withIdentifier: "CustomHeader")
            //sectionHeader.bgView.backgroundColor = .cyan
            //sectionHeader.customHeader.text =  "Expense Manager"
            return sectionHeader
        } 
        return UIView()
        
    }*/
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionHeader = tableView.dequeueReusableHeaderFooterView(withIdentifier: "CustomHeader") as? CustomHeader
        if section == 0 {
            sectionHeader?.backGroundView.backgroundColor  = .darkGray
            var sum:Double = 0.0
            for i in 0..<Expenditure.details.count{
                sum += Double(Expenditure.details[i].cost) ?? 0
            }
            sectionHeader?.expenseManager.text = "Cost: " + String(sum)
            sectionHeader?.expenseManager.textColor = .white
            return sectionHeader
        }
        return UIView()
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 80
        
    }

    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let editAction = UIContextualAction(style: .normal, title: nil){[weak self] _,_,completion in
            if indexPath.section == 0{
                self!.selectIndexPath = indexPath
                self!.performSegue(withIdentifier: "editSegue", sender: nil)
                //Expenditure.details[indexPath.row].title = "edited"
                tableView.reloadData()
            }
            guard let self  = self else { return }
            self.handleUpdatetAction(indexPath: indexPath)
            completion(true)
        }
        editAction.image = UIImage(systemName: "pencil.tip.crop.circle")
        editAction.backgroundColor = .gray
        let swipeHeadingAction = UISwipeActionsConfiguration(actions: [editAction])
        swipeHeadingAction.performsFirstActionWithFullSwipe = false
        return swipeHeadingAction
        
    }
    
    func handleUpdatetAction(indexPath: IndexPath){
         print("Edited!!")
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Expenditure.details.count
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "segueToUpdate"{
            if let updateSegue = segue.destination as? FormPage{
                updateSegue.indexPath = selectIndexPath
                updateSegue.delegate = self
                
            }
            
        }
        if segue.identifier == "editSegue"{
            if let editSegue = segue.destination as? FormPage{
                editSegue.indexPath = selectIndexPath
                editSegue.delegate = self
            }
        }
    }
}

