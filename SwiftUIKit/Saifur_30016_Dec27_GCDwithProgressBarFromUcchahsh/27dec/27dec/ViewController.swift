//
//  ViewController.swift
//  27dec
//
//  Created by BJIT on 27/12/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var t1: UILabel!
    @IBOutlet weak var t2: UILabel!
    @IBOutlet weak var t3: UILabel!
    var v = 0.0
   
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var chooseExecutionType: UIButton!
    //let taskRunningQueue = DispatchQueue.global()
    let taskRunningQueue = DispatchQueue(label: "thread")

    override func viewDidLoad() {
        super.viewDidLoad()
        self.t1.text = " 0% "
        self.t2.text = " 0% "
        self.t3.text = " 0% "
        progressBar.setProgress(1.0, animated: true)
      
        
        
    }

    @IBAction func selectAction(_ sender: Any) {

        self.t1.text = " 0% "
        self.t2.text = " 0% "
        self.t3.text = " 0% "
  
        progressBar.setProgress(0.0, animated: true)
        self.t1.backgroundColor = UIColor.white
        self.t2.backgroundColor = UIColor.white
        self.t3.backgroundColor = UIColor.white
        self.v = 0.0
        
        showAlert()
       
    }
    
}

extension ViewController{
    func globalQueueConcurrentSync(){
        let globalQueue = DispatchQueue.global()
        taskRunningQueue.async {
            
            globalQueue.sync {
                for i in 1...300{
                    DispatchQueue.main.async {[weak self] in
                        self?.setProgress(updateRate: (1.0/900.0))
                        self?.t1.text = " " + String(i/3) + "% "
                        self?.t1.translatesAutoresizingMaskIntoConstraints = true
                        
                        self?.t1.frame.size.width = CGFloat(i)
                        self?.t1.backgroundColor = UIColor.green
                    }
                    Thread.sleep(forTimeInterval: 0.01)
                }
            }
            
            globalQueue.sync {
                for i in 1...300{
                    DispatchQueue.main.async {[weak self] in
                        self?.setProgress(updateRate: (1.0/900.0))
                        self?.t2.text = " " + String(i/3) + "% "
                        self?.t2.translatesAutoresizingMaskIntoConstraints = true
                        self?.t2.frame.size.width = CGFloat(i)
                        self?.t2.backgroundColor = UIColor.green
                    }
                    Thread.sleep(forTimeInterval: 0.01)
                }
            }
            globalQueue.sync {
                for i in 1...300{
                    DispatchQueue.main.async {[weak self] in
                        self?.setProgress(updateRate: (1.0/900.0))
                        self?.t3.text = " " + String(i/3) + "% "
                        self?.t3.translatesAutoresizingMaskIntoConstraints = true
                        self?.t3.frame.size.width = CGFloat(i)
                        self?.t3.backgroundColor = UIColor.green
                    }
                    Thread.sleep(forTimeInterval: 0.01)
                }
            }
            
        }
    }
    func globalQueueConcurrentAsync(){
        let globalQueue = DispatchQueue.global()
        taskRunningQueue.async {
            
            globalQueue.async {
                for i in 1...300{
                    DispatchQueue.main.async {[weak self] in
                        self?.setProgress(updateRate: (1.0/900.0))
                        self?.t1.text = " " + String(i/3) + "% "
                        self?.t1.translatesAutoresizingMaskIntoConstraints = true
                        
                        self?.t1.frame.size.width = CGFloat(i)
                        self?.t1.backgroundColor = UIColor.green
                    }
                    Thread.sleep(forTimeInterval: 0.01)
                }
            }
            globalQueue.async {
                for i in 1...300{
                    DispatchQueue.main.async {[weak self] in
                        self?.setProgress(updateRate: (1.0/900.0))
                        self?.t2.text = " " + String(i/3) + "% "
                        self?.t2.translatesAutoresizingMaskIntoConstraints = true
                        self?.t2.frame.size.width = CGFloat(i)
                        self?.t2.backgroundColor = UIColor.green
                    }
                    Thread.sleep(forTimeInterval: 0.01)
                }
            }
            globalQueue.async {
                for i in 1...300{
                    DispatchQueue.main.async {[weak self] in
                        self?.setProgress(updateRate: (1.0/900.0))
                        self?.t3.text = " " + String(i/3) + "% "
                        self?.t3.translatesAutoresizingMaskIntoConstraints = true
                        self?.t3.frame.size.width = CGFloat(i)
                        self?.t3.backgroundColor = UIColor.green
                    }
                    Thread.sleep(forTimeInterval: 0.01)
                }
            }
            
        }
        
    }
    
