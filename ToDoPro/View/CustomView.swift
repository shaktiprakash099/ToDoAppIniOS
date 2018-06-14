//
//  CustomView.swift
//  ToDoPro
//
//  Created by GLB-312-PC on 11/06/18.
//  Copyright © 2018 IOSISFUN. All rights reserved.
//

import Foundation
import  UIKit
@IBDesignable class CustomView : UIView{
    @IBInspectable var cornerRadius : CGFloat = 0.0 {
        
        didSet{
            updateUI()
        }
    }
    
    func updateUI(){
        self.layer.cornerRadius = cornerRadius
        
    }
    
}
