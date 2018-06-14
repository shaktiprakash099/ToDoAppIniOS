//
//  TaskdetailsViewController.swift
//  ToDoPro
//
//  Created by GLB-312-PC on 12/06/18.
//  Copyright © 2018 IOSISFUN. All rights reserved.
//

import UIKit

class TaskdetailsViewController: UIViewController {

    
    @IBOutlet weak var addTaskbuttom: CustomButtom!
    @IBOutlet weak var buttonwidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var taskTableView: UITableView!
    @IBOutlet weak var categoryImageview: UIImageView!
    @IBOutlet weak var noofTaskLabel: UILabel!
    @IBOutlet weak var taskcategorytitlelabel: UILabel!
    @IBOutlet weak var taskcompletionpercentageLabel: UILabel!
    @IBOutlet weak var taskCompletionProgressViwe: UIProgressView!
    @IBOutlet weak var buttonBottomconstraint: NSLayoutConstraint!
    
    @IBOutlet weak var buttontrailingConstraint: NSLayoutConstraint!
    lazy var taskcreatecontroller : TaskcreateViewController = {
        let viewcontroller = self.storyboard?.instantiateViewController(withIdentifier: "TaskcreateViewController") as! TaskcreateViewController
        self.addViewControllerAsChildviewcontroller(childviewController: viewcontroller)
        return viewcontroller
    }()
    
    var  keyboardHeight : Float?
    var bottonHeightConstraintwrtkeyboard: Float?
    var taskCategory: TaskCategory?
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
        NotificationCenter.default.addObserver(self, selector: #selector(removeChildController(notification:)), name: .removechildcontroller, object: nil)
        print(UIScreen.main.nativeBounds.height)
        keyboardHeight = KeyboardHeightManager.instance.getcurrentKeyboardHeight()
        if UIScreen.main.nativeBounds.height == 2436{
          bottonHeightConstraintwrtkeyboard  = keyboardHeight! - 35
        }
        else{
            bottonHeightConstraintwrtkeyboard  = keyboardHeight!
        }
        self.setupsTaskDetails(category: taskCategory!)
        
    }

  
    

    
    //MARK: Remove childcontroller Notifiaction
    
    @objc func removeChildController(notification: Notification){
        self.removeViewcontrollerAsChildController(childviewcontroller: self.taskcreatecontroller)
        self.animatebuttonwidth(width: 40, trailingWidth: 30, bottomWidth: 50)
    }
    private func addViewControllerAsChildviewcontroller(childviewController:UIViewController){
        addChildViewController(childviewController)
        view.addSubview(childviewController.view)
        childviewController.view.frame =  CGRect(x: view.bounds.origin.x, y: view.bounds.origin.y, width: view.bounds.width , height: (view.bounds.height -  CGFloat(keyboardHeight! + 40)))
        childviewController.didMove(toParentViewController: self)
        
    }
    
    private func removeViewcontrollerAsChildController(childviewcontroller: UIViewController){
        childviewcontroller.willMove(toParentViewController: nil)
        childviewcontroller.view.removeFromSuperview()
        childviewcontroller.removeFromParentViewController()
    }
    
    func setupsTaskDetails(category: TaskCategory){
        
        self.categoryImageview.image = UIImage(named: category.categoryTitle ?? "Personal")
        self.taskcategorytitlelabel.text = category.categoryTitle
        self.noofTaskLabel.text = "\( category.taskdetails?.count ?? 0 ) Tasks"
        
        var  completedtaskvalue:Float = 0
        if  category.taskdetails?.count == 0 {
            completedtaskvalue = 0
        }
        else{
            let completedArray = category.taskdetails?.filter({!$0.status==false})
            completedtaskvalue = Float((completedArray?.count)!) / Float(category.taskdetails?.count  ?? 0)
        }

        self.taskCompletionProgressViwe.progress = Float(completedtaskvalue)
        self.taskcompletionpercentageLabel.text = "\(completedtaskvalue * 100) % "
    }
    
