//
//  BackgroundContaninerView.swift
//  ToDoPro
//
//  Created by GLB-312-PC on 09/06/18.
//  Copyright © 2018 IOSISFUN. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable class BackgroundContainerView: UIView{
    
  
    
    @IBInspectable var shadowColor : UIColor = UIColor.clear {
        
        didSet{
            updateUI()
        }
        
    }
    
    
    func updateUI(){
   
        self.layer.shadowColor = shadowColor.cgColor
        self.layer.shadowOpacity = 1
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowRadius = 5
      
    }
}
