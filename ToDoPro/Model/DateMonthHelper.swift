//
//  DateMonthHelper.swift
//  ToDoPro
//
//  Created by GLB-312-PC on 09/06/18.
//  Copyright © 2018 IOSISFUN. All rights reserved.
//

import Foundation


enum Month  {
    
    case JANUARY
    case FEBRUARY
    case MARCH
    case APRIL
    case MAY
    case JUNE
    case JULY
    case AUGUST
    case SEPTEMBER
    case OCTOBER
    case NOVEMBER
    case DECEMBER
}

class   DateMonthHelper {
    
    func getCurrentMonth(monthval: Int) -> String{
        switch monthval {
        case 1:
            return "\(Month.JANUARY)"
        case 2:
            return "\(Month.FEBRUARY)"
        case 3:
            return "\(Month.MARCH)"
        case 4:
            return "\(Month.APRIL)"
        case 5:
            return "\(Month.MAY)"
        case 6:
            return "\(Month.JUNE)"
        case 7:
            return "\(Month.JULY)"
        case 8:
            return "\(Month.AUGUST)"
        case 9:
            return "\(Month.SEPTEMBER)"
        case 10:
            return "\(Month.OCTOBER)"
        case 11:
            return "\(Month.NOVEMBER)"
        case 12:
            return "\(Month.DECEMBER)"
     
        default:
            return ""
        }
    }
    
    
    func currentdateString()-> String{
        let date = Date()
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month, .day], from: date)
        return "TODAY :\(self.getCurrentMonth(monthval: components.month!)) \(components.day!) \(components.year!)"
        
    }
 

}
