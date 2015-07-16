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

class LoginVC: UIViewController {
    
    var doctorModel: Doctor!

    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!

    @IBOutlet weak var choiceSegment: UISegmentedControl!
    
    @IBAction func loginButton(sender: UIButton)
    {

    }
    
    @IBAction func singInButton(sender: UIButton)
    {
        
    }
    //func esse espaco já tem preenchido?
    
    func isDataAvailable (doctor: Doctor)
    {
        //que espacos seram verificados? - cpf e crm em doctor!
        
        var query = PFQuery(className: "Doctor")
        query.whereKey("CRM", equalTo: doctor.crm)
        query.whereKey("CPF", equalTo: doctor.cpf)
        
        //em findobjectsinbackgroundwithblock, verificar antes de salvar se o pedido pode ser enviado!
        query.findObjectsInBackgroundWithBlock { (vector: [AnyObject]?, error: NSError?) -> Void in
            
            //condicional
            if (vector?.count > 0)
            {
                println("User already exists.")
            } else {
                //vou criar um UIAlert
                println("User created.")
                self.testeDoctor()
            }
            
            
        }
    }
    
    func testeDoctor() {
        
        let doctor = PFObject(className: "Doctor")
        
        doctor["FullName"] = doctorModel.fullName
        doctor["CRM"] = doctorModel.crm
        doctor["CPF"] = doctorModel.cpf
        doctor["Speciality"] = doctorModel.speaciality
        doctor["Email"] = doctorModel.email
        doctor["OfficeTelephone"] = doctorModel.officeTelephone
        doctor["EmergencyTelephone"] = doctorModel.emergencyTelephone
        
        doctor.saveInBackgroundWithBlock {(sucess:Bool, error: NSError?) -> Void in
            print("Block Saved")
        }
    }
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        doctorModel = Doctor()
        //um usuario pro teste
        doctorModel.fullName = "Carolina Mandia"
        doctorModel.crm = 321312
        doctorModel.cpf = 666666
        doctorModel.speaciality = "Neurologista"
        doctorModel.email = "carolbolada@outlook.com"
        doctorModel.officeTelephone = 23123231
        doctorModel.emergencyTelephone =  921212121
    
        
        isDataAvailable(doctorModel)
        

//        let request = PFObject(className: "Request")
//        let str = "Working at Parse is great!"
//        let data = str.dataUsingEncoding(NSUTF8StringEncoding)
//        let file = PFFile(name: "texto.txt", data:data!)
//        let date = NSDate()
//
//        request["PatientFullName"] = "Carol Gradel"
//        request["Insurance"] = "Sulamerica"
//        request["DoctorName"] = "Gustavo Severo"
//        request["DoctorTelephone"] = doctor
//        request["SurgeryType"] = "Retirada de Tumor"
//        request["RequiredMaterial"] = "4 coisos"
//        request["AdditionalInformation"] = "fdgdd"
//        request["DoctorApplication"] = file
//        request["PatientBirth"] = date
//        request["SurgeryDate"] = date
//        request["Gender"] = true
//        
//        request.saveInBackgroundWithBlock {(sucess:Bool, error:NSError?) -> Void in
//            print("salvourequest")
//        }
        
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }


}
