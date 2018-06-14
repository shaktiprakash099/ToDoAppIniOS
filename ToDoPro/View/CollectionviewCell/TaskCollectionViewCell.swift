//
//  TaskCollectionViewCell.swift
//  ToDoPro
//
//  Created by GLB-312-PC on 11/06/18.
//  Copyright © 2018 IOSISFUN. All rights reserved.
//

import UIKit

class TaskCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var taskCategoryImageView: Customimageview!
    @IBOutlet weak var taskCategoryName: UILabel!
    @IBOutlet weak var taskCompletionprogressView: UIProgressView!
    
    @IBOutlet weak var taskcompletionDetailsLabel: UILabel!
    @IBOutlet weak var noofTasksLabel: UILabel!
    override func awakeFromNib() {
        setupContentView()
    }
    
    func setupContentView(){
        self.layer.shadowColor = UIColor.darkGray.cgColor
        self.layer.shadowOpacity = 0.8
        self.layer.shadowOffset = CGSize(width: -1, height: 3)
        self.layer.shadowRadius = 2
        

    }
    
    func setupsTaskDetails(category: TaskCategory){
        
        
        self.taskCategoryImageView.image = UIImage(named: category.categoryTitle ?? "Personal")
        self.taskCategoryName.text = category.categoryTitle
        self.noofTasksLabel.text = "\( category.taskdetails?.count ?? 0 ) Tasks"
    
        var  completedtaskvalue:Float = 0.0
        if  category.taskdetails?.count == 0 {
              completedtaskvalue = 0
        }
        else{
              let completedArray = category.taskdetails?.filter({!$0.status==false})
            completedtaskvalue =  Float(Float((completedArray?.count)!) / Float(category.taskdetails?.count  ?? 0))
        }
       
        self.taskCompletionprogressView.progress = Float(completedtaskvalue)
        self.taskcompletionDetailsLabel.text = "\(completedtaskvalue * 100) % "
    }
}
