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
import Foundation

class LoginVC: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!

    @IBOutlet weak var choiceSegment: UISegmentedControl!
    
    @IBAction func loginButton(sender: UIButton){
        
        
        DoctorDAO.getUser(comEmail: self.emailField.text, callback: { user in
            
            if (user != nil) {
                
                println(self.passwordField.text)
                
                if (user!.isPasswordOK(self.passwordField.text)) {
                    
                    DoctorDAO.setCurrentUser(self.emailField.text, password: self.passwordField.text)
                    
                    var controller: FeedVC = FeedVC(nibName:"FeedVC", bundle:NSBundle.mainBundle())
                    self.presentViewController(controller, animated: true, completion: nil)

                    
                    
                } else {
                    var alertView:UIAlertView = UIAlertView()
                    alertView.title = "Ops!"
                    alertView.message = "Please, check your password"
                    alertView.delegate = self
                    alertView.addButtonWithTitle("Ok")
                    
                    alertView.show()
                }
                
            } else {
                var alertView:UIAlertView = UIAlertView()
                alertView.title = "Ops!"
                alertView.message = "Check your user or password"
                alertView.delegate = self
                alertView.addButtonWithTitle("Ok")
                
                alertView.show()
            }
            
            
            
            
        })


    }


    
    @IBAction func singInButton(sender: UIButton)
    {
        
    }

    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
//        doctorModel = Doctor(fullname: "Carolina Mandia", crm: 321362, cpf: 666666, speciality: "Neurologista", email: "carolbolada@outlook.com", officeTelephone: 123123212, emergencyTelephone: 23123231, password: "BLABLA878788776")
        
    

        
//        //um usuario pro teste
//        doctorModel.fullName = "Carolina Mandia"
//        doctorModel.crm = 321362
//        doctorModel.cpf = 666666
//        doctorModel.speaciality = "Neurologista"
//        doctorModel.email = "carolbolada@outlook.com"
//        doctorModel.officeTelephone = 23123231
//        doctorModel.emergencyTelephone =  921212121
//        doctorModel.password = "BLABLA878788776"
//    
//        
//        isDataAvailable(doctorModel)
        

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
