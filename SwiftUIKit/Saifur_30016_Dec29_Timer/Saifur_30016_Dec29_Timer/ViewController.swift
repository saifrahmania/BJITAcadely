//
//  ViewController.swift
//  Saifur_30016_Dec29_Timer
//
//  Created by BJIT on 29/12/22.
//

import UIKit

class ViewController: UIViewController {
    
    var time = 0
    var timer = Timer()
    var isStart = true
    var isPause = false

    @IBOutlet weak var timeScreen: UILabel!
    
    @IBOutlet weak var startOutlet: UIButton!
    
    @IBAction func start(_ sender: Any) {
        if(isStart == true){
            isStart = false
            isPause = true
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.action), userInfo: nil, repeats: true)
        }
    }
    
    @objc func action(){
    
        time += 1
        timeScreen.text = String(time)
    }
    
    @IBOutlet weak var pauseOutlet: UIButton!
    
    @IBAction func pause(_ sender: Any) {
        if (isPause == true){
            isPause = false
            isStart = true
        timer.invalidate()
        }
    }
    
    @IBOutlet weak var resetOutlet: UIButton!
    @IBAction func reset(_ sender: Any) {
        time = 0
        timeScreen.text = "0"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timeScreen.layer.cornerRadius = 7.0
        pauseOutlet.layer.cornerRadius = 15.0
        startOutlet.layer.cornerRadius = 15.0
        resetOutlet.layer.cornerRadius = 15.0
        
        
        
                                  
        
    }
      
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    


}

