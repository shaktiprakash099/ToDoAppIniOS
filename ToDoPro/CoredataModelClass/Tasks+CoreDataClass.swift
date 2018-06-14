//
//  Tasks+CoreDataClass.swift
//  ToDoPro
//
//  Created by GLB-312-PC on 11/06/18.
//  Copyright © 2018 IOSISFUN. All rights reserved.
//
//

import UIKit
import CoreData

@objc(Tasks)
public class Tasks: NSManagedObject {
    
    convenience init?(taskID:String?,taskname:String?,status: Bool?) {
        let appdelegate = UIApplication.shared.delegate as? AppDelegate
        
        guard let context = appdelegate?.persistentContainer.viewContext else{
            return nil
        }
        
        self.init(entity: Tasks.entity(), insertInto: context)
        self.taskId = taskID
        self.taskName = taskname
        self.status = status!

    }
}
