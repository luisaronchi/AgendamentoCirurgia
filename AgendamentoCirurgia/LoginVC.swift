//
//  LoginVC.swift
//  AgendamentoCirurgia
//
//  Created by Jenifer Emmanuel on 15/07/15.
//  Copyright (c) 2015 BEPiD. All rights reserved.
//

import UIKit
import Parse
import Bolts

class LoginVC: UIViewController
{

    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!

    @IBOutlet weak var choiceSegment: UISegmentedControl!
    
    @IBAction func loginButton(sender: UIButton) {
    }
    
    @IBAction func singInButton(sender: UIButton) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let doctor = PFObject(className: "Doctor")
        
        doctor["FullName"] = "Gustavo Severo"
        doctor["CRM"] = 123456
        doctor["CPF"] = 1234
        doctor["Speciality"] = "Neurologista"
        doctor["Email"] = "gustavosevero@gmail.com"
        doctor["OfficeTelephone"] = 22344565
        doctor["EmergencyTelephone"] = 22345469

        doctor.saveInBackgroundWithBlock {(sucess:Bool, error: NSError?) -> Void in
            print("foi")
        }

        let request = PFObject(className: "Request")
        let str = "Working at Parse is great!"
        let data = str.dataUsingEncoding(NSUTF8StringEncoding)
        let file = PFFile(name: "texto.txt", data:data!)
        let date = NSDate()

        request["PatientFullName"] = "Carol Gradel"
        request["Insurance"] = "Sulamerica"
        request["DoctorName"] = "Gustavo Severo"
        request["DoctorTelephone"] = doctor
        request["SurgeryType"] = "Retirada de Tumor"
        request["RequiredMaterial"] = "4 coisos"
        request["AdditionalInformation"] = "fdgdd"
        request["DoctorApplication"] = file
        request["PatientBirth"] = date
        request["SurgeryDate"] = date
        request["Gender"] = true
        
        request.saveInBackgroundWithBlock {(sucess:Bool, error:NSError?) -> Void in
            print("salvourequest")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}