    func customPrivateQueueSerialSync(){
        let serialQueue = DispatchQueue(label: "com.queue.serial-sync")
        taskRunningQueue.async {
            
            serialQueue.sync {
                for i in 1...300{
                    DispatchQueue.main.async {[weak self] in
                        self?.setProgress(updateRate: (1.0/900.0))
                        self?.t1.text = " " + String(i/3) + "% "
                        self?.t1.translatesAutoresizingMaskIntoConstraints = true
                        
                        self?.t1.frame.size.width = CGFloat(i)
                        self?.t1.backgroundColor = UIColor.green
                    }
                    Thread.sleep(forTimeInterval: 0.01)
                }
            }
            serialQueue.sync {
                for i in 1...300{
                    DispatchQueue.main.async {[weak self] in
                        self?.setProgress(updateRate: (1.0/900.0))
                        self?.t2.text = " " + String(i/3) + "% "
                        self?.t2.translatesAutoresizingMaskIntoConstraints = true
                        self?.t2.frame.size.width = CGFloat(i)
                        self?.t2.backgroundColor = UIColor.green
                    }
                    Thread.sleep(forTimeInterval: 0.01)
                }
            }
            serialQueue.sync {
                for i in 1...300{
                    DispatchQueue.main.async {[weak self] in
                        self?.setProgress(updateRate: (1.0/900.0))
                        self?.t3.text = " " + String(i/3) + "% "
                        self?.t3.translatesAutoresizingMaskIntoConstraints = true
                        self?.t3.frame.size.width = CGFloat(i)
                        self?.t3.backgroundColor = UIColor.green
                    }
                    Thread.sleep(forTimeInterval: 0.01)
                }
            }
            
        }
    }
    func customPrivateQueueSerialAsync(){
        let serialQueue = DispatchQueue(label: "com.queue.serial-async")
        taskRunningQueue.async {
            
            serialQueue.async {
                for i in 1...300{
                    DispatchQueue.main.async {[weak self] in
                        self?.setProgress(updateRate: (1.0/900.0))
                        self?.t1.text = " " + String(i/3) + "% "
                        self?.t1.translatesAutoresizingMaskIntoConstraints = true
                        self?.t1.frame.size.width = CGFloat(i)
                        self?.t1.backgroundColor = UIColor.green
                    }
                    Thread.sleep(forTimeInterval: 0.01)
                }
            }
            serialQueue.async {
                for i in 1...300{
                    DispatchQueue.main.async {[weak self] in
                        self?.setProgress(updateRate: (1.0/900.0))
                        self?.t2.text = " " + String(i/3) + "% "
                        self?.t2.translatesAutoresizingMaskIntoConstraints = true
                        self?.t2.frame.size.width = CGFloat(i)
                        self?.t2.backgroundColor = UIColor.green
                    }
                    Thread.sleep(forTimeInterval: 0.01)
                }
            }
            serialQueue.async {
                for i in 1...300{
                    DispatchQueue.main.async {[weak self] in
                        self?.setProgress(updateRate: (1.0/900.0))
                        self?.t3.text = " " + String(i/3) + "% "
                        self?.t3.translatesAutoresizingMaskIntoConstraints = true
                        self?.t3.frame.size.width = CGFloat(i)
                        self?.t3.backgroundColor = UIColor.green
                    }
                    Thread.sleep(forTimeInterval: 0.01)
                }
            }
            
        }
    }
    func customPrivateQueueConcurrentAsync(){
        let concurrentQueue = DispatchQueue(label: "com.queue.Concurrent-async" , attributes: .concurrent)
        taskRunningQueue.async {
            
            concurrentQueue.async {
                for i in 1...300{
                    DispatchQueue.main.async {[weak self] in
                        self?.setProgress(updateRate: (1.0/1200.0))
                        self?.t1.text = " " + String(i/3) + "% "
                        self?.t1.translatesAutoresizingMaskIntoConstraints = true
                        self?.t1.frame.size.width = CGFloat(i)
                        self?.t1.backgroundColor = UIColor.green
                    }
                    Thread.sleep(forTimeInterval: 0.01)
                }
            }
            concurrentQueue.async {
                for i in 1...600{
                    DispatchQueue.main.async {[weak self] in
                        self?.setProgress(updateRate: (1.0/1200.0))
                        self?.t2.text = " " + String(i/6) + "% "
                        self?.t2.translatesAutoresizingMaskIntoConstraints = true
                        self?.t2.frame.size.width = CGFloat(i/2)
                        self?.t2.backgroundColor = UIColor.green
                    }
                    Thread.sleep(forTimeInterval: 0.01)
                }
            }
            //----
            
            //----
            
            concurrentQueue.async {
                for i in 1...300{

                    DispatchQueue.main.async {[weak self] in
                        self?.setProgress(updateRate: (1.0/1200.0))
                        self?.t3.text = " " + String(i/3) + "% "
                        self?.t3.translatesAutoresizingMaskIntoConstraints = true
                        self?.t3.frame.size.width = CGFloat(i)
                        self?.t3.backgroundColor = UIColor.green
                        
                    }
                    Thread.sleep(forTimeInterval: 0.01)
                }
            }
            
        }
        
    }
}

