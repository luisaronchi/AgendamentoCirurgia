//
//  RequestSumaryVC.swift
//  AgendamentoCirurgia
//
//  Created by Alena Miklos on 15/07/15.
//  Copyright (c) 2015 BEPiD. All rights reserved.
//

import UIKit

class RequestSumaryVC: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!

    @IBOutlet weak var birthLabel: UILabel!

    @IBOutlet weak var insuranceLabel: UILabel!
    
    @IBOutlet weak var nameDoctorLabel: UILabel!
    
    @IBOutlet weak var phoneLabel: UILabel!
    
    @IBOutlet weak var typeSurgeryLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var materialLabel: UILabel!
    
    @IBOutlet weak var observationLabel: UILabel!
    
    @IBAction func backButton(sender: AnyObject) {
        
       //segue pro navigation (Feed)
        
    }
    
    @IBAction func editButton(sender: AnyObject) {
        
        //mudar para "edit mode" (setEditing)
        // func editButtonItem() -> UIBarButtomItem
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

}
