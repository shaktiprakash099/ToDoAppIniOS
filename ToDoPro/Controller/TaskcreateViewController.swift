//
//  TaskcreateViewController.swift
//  ToDoPro
//
//  Created by GLB-312-PC on 13/06/18.
//  Copyright © 2018 IOSISFUN. All rights reserved.
//

import UIKit

class TaskcreateViewController: UIViewController {

    @IBOutlet weak var taskcreatetextfield: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
  

        NotificationCenter.default.addObserver(self, selector: #selector(TaskcreateViewController.keyboardWillShow(_:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)

    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
         self.taskcreatetextfield.text  = ""
        taskcreatetextfield.becomeFirstResponder()
        print("child controller is being called")
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
   
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func closebuttonAction(_ sender: Any) {
        self.willMove(toParentViewController: nil)
        self.removeFromParentViewController()
        self.view.removeFromSuperview()
        NotificationCenter.default.post(name: .removechildcontroller, object: nil)
        
    }
    
    deinit {
        print("I am being deinitialized")
    }
    
    
    
    @objc func keyboardWillShow(_ notification: Notification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            print(keyboardHeight)
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
