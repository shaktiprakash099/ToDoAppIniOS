//
//  Extensions.swift
//  ToDoPro
//
//  Created by GLB-312-PC on 14/06/18.
//  Copyright © 2018 IOSISFUN. All rights reserved.
//

import Foundation
import  UIKit
extension Notification.Name {
    static let removechildcontroller = Notification.Name("removechildcontroller")
}

extension UILabel {
    func attributedString(stringtobechanged:String){
        let attributedString = NSMutableAttributedString(string: stringtobechanged)
        attributedString.addAttribute(NSAttributedStringKey.strikethroughStyle, value: 1, range: NSMakeRange(0, attributedString.length))
    self.attributedText = attributedString
    }
}

