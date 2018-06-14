//
//  TaskCategory+CoreDataClass.swift
//  ToDoPro
//
//  Created by GLB-312-PC on 11/06/18.
//  Copyright © 2018 IOSISFUN. All rights reserved.
//
//

import UIKit
import CoreData

@objc(TaskCategory)
public class TaskCategory: NSManagedObject {
    var taskdetails :[Tasks]? {
        return self.taskDetails?.array as? [Tasks]
    }

    convenience init?(categoryTitlename : String? ) {
        let appdelegate = UIApplication.shared.delegate as? AppDelegate
        
        guard let context = appdelegate?.persistentContainer.viewContext else {
            return nil
        }
        self.init(entity: TaskCategory.entity(), insertInto: context)
        self.categoryTitle = categoryTitlename
        
        
        
        
        
        
    }
}
