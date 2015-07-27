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
    
    @IBOutlet weak var speciality: UITextField!
    
    @IBOutlet weak var nameSecretaryField: UITextField!
    
    @IBAction func signUpAction(sender: UIButton) {
        if (nameField.text.isEmpty  || crmField.text.isEmpty || emailField.text.isEmpty || passwordField.text.isEmpty || phoneField.text.isEmpty || nameSecretaryField.text.isEmpty) {
        
        var alertView:UIAlertView = UIAlertView()
        alertView.title = "Erro"
        alertView.message = "Preencha todos os campos"
        alertView.delegate = self
        alertView.addButtonWithTitle("Ok")
        alertView.show()
        
    } else {

        DoctorDAO.addUser(self.nameField.text , password: self.passwordField.text , email: self.emailField.text,crm: self.crmField.text.toInt()!, phone: self.phoneField.text.toInt()!, speciality: self.speciality.text, emergPhone: self.emergencyPhoneField.text.toInt()!, nameSecretary: self.nameSecretaryField.text, callback : { (error : Bool, desc : String) in
            
            var alertView:UIAlertView = UIAlertView()
            
            if (error){
                alertView.title = "Não foi possível completar o cadastro"
                alertView.message = desc
                alertView.delegate = self
                alertView.addButtonWithTitle("Ok")
                
                alertView.show()
                
            } else {
                alertView.title = "Cadastro Completo"
                alertView.message = "Faça o login"
                alertView.delegate = self
                alertView.addButtonWithTitle("Ok")
                
                alertView.show()

                let vc = LoginVC(nibName: "LoginVC", bundle: nil)
                self.navigationController?.pushViewController(vc, animated: true)
                
            }
            
            
        })
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Cadastro"

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
}
