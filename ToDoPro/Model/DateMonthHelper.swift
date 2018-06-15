//
//  DateMonthHelper.swift
//  ToDoPro
//
//  Created by GLB-312-PC on 09/06/18.
//  Copyright © 2018 IOSISFUN. All rights reserved.
//

import Foundation




class  DateMonthHelper {
    
   func getcurrentdateString()-> String{
         let date = Date()
         let dateformatter = DateFormatter()
          dateformatter.dateFormat = "MMM d, yyyy"
          dateformatter.string(from: date)
         return "TODAY :\(dateformatter.string(from: date))"
    }
}
