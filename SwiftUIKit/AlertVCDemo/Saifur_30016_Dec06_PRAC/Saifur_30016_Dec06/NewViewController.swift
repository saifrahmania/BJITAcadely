//
//  NewViewController.swift
//  Saifur_30016_Dec06
//
//  Created by BJIT on 8/12/22.
//

import UIKit

class NewViewController: UIViewController {
    @IBOutlet weak var imageX: UIImageView!
    
    @IBOutlet weak var labelNameX: UILabel!
    
    
    @IBOutlet weak var labelDesc2: UILabel!
    
    
    var forImage: String?
    var forName: String?
    var forDesc: String?
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        imageX.image = UIImage(named: forImage!)
        labelNameX.text = forName
        labelDesc2.text = forDesc
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
