//
//  TaskCategory+CoreDataProperties.swift
//  ToDoPro
//
//  Created by GLB-312-PC on 12/06/18.
//  Copyright © 2018 IOSISFUN. All rights reserved.
//
//

import Foundation
import CoreData


extension TaskCategory {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TaskCategory> {
        return NSFetchRequest<TaskCategory>(entityName: "TaskCategory")
    }

    @NSManaged public var categoryTitle: String?
    @NSManaged public var taskDetails: NSOrderedSet?

}

// MARK: Generated accessors for taskDetails
extension TaskCategory {

    @objc(insertObject:inTaskDetailsAtIndex:)
    @NSManaged public func insertIntoTaskDetails(_ value: Tasks, at idx: Int)

    @objc(removeObjectFromTaskDetailsAtIndex:)
    @NSManaged public func removeFromTaskDetails(at idx: Int)

    @objc(insertTaskDetails:atIndexes:)
    @NSManaged public func insertIntoTaskDetails(_ values: [Tasks], at indexes: NSIndexSet)

    @objc(removeTaskDetailsAtIndexes:)
    @NSManaged public func removeFromTaskDetails(at indexes: NSIndexSet)

    @objc(replaceObjectInTaskDetailsAtIndex:withObject:)
    @NSManaged public func replaceTaskDetails(at idx: Int, with value: Tasks)

    @objc(replaceTaskDetailsAtIndexes:withTaskDetails:)
    @NSManaged public func replaceTaskDetails(at indexes: NSIndexSet, with values: [Tasks])

    @objc(addTaskDetailsObject:)
    @NSManaged public func addToTaskDetails(_ value: Tasks)

    @objc(removeTaskDetailsObject:)
    @NSManaged public func removeFromTaskDetails(_ value: Tasks)

    @objc(addTaskDetails:)
    @NSManaged public func addToTaskDetails(_ values: NSOrderedSet)

    @objc(removeTaskDetails:)
    @NSManaged public func removeFromTaskDetails(_ values: NSOrderedSet)

}
