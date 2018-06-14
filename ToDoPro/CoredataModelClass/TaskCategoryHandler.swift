//
//  TaskCategoryHandler.swift
//  ToDoPro
//
//  Created by GLB-312-PC on 11/06/18.
//  Copyright © 2018 IOSISFUN. All rights reserved.
//

import Foundation
import UIKit
import CoreData
class  TaskCategoryHandler {
    
    static let shared = TaskCategoryHandler()
    var taskcategories = [TaskCategory]()


    //MARK : ADDING Categorys inTi coreData
    func addTaskCategory(categoryname : String?)-> Bool{
        let taskcategory = TaskCategory(categoryTitlename: categoryname)
        
        do {
            try taskcategory?.managedObjectContext?.save()
            print("successfully saved")
            return true
        } catch{
            print("something went wrong while saving tha data ")
            return false
        }

    }
    
    
    //MARK: FETCH Task categories
   func fetchcategoryDetails()-> [TaskCategory]{
    
    
        let context  =  (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
            taskcategories = try context.fetch(TaskCategory.fetchRequest())
        } catch{
            print("Error occures while fetching all taskdetails  ")
        }
         return taskcategories
    }
    
    func performBatchinsertion() {
        
        let categoryDetails = ["Custom": 0, "Work": 0, "Personal": 0]
        for (categoryName, taskcount) in categoryDetails {
            
            print("\(categoryName)s have \(taskcount) non completed tasks ")
            _  =   self.addTaskCategory(categoryname: categoryName)
        }
    }
}
