//
//  CountdownViewController.swift
//  Saifur_30016_Dec29_Timer
//
//  Created by BJIT on 29/12/22.
//

import UIKit

class CountdownViewController: UIViewController {
    var seconds = 30
    var timer = Timer()
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var sliderOutlet: UISlider!
    
    @IBAction func slider(_ sender: UISlider) {
        seconds = Int(sender.value)
        label.text = String(seconds) + " Seconds"
    }
    
    
    @IBOutlet weak var startOutlet: UIButton!
    
    
    @IBAction func start(_ sender: AnyObject) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(CountdownViewController.counter), userInfo: nil, repeats: true)
        
        sliderOutlet.isHidden = true
        startOutlet.isHidden = true
    }
    
    
    @objc func counter()
    {
        seconds -= 1
        label.text = String(seconds) + " Seconds"
        
        if (seconds == 0)
        {
            timer.invalidate()
            
        }
    }
    
    @IBOutlet weak var stopOutlet: UIButton!
    
    @IBAction func stop(_ sender: AnyObject) {
        timer.invalidate()
        seconds = 30
        sliderOutlet.setValue(30, animated: true)
        label.text = "30 Seconds"        
        
        
        sliderOutlet.isHidden = false
        startOutlet.isHidden = false
    }
    
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true,completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    

}
