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
    var flag = true
    var time :Timer?
    
    //MARK: outlet and Action collection
    
    @IBOutlet weak var countDownView: UIView!
    @IBOutlet weak var stopOutlet: UIButton!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var startOutlet: UIButton!
    @IBOutlet weak var sliderOutlet: UISlider!
    
    @IBAction func slider(_ sender: UISlider) {
        seconds = Int(sender.value)
        label.text = String(seconds) + " Seconds"
    }
    
    @IBAction func start(_ sender: UIAction) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(counter), userInfo: nil, repeats: true)
        
        sliderOutlet.isHidden = true
        startOutlet.isHidden = true
       
        
        //self.superview?.layoutIfNeeded()
    }
    
    
    @IBAction func stop(_ sender: UIAction) {
        timer.invalidate()
        seconds = 30
        sliderOutlet.setValue(30, animated: true)
        label.text = "30 Seconds"
        sliderOutlet.isHidden = false
        startOutlet.isHidden = false
        self.time?.invalidate()
        //label.transform = CGAffineTransform(scaleX: 1, y: 1)
        
    }
    
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true,completion: nil)
        
    }
   
    //MARK: viewDidLoad function to add animation
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        
            super.viewWillAppear(animated)
        let option: UIView.AnimationOptions = [.curveEaseInOut,.autoreverse]
            self.time = Timer.scheduledTimer(withTimeInterval: 2, repeats: true){ [weak self] time in
                self?.countDownView.backgroundColor  = .cyan
                UIView.animate(withDuration: 1, delay: 0, options: option, animations: { [weak self] in
                    self?.label.font = self?.label.font.withSize(40)
                    
                    //self?.label.bounds.size.height *= 1.6
                    //CGAffineTransform(x: 2, y: 2)
                    //self?.label.transform.scaledBy(x: <#T##CGFloat#>, y: <#T##CGFloat#>)
                    self?.countDownView.backgroundColor = .green
                    self?.countDownView.bounds.size.width *= 1.6
                    self?.countDownView.bounds.size.height *= 1.6
                    self?.label.layoutIfNeeded()
                    
                }, completion: { [weak self] _ in
                    guard let self = self else {
                                       return
                    }
                        if !self.flag {
                            time.invalidate()
                        }
                     
                })
        }
            
        
    }
    
    
    
    
    
    
    
    
    // MARK: -  @objc counter
    @objc func counter()
    {
        seconds -= 1
        label.text = String(seconds) + " Seconds"
        
        if (seconds == 0)
        {
            timer.invalidate()
            
        }
    }
    
    
    
    

}

