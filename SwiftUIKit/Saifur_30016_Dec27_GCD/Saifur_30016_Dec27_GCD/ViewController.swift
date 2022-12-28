//
//  ViewController.swift
//  Saifur_30016_Dec27_GCD
//
//  Created by BJIT on 27/12/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var task1BG: UIView!
    
    @IBOutlet weak var task1Label: UILabel!
    
    
    
    @IBOutlet weak var task2BG: UIView!
    
    @IBOutlet weak var task2Label: UILabel!
    
    
    @IBOutlet weak var task3BG: UIView!
    
    @IBOutlet weak var task3Label: UILabel!
    


    var colors: [UIColor] = [UIColor.magenta, UIColor.opaqueSeparator, UIColor.green, UIColor.cyan, UIColor.systemIndigo]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    
    
    func task(taskId:Int, sleepTime:Int){
        if taskId == 0{
            for i in 0..<5{
                sleep(UInt32(sleepTime))
                DispatchQueue.main.async {
                    self.task1BG.backgroundColor = self.colors[i]
                    self.task1Label.text = "task\(taskId + 1) \((i+1)*20)% completed"
                    self.task1BG.layer.cornerRadius = 15
                }
            }
        }
        if taskId == 1{
            for i in 0..<5{
                sleep(UInt32(sleepTime))
                DispatchQueue.main.async {
                    self.task2BG.backgroundColor = self.colors[i]
                    self.task2Label.text = "task\(taskId + 1) \((i+1)*20)% completed"
                    self.task2BG.layer.cornerRadius = 15

                }
            }
        }
        if taskId == 2{
            for i in 0..<5{
                sleep(UInt32(sleepTime))
                DispatchQueue.main.async {
                    self.task3BG.backgroundColor = self.colors[i]
                    self.task3Label.text = "task\(taskId + 1) \((i+1)*20)% completed"
                    self.task3BG.layer.cornerRadius = 15

                }
            }
        }
    }
    
    
    
    
    @IBAction func dispatch(_ sender: Any) {
        let alertVC = UIAlertController(title: "Dispatch List", message: "Select an option to dispatch", preferredStyle: .actionSheet)
        let globalConcurrentQueueSync = UIAlertAction(title: "Global Concurrent Queue Sync", style: .default){ _ in
            self.globalConcurrentQueueSync()
            
            
        }
        let globalConcurrentQueueAsync = UIAlertAction(title: "Global Concurrent Queue Async", style: .default){ _ in
            self.globalConcurrentQueueAsync()
            

            
        }
        let customSerialQueueSync = UIAlertAction(title: "Custom Serial Queue Sync", style: .default){ _ in
            self.customSerialQueueSync()
            

            
        }
        let customSerialQueueAsync = UIAlertAction(title: "Custom Serial Queue Async", style: .default){ _ in
            self.customSerialQueueAsync()
            

            
        }
        let customConcurrentQueueSync = UIAlertAction(title: "Custom Concurrent Queue Sync", style: .default){ _ in
            self.customConcurrentQueueSync()
            

            
        }
        let customConcurrentQueueAsync = UIAlertAction(title: "Custom Concurrent Queue Async", style: .default){ _ in
            self.customConcurrentQueueAsync()
            

            
        }
        let cancelAlert = UIAlertAction(title: "Cancel", style: .destructive){_ in
            alertVC.dismiss(animated: true)
        }
        alertVC.addAction(globalConcurrentQueueSync)
        alertVC.addAction(globalConcurrentQueueAsync)
        alertVC.addAction(customSerialQueueSync)
        alertVC.addAction(customSerialQueueAsync)
        alertVC.addAction(customConcurrentQueueSync)
        alertVC.addAction(customConcurrentQueueAsync)
        alertVC.addAction(cancelAlert)
        present(alertVC, animated: true)
    }
    
    
    func globalConcurrentQueueSync(){
        DispatchQueue.global().async {
            
            DispatchQueue.global().sync {
                self.task(taskId: 0, sleepTime: 1)
            }
            DispatchQueue.global().sync {
                self.task(taskId: 1, sleepTime: 2)

            }
            DispatchQueue.global().sync {
                self.task(taskId: 2, sleepTime: 1)

            }

        }
        
    }
    func globalConcurrentQueueAsync(){
        DispatchQueue.global().async {
            
            DispatchQueue.global().async {
                self.task(taskId: 0, sleepTime: 2)
            }
            DispatchQueue.global().async {
                self.task(taskId: 1, sleepTime: 1)

            }
            DispatchQueue.global().async {
                self.task(taskId: 2, sleepTime: 2)

            }

        }
    }
    func customSerialQueueSync(){
        DispatchQueue.global().async {
            //self.globalConcurrentQueueSync()
            DispatchQueue(label: "custom.serial.sync").sync {
                self.task(taskId: 0, sleepTime: 1)
            }
            DispatchQueue(label: "custom.serial.sync").sync {
                self.task(taskId: 1, sleepTime: 1)

            }
            DispatchQueue(label: "custom.serial.sync").sync {
                self.task(taskId: 2, sleepTime: 1)

            }

        }
    }
    func customSerialQueueAsync(){
        DispatchQueue.global().async {
            
            DispatchQueue(label: "custom.serial.async").async {
                self.task(taskId: 0, sleepTime: 1  )
            }
            DispatchQueue(label: "custom.serial.async").async {
                self.task(taskId: 1, sleepTime: 2)

            }
            DispatchQueue(label: "custom.serial.async").async {
                self.task(taskId: 2, sleepTime: 1)

            }

        }
    }
    func customConcurrentQueueSync(){
        DispatchQueue.global().async {
            
            DispatchQueue(label: "custom.con.sync", attributes: .concurrent).sync {
                self.task(taskId: 0, sleepTime: 1)
            }
            DispatchQueue(label: "custom.con.sync", attributes: .concurrent).sync {
                self.task(taskId: 1,sleepTime: 2)

            }
            DispatchQueue(label: "custom.con.sync", attributes: .concurrent).sync {
                self.task(taskId: 2,sleepTime: 1)

            }

        }
    }
    func customConcurrentQueueAsync(){
        DispatchQueue.global().async {
            
            DispatchQueue(label: "custom.con.async", attributes: .concurrent).async {
                self.task(taskId: 0,sleepTime: 2)
            }
            DispatchQueue(label: "custom.con.async", attributes: .concurrent).async {
                self.task(taskId: 1,sleepTime: 1)

            }
            DispatchQueue(label: "custom.con.async", attributes: .concurrent).async {
                self.task(taskId: 2,sleepTime: 3)

            }

        }
    }

}
