//
//  ViewController2.swift
//  Saifur_30016_Nov30
//
//  Created by BJIT on 1/12/22.
//

import UIKit

class ViewController2: UIViewController {

    @IBOutlet weak var TextView: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func Red(_ sender: Any) {
        guard let _ = TextView.text else {
            return
        }
        TextView.text =  TextView.text! + "Red"
        TextView.textColor = UIColor.systemRed
    }
    
    @IBAction func Blue(_ sender: Any) {
        guard let _ = TextView.text else {
            return
        }
        TextView.text =  TextView.text! + "Blue"
        TextView.textColor = UIColor.systemBlue
    }
    @IBAction func Yellow(_ sender: Any) {
        guard let _ = TextView.text else {
            return
        }
        TextView.text =  TextView.text! + "Yellow"
        TextView.textColor = UIColor.systemYellow
    }
    
    @IBAction func Clear(_ sender: Any) {
        TextView.text = ""
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
