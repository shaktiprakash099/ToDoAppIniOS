//
//  GradientView.swift
//  SocioboardNew
//
//  Created by GLB-311-PC on 21/07/17.
//  Copyright © 2017 Globussoft. All rights reserved.
//

import UIKit

@IBDesignable
class GradientView: UIView {

    @IBInspectable var FirstColor: UIColor = UIColor.clear {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var SecondColor: UIColor = UIColor.clear {
        didSet {
            updateView()
        }
    }
    
    override class var layerClass: AnyClass {
        get {
            return CAGradientLayer.self
        }
    }
    
    func updateView() -> Void {
        
        let layer = self.layer as! CAGradientLayer
        layer.colors = [FirstColor.cgColor, SecondColor.cgColor]
    }
    func updatebackgroundcolor(indexno:Int){
        switch indexno {
        case 0:
            self.FirstColor = #colorLiteral(red: 0.9568627451, green: 0.6745098039, blue: 0.4274509804, alpha: 1)
            self.SecondColor = #colorLiteral(red: 0.9568627451, green: 0.4745098039, blue: 0.4862745098, alpha: 1)
        case 1:
            self.FirstColor = #colorLiteral(red: 0.3960784314, green: 0.6470588235, blue: 0.8117647059, alpha: 1)
            self.SecondColor = #colorLiteral(red: 0.368627451, green: 0.4549019608, blue: 0.8745098039, alpha: 1)
        case 2:
            self.FirstColor = #colorLiteral(red: 0.7921568627, green: 0.6078431373, blue: 0.7254901961, alpha: 1)
            self.SecondColor = #colorLiteral(red: 0.9960784314, green: 0.8941176471, blue: 0.6509803922, alpha: 1)
            
            
        default:
            print("No change ")
        }
    }
    
}
