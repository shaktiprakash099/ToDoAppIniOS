//
//  CustomImageview.swift
//  ToDoPro
//
//  Created by GLB-312-PC on 09/06/18.
//  Copyright © 2018 IOSISFUN. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable class Customimageview: UIImageView{
    
    @IBInspectable var borderWidth: CGFloat = 0.0 {
        didSet{
            updateUI()
        }
        
    }
    @IBInspectable var borderColor : UIColor  =  UIColor.clear {
        didSet{
            updateUI()
        }
        
    }
    
    @IBInspectable var cornerRadius : CGFloat = 0.0 {
        
        didSet{
            updateUI()
        }
    }
    
    func updateUI(){
        self.layer.cornerRadius = cornerRadius
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
      
    }
}
