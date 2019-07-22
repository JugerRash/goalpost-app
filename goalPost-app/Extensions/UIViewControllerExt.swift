//
//  UIViewControllerExt.swift
//  goalPost-app
//
//  Created by juger rash on 21.07.19.
//  Copyright © 2019 juger rash. All rights reserved.
//

import UIKit

//This Ext to make an animation for a viewController when present it.

extension UIViewController {
    
    func presentDetail(_ viewControllerToPresent : UIViewController){
        let transition = CATransition()
        transition.type = .push
        transition.duration = 0.3
        transition.subtype = .fromRight
        self.view.layer.add(transition, forKey: kCATransition)
        
        present(viewControllerToPresent, animated: false, completion: nil)//animated should be false because we already animated above the view
    }
    
    func presentSecondryDetail(_ viewControllerToPresent : UIViewController){
        let transition = CATransition()
        transition.type = .push
        transition.duration = 0.3
        transition.subtype = .fromRight
        
        guard let presenetedVC = presentedViewController else { return }
        
        presenetedVC.dismiss(animated: false) {
            self.view.layer.add(transition, forKey: kCATransition)
            self.present(viewControllerToPresent, animated: false, completion: nil)
        }
        
    }
    
    func dismissDetail(){
        let transition = CATransition()
        transition.type = .push
        transition.duration = 0.3
        transition.subtype = .fromLeft
        self.view.layer.add(transition, forKey: kCATransition)
        
        dismiss(animated: false, completion: nil)
    }
    
    
}
