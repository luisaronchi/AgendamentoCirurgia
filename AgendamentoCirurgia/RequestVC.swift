//
//  RequestVC.swift
//  AgendamentoCirurgia
//
//  Created by Jenifer Emmanuel on 15/07/15.
//  Copyright (c) 2015 BEPiD. All rights reserved.
//

import UIKit

class RequestVC: UIViewController {
    
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var birthField: UITextField!

    @IBOutlet weak var insuranceField: UITextField!
    
    @IBOutlet weak var nameDoctorField: UITextField!
    
    @IBOutlet weak var phoneField: UITextField!

    @IBOutlet weak var surgeryTypeField: UITextField!
    
    @IBOutlet weak var surgeryDateField: UITextField!
    
    @IBOutlet weak var materialField: UITextField!
    
    @IBOutlet weak var observationField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}
