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
    var isPause = true

    @IBOutlet weak var timeScreen: UILabel!
    
    
    
    
    
    @IBOutlet weak var startOutlet: UIButton!
    
    @IBAction func start(_ sender: Any) {
        if(isStart == true){
            //self.startOutlet.isUserInteractionEnabled = false
            self.startOutlet.setTitle("Stop", for: .normal)
            pauseOutlet.isEnabled = true
            self.startOutlet.configuration?.background.backgroundColor = .systemRed
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.action), userInfo: nil, repeats: true)
            //self.startOutlet.isUserInteractionEnabled = false
            
        }
        
        
        else{
            
            //self.startOutlet.isUserInteractionEnabled = false
            self.startOutlet.setTitle("Start", for: .normal)
            startOutlet.configuration?.background.backgroundColor = .systemGreen
            time = 0
            timeScreen.text = "\(time)"
            pauseOutlet.isEnabled = false
            timer.invalidate()
            
        }
        
        isStart = !isStart
        
        
        
                                          

    }
    
    @objc func action(){
        
        time += 1
        timeScreen.text = String(time)
    }
    
    @IBOutlet weak var pauseOutlet: UIButton!
    
    @IBAction func pause(_ sender: Any) {
        
        
        
        
        if(isPause == true){
            
           
            //self.pauseOutlet.isUserInteractionEnabled = false
            self.pauseOutlet.setTitle("Restart", for: .normal)
            self.pauseOutlet.configuration?.background.backgroundColor = .systemCyan
            timer.invalidate()
            
            //self.pauseOutlet.isUserInteractionEnabled = true
        }
        else{
            
            //self.pauseOutlet.isUserInteractionEnabled = false
            self.pauseOutlet.setTitle("Pause", for: .normal)
            //self.pauseOutlet.backgroundColor = .systemBlue
            self.pauseOutlet.configuration?.background.backgroundColor = .systemOrange
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.action), userInfo: nil, repeats: true)
            
            
            
            //self.pauseOutlet.isUserInteractionEnabled = true
            
        }
        isPause = !isPause
        
    }
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timeScreen.layer.cornerRadius = 7.0
        pauseOutlet.layer.cornerRadius = 15.0
        startOutlet.layer.cornerRadius = 15.0
        pauseOutlet.isEnabled = false
        //resetOutlet.layer.cornerRadius = 15.0
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    


}

