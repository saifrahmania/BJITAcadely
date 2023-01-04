//
//  HomeViewController.swift
//  Saifur_30016_Dec29_Timer
//
//  Created by BJIT on 2/1/23.
//

import UIKit

class HomeViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(self.bjitLogo) /** *BJIT Logo sceen added to the subView* */
        view.backgroundColor = .systemBackground

    }
    
    // MARK: - override subView Function
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        bjitLogo.center = view.center
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3, execute: {self.animate()}) // dispatch time of logo
    }
    
    // MARK: - animation function for subView
    private func animate(){
        UIView.animate(withDuration: 0){
            let size  = self.view.frame.size.width * 3
            let diffX = size - self.view.frame.size.width
            let diffY = self.view.frame.size.height - size
            
            self.bjitLogo.frame = CGRect(
                x: -(diffX/2),
                y: diffY/2,
                width: size,
                height: size)
        }
        UIView.animate(withDuration: 1.5, animations: {
            self.bjitLogo.alpha = 0
        }, completion: { done in
            if done {
                DispatchQueue.main.asyncAfter(deadline: .now()+0.7) {
                    
                    let viewController =  self.storyboard?.instantiateViewController(withIdentifier: "main") as! ViewController // transit to main ViewController
                    
                    viewController.modalTransitionStyle = .partialCurl
                    viewController.modalPresentationStyle = .fullScreen
                    self.present(viewController, animated: true)
                }
            }
        })
    }
    
    // MARK: - LOCK SCREEN LOGO IMAGE
    private let bjitLogo:UIImageView = {
        let bjitLogo = UIImageView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        bjitLogo.image = UIImage(named: "bjit-academy")
        return bjitLogo
    }()
        
    }
    

    