    @IBAction func addTaskAction(_ sender: Any) {
    
        if self.buttonwidthConstraint.constant == 40 {
            self.taskTableView.isHidden = true
            
        self.addViewControllerAsChildviewcontroller(childviewController: self.taskcreatecontroller)
            self.animatebuttonwidth(width: UIScreen.main.bounds.size.width+30, trailingWidth: -15, bottomWidth:   CGFloat(bottonHeightConstraintwrtkeyboard!))
        }
        else{
             self.taskTableView.isHidden = false
            if let taskstring = self.taskcreatecontroller.taskcreatetextfield.text,!taskstring.isEmpty{
                self.addTask(taskstring: taskstring)
            }
            self.removeViewcontrollerAsChildController(childviewcontroller: self.taskcreatecontroller)
            self.animatebuttonwidth(width: 40, trailingWidth: 30, bottomWidth: 50)
         
        }
        
    }
    
    func addTask(taskstring:String){
        if let task = Tasks(taskID: UUID.init().uuidString, taskname: taskstring, status: false) {
            taskCategory?.addToTaskDetails(task)
            do {
               try  task.managedObjectContext?.save()
                self.setupsTaskDetails(category: taskCategory!)
                self.taskTableView.reloadData()
            } catch {
                print("Expences cound be created ")
            }
        }
        
       
    }
    
    //MARK: add task button Naimation
    func animatebuttonwidth(width: CGFloat,trailingWidth :CGFloat,bottomWidth:CGFloat){
        
        UIView.animate(withDuration: 0.5, animations: {
            self.buttonwidthConstraint.constant = width
           self.buttonBottomconstraint.constant = bottomWidth
            self.buttontrailingConstraint.constant = trailingWidth
            self.view.layoutIfNeeded()
            
        }) { (completed ) in
            
        }
    }

    @IBAction func backAction(_ sender: Any) {
        self.taskTableView.isHidden = true
        self.addTaskbuttom.isHidden = true
        presentingViewController?.dismiss(animated: true, completion: {
        })
    }
    
}
extension TaskdetailsViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskCategory?.taskdetails?.count ?? 0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let  cell = tableView.dequeueReusableCell(withIdentifier: "TasksTableViewCell", for: indexPath) as! TasksTableViewCell
        cell.taskNamelabel.text = "\(taskCategory?.taskdetails?[indexPath.row].taskName ?? "")"
    
        cell.taskdeleteButton.tag = indexPath.row
        if taskCategory?.taskdetails?[indexPath.row].status == true{
            cell.checkUncheckButtom.isSelected = false
            cell.taskNamelabel.attributedString(stringtobechanged: cell.taskNamelabel.text!)
            cell.taskdeleteButton.isHidden = false
        }
        else{
            cell.checkUncheckButtom.isSelected = true
            cell.taskdeleteButton.isHidden = true
        }
        cell.checkUncheckButtom.tag = indexPath.row
        cell.checkUncheckButtom.addTarget(self, action: #selector(updatetasksstatus(sender:)), for: .touchUpInside)
        cell.taskdeleteButton.addTarget(self, action: #selector(deleteTaskdetailsAction(sender:)), for:.touchUpInside)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45.0
    }
    @objc func updatetasksstatus(sender : UIButton){
        
        guard let tasktobeupdated = taskCategory?.taskdetails?[sender.tag],let managedContext =  tasktobeupdated.managedObjectContext else{
            return
        }
        tasktobeupdated.status = true
       
        do {
            try  managedContext.save()
            self.taskTableView.reloadData()
            self.setupsTaskDetails(category: taskCategory!)
        } catch{
            print("Something went wrong")
        }
        
    }
    @objc func deleteTaskdetailsAction(sender: UIButton){
        
        
        guard let tasktobedeleted = taskCategory?.taskdetails?[sender.tag],let managedContext =  tasktobedeleted.managedObjectContext else{
          return
        }
        managedContext.delete(tasktobedeleted)
        do {
            try  managedContext.save()
            self.taskTableView.reloadData()
           self.setupsTaskDetails(category: taskCategory!)
        } catch{
            print("Something went wrong")
        }
    }
    
}
