//
//  ViewController.swift
//  Saifur_30016_Dec29_Timer
//
//  Created by BJIT on 29/12/22.
//  MARK: - Project to display

import UIKit

class ViewController: UIViewController {
    
    var time = 0
    var timer = Timer()
    var isStart = true
    var isPause = true
    var hour = 0
    var minute  = 0
    

    @IBOutlet weak var timeScreen: UILabel!
    
    
    
    
    
    @IBOutlet weak var startOutlet: UIButton!
    
    @IBAction func start(_ sender: Any) {
        if(isStart == true){
            //self.startOutlet.isUserInteractionEnabled = false
            DispatchQueue.main.async {
                self.startOutlet.setTitle("Stop", for: .normal)
                self.pauseOutlet.isEnabled = true
                self.startOutlet.configuration?.background.backgroundColor = .systemRed
                self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.action), userInfo: nil, repeats: true)
                self.timeScreen.text = "\(self.time)"
            }
            //self.startOutlet.isUserInteractionEnabled = false
            
        }
        
        
        else{
            
            //self.startOutlet.isUserInteractionEnabled = false
            DispatchQueue.main.async {
                self.startOutlet.setTitle("Start", for: .normal)
                self.startOutlet.configuration?.background.backgroundColor = .systemGreen
                self.time = 0
                self.hour = 0
                self.minute = 0
                self.timeScreen.text = self.makeTimeString(hours: 0, minutes: 0, seconds: 0)
                self.pauseOutlet.isEnabled = false
                self.timer.invalidate()
            }
            
        }
        
        isStart = !isStart
        
        
        
                                          

    }
    
    @objc func action(){
        
        time += 1
        let times = secondsToHoursMinutesSeconds(seconds: time)
        let timeString = makeTimeString(hours: times.0, minutes: times.1, seconds: times.2)
        timeScreen.text = timeString
        
    }
    
    func secondsToHoursMinutesSeconds(seconds: Int) -> (Int, Int, Int)
        {
            return ((seconds / 3600), ((seconds % 3600) / 60),((seconds % 3600) % 60))
        }
    
    @IBOutlet weak var pauseOutlet: UIButton!
    
    @IBAction func pause(_ sender: Any) {
        
        
        
        
        if(isPause == true){
            
           
            //self.pauseOutlet.isUserInteractionEnabled = false
            DispatchQueue.main.async {
                self.pauseOutlet.setTitle("Restart", for: .normal)
                self.pauseOutlet.configuration?.background.backgroundColor = .systemCyan
                self.timer.invalidate()
            }
            
            //self.pauseOutlet.isUserInteractionEnabled = true
        }
        else{
            
            //self.pauseOutlet.isUserInteractionEnabled = false
            DispatchQueue.main.async {
                self.pauseOutlet.setTitle("Pause", for: .normal)
                //self.pauseOutlet.backgroundColor = .systemBlue
                self.pauseOutlet.configuration?.background.backgroundColor = .systemOrange
                self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.action), userInfo: nil, repeats: true)
            }
            
            
            
            //self.pauseOutlet.isUserInteractionEnabled = true
            
        }
        isPause = !isPause
        
    }
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.async {
            self.timeScreen.layer.cornerRadius = 7.0
            self.pauseOutlet.layer.cornerRadius = 15.0
            self.startOutlet.layer.cornerRadius = 15.0
            self.pauseOutlet.isEnabled = false
        }
        //resetOutlet.layer.cornerRadius = 15.0
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func makeTimeString(hours: Int, minutes: Int, seconds : Int) -> String
        {
            var timeString = ""
            timeString += String(format: "%02d", hours)
            timeString += " : "
            timeString += String(format: "%02d", minutes)
            timeString += " : "
            timeString += String(format: "%02d", seconds)
            return timeString
        }
    
    


}

