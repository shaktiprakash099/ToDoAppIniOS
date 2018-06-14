//
//  KeyboardHeightManager.swift
//  ToDoPro
//
//  Created by GLB-312-PC on 13/06/18.
//  Copyright © 2018 IOSISFUN. All rights reserved.
//

import Foundation
import UIKit

class KeyboardHeightManager {
    static let instance = KeyboardHeightManager()
    
    func getcurrentKeyboardHeight()->Float {
        
        if UIDevice().userInterfaceIdiom == .phone {
            switch UIScreen.main.nativeBounds.height {
            case 1136:
                print("iPhone 5 or 5S or 5C")
                return 216
            case 1334:
                print("iPhone 6/6S/7/8")
                return 216
            case 1920, 2208:
                print("iPhone 6+/6S+/7+/8+")
                return 226
            case 2436:
                print("iPhone X")
                return 291
            default:
                print("unknown")
                return 216
            }
        }
        else{
            return 0
        }
        
    }
    
}
