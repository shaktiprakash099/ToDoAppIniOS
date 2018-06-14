//
//  TasksTableViewCell.swift
//  ToDoPro
//
//  Created by GLB-312-PC on 12/06/18.
//  Copyright © 2018 IOSISFUN. All rights reserved.
//

import UIKit

class TasksTableViewCell: UITableViewCell {

    @IBOutlet weak var taskdeleteButton: UIButton!
    
    @IBOutlet weak var checkUncheckButtom: UIButton!
    @IBOutlet weak var taskNamelabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
