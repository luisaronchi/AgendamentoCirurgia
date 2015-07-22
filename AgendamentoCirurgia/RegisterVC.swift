//
//  RegisterVC.swift
//  AgendamentoCirurgia
//
//  Created by Jenifer Emmanuel on 15/07/15.
//  Copyright (c) 2015 BEPiD. All rights reserved.
//

import UIKit

class RegisterVC: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var crmField: UITextField!
    
    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var phoneField: UITextField!
    
    @IBOutlet weak var emergencyPhoneField: UITextField!
    
    @IBAction func signUpAction(sender: UIButton) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //navigationbar setup
         self.navigationItem.title = "Cadastro"

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }


}
