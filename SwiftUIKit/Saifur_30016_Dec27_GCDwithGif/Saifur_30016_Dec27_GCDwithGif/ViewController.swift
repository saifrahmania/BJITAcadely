//
//  ViewController.swift
//  Saifur_30016_Dec27_GCDwithGif
//
//  Created by BJIT on 27/12/22.
//

import UIKit

class ViewController: UIViewController {
    var flag = 0
    
    @IBOutlet weak var taskOneImage: UIImageView!
    @IBOutlet weak var taskOneLabel: UILabel!
    
    @IBOutlet weak var taskTwoImage: UIImageView!
    @IBOutlet weak var taskTwoLabel: UILabel!
    
    @IBOutlet weak var taskThreeImage: UIImageView!
    @IBOutlet weak var taskThreeLabel: UILabel!
    
    @IBOutlet weak var taskFourImage: UIImageView!    
    @IBOutlet weak var taskFourLabel: UILabel!
    
    @IBOutlet weak var winnerLabel: UILabel!
    
    @IBOutlet weak var winnerView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    func winner(taskId:String){
        self.winnerLabel.text = "No \(taskId) task is the winner"
        self.winnerView.backgroundColor = .opaqueSeparator
        
    }
    func initiate(){
        flag = 0
        self.taskOneImage.image = UIImage.gifImageWithName("drivingCat")
        self.taskOneLabel.text  = "Task One"
        self.taskTwoImage.image = UIImage.gifImageWithName("drivingCat")
        self.taskTwoLabel.text  = "Task Two"
        self.taskThreeImage.image = UIImage.gifImageWithName("drivingCat")
        self.taskThreeLabel.text  = "Task Three"
        self.taskFourImage.image = UIImage.gifImageWithName("drivingCat")
        self.taskFourLabel.text  = "Task Four"
    }
    
    
    
    @IBAction func dispatch(_ sender: Any) {
        initiate()
        winner(taskId: "0")
        
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
//        for _ in 0...100_000_000{
//
//        }
    }
    
    
    func task(taskId:Int, sleepTime:Int){
        if taskId == 0{
            for i in 1...5{
                sleep(UInt32(sleepTime))
                DispatchQueue.main.async {
                    self.taskOneLabel.text = "task\(taskId + 1) \((i)*20)% completed"
                    self.taskOneImage.transform.tx = self.taskOneImage.transform.tx+70
                    if self.flag == 0{
                        if i*20 == 100{
                            self.flag = 1
                            self.winner(taskId: String(taskId+1))
                        }
                    }
                }
                
            }
            DispatchQueue.main.async {
                self.taskOneImage.image = UIImage.gifImageWithName("Done")
                self.taskOneImage.transform.tx = 0
            }
            
        }
        if taskId == 1{
            for i in 1...5{
                sleep(UInt32(sleepTime))
                DispatchQueue.main.async {
                    self.taskTwoLabel.text = "task\(taskId + 1) \((i)*20)% completed"
                    self.taskTwoImage.transform.tx = self.taskTwoImage.transform.tx+70
                    if self.flag == 0{
                        if i*20 == 100{
                            self.flag = 1
                            self.winner(taskId: String(taskId+1))
                        }
                    }
                }
            }
            DispatchQueue.main.async {
                self.taskTwoImage.image = UIImage.gifImageWithName("Done")
                self.taskTwoImage.transform.tx = 0
            }
            
        }
        if taskId == 2{
            for i in 1...5{
                sleep(UInt32(sleepTime))
                DispatchQueue.main.async {
                    self.taskThreeLabel.text = "task\(taskId + 1) \((i)*20)% completed"
                    self.taskThreeImage.transform.tx = self.taskThreeImage.transform.tx+70
                    if self.flag == 0{
                        if i*20 == 100{
                            self.flag = 1
                            self.winner(taskId: String(taskId+1))
                        }
                    }
                }
            }
            DispatchQueue.main.async {
                self.taskThreeImage.image = UIImage.gifImageWithName("Done")
                self.taskThreeImage.transform.tx = 0
            }
            
        }
        if taskId == 3{
            for i in 1...5{
                sleep(UInt32(sleepTime))
                DispatchQueue.main.async {
                    self.taskFourLabel.text = "task\(taskId + 1) \((i)*20)% completed"
                    self.taskFourImage.transform.tx = self.taskFourImage.transform.tx+70
                    if self.flag == 0{
                        if i*20 == 100{
                            self.flag = 1
                            self.winner(taskId: String(taskId+1))
                        }
                    }
                }
            }
            DispatchQueue.main.async {
                self.taskFourImage.image = UIImage.gifImageWithName("Done")
                self.taskFourImage.transform.tx = 0
            }
            
        }
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
            DispatchQueue.global().sync {
                self.task(taskId: 3, sleepTime: 2)
               
                

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
            DispatchQueue.global().async {
                self.task(taskId: 3, sleepTime: 1)

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
            DispatchQueue(label: "custom.serial.sync").sync {
                self.task(taskId: 3, sleepTime: 1)

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
            DispatchQueue(label: "custom.serial.async").async {
                self.task(taskId: 3, sleepTime: 2)

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
            DispatchQueue(label: "custom.con.sync", attributes: .concurrent).sync {
                self.task(taskId: 3,sleepTime: 2)

            }
            
//            DispatchQueue.main.async{
//                self.loadView()
//            }
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
            DispatchQueue(label: "custom.con.async", attributes: .concurrent).async {
                self.task(taskId: 3,sleepTime: 4)

            }

        }
    }

}




