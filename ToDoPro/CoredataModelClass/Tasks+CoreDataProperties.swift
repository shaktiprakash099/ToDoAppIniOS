//
//  Tasks+CoreDataProperties.swift
//  ToDoPro
//
//  Created by GLB-312-PC on 12/06/18.
//  Copyright © 2018 IOSISFUN. All rights reserved.
//
//

import Foundation
import CoreData


extension Tasks {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Tasks> {
        return NSFetchRequest<Tasks>(entityName: "Tasks")
    }

    @NSManaged public var taskId: String?
    @NSManaged public var taskName: String?
    @NSManaged public var status: Bool
    @NSManaged public var taskCategory: TaskCategory?

}
