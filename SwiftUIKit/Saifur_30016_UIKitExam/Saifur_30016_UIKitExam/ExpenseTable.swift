//
//  ExpenseTable.swift
//  Saifur_30016_UIKitExam
//
//  Created by BJIT on 14/12/22.
//

import UIKit

class ExpenseTable: UITableViewCell {

    @IBOutlet weak var expenseTitle: UILabel!
    
    @IBOutlet weak var expenseCost: UILabel!
    
    @IBOutlet weak var expenseDescription: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func addDetails(title:String?, cost:String?, description:String?){
        guard let title = title, let cost = cost, let description = description else {
            expenseTitle?.text = "List is Emplty"
            expenseCost?.text = "0"
            expenseDescription?.text = "Nil"
            return
        }
        expenseTitle?.text = title
        expenseCost?.text = cost
        expenseDescription?.text = description
        

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
