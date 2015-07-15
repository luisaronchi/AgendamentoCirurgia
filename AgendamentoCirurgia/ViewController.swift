//
//  ViewController.swift
//  AgendamentoCirurgia
//
//  Created by Luisa Carvalho de Mendonça Ronchi on 13/07/15.
//  Copyright (c) 2015 BEPiD. All rights reserved.
//

import UIKit
import Parse
import Bolts

class ViewController: UIViewController
{

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let Doctor = PFObject(className: "Doctor")
        
        Doctor["FullName"] = "Gustavo Severo"
        Doctor["CRM"] = 123456
        Doctor["CPF"] = 1234
        Doctor["Speciality"] = "Neurologista"
        Doctor["Email"] = "gustavosevero@gmail.com"
        Doctor["OfficeTelephone"] = 22344565
        Doctor["EmergencyTelephone"] = 22345469
        
        Doctor.saveInBackgroundWithBlock {(sucess:Bool, error: NSError?) -> Void in
            print("foi")
        }
        
    }

     override func didReceiveMemoryWarning()
     {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

