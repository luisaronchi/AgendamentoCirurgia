//
//  RegisterVC.swift
//  AgendamentoCirurgia
//
//  Created by Jenifer Emmanuel on 15/07/15.
//  Copyright (c) 2015 BEPiD. All rights reserved.
//

import UIKit

class RegisterVC: UIViewController
{

    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var crmField: UITextField!
    
    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var phoneField: UITextField!
    
    @IBOutlet weak var singinButton: UIButton!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