extension ViewController{
    func showAlert(){
        let alertVC = UIAlertController(title: "Available Actions", message: "Select Actions", preferredStyle: .actionSheet)
        let globalQueueConcurrentSync = UIAlertAction(title: "globalQueueConcurrentSync", style: .default){ [weak self]_ in
            self?.globalQueueConcurrentSync()
        }
        let globalQueueConcurrentAsync = UIAlertAction(title: "globalQueueConcurrentAsync", style: .default){ [weak self]_ in
            self?.globalQueueConcurrentAsync()
        }
        let customPrivateQueueSerialSync = UIAlertAction(title: "customPrivateQueueSerialSync", style: .default){ [weak self]_ in
            self?.customPrivateQueueSerialSync()
        }
        let customPrivateQueueSerialAsync = UIAlertAction(title: "customPrivateQueueSerialAsync", style: .default){ [weak self]_ in
            self?.customPrivateQueueSerialAsync()
        }
        let customPrivateQueueConcurrentAsync = UIAlertAction(title: "customPrivateQueueConcurrentAsync", style: .default){ [weak self]_ in
            self?.customPrivateQueueConcurrentAsync()
        }
        let goBackAction = UIAlertAction(title: "Return", style: .destructive){_ in
            alertVC.dismiss(animated: true)
        }
        alertVC.addAction(globalQueueConcurrentSync)
        alertVC.addAction(globalQueueConcurrentAsync)
        alertVC.addAction(customPrivateQueueSerialSync)
        alertVC.addAction(customPrivateQueueSerialAsync)
        alertVC.addAction(customPrivateQueueConcurrentAsync)
        alertVC.addAction(goBackAction)
        present(alertVC, animated: true)
    }
    
    func setProgress(updateRate: Double){
        self.v = self.v + updateRate
        progressBar.setProgress(Float(self.v), animated: true)
    }
}

