//
//  UIButtonExt.swift
//  goalPost-app
//
//  Created by juger rash on 22.07.19.
//  Copyright © 2019 juger rash. All rights reserved.
//

import UIKit

extension UIButton {
    func setSelectedButton(){
        self.backgroundColor = #colorLiteral(red: 0.9981140494, green: 0.7813922763, blue: 0.4615272284, alpha: 1)
    }
    
    func setDeselectedButton(){
         self.backgroundColor = #colorLiteral(red: 0.6980392157, green: 0.8666666667, blue: 0.6862745098, alpha: 1)
    }
}
