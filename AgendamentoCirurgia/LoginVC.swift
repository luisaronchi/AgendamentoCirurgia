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

class LoginVC: UIViewController, UITextFieldDelegate {
    
    var doctorModel: Doctor!

    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!

    @IBOutlet weak var choiceSegment: UISegmentedControl!
    
    @IBAction func loginButton(sender: UIButton) {
        
        DoctorDAO.getUser(comEmail: self.emailField.text, callback: { user in
            
            if (user != nil) {
                
                println("user nao é nil")
                
                if (user!.isPasswordOK(self.passwordField.text)) {
                    
                    DoctorDAO.setCurrentUser(self.emailField.text, password: self.passwordField.text)
                    
                    emailUser = self.emailField.text
                    
                    
//                    var controller: FeedVC = FeedVC(nibName:"FeedVC", bundle:NSBundle.mainBundle())
//                    self.presentViewController(controller, animated: true, completion: nil)
                    
                    let vc = FeedVC(nibName: "FeedVC", bundle: nil)
                    self.navigationController?.pushViewController(vc, animated: true)
                    
                } else {
                    var alertView:UIAlertView = UIAlertView()
                    alertView.title = "Erro"
                    alertView.message = "Verifique seu email ou senha"
                    alertView.delegate = self
                    alertView.addButtonWithTitle("Ok")
                    
                    alertView.show()
                }
                
            } else {
                
                println("user é nil")
                
                var alertView:UIAlertView = UIAlertView()
                alertView.title = "Erro"
                alertView.message = "Verifique seu email ou senha"
                alertView.delegate = self
                alertView.addButtonWithTitle("Ok")
                
                alertView.show()
            }
            
            
            
        })
        
        
    }
    
    @IBAction func singInButton(sender: UIButton)
    {
        let vc = RegisterVC(nibName: "RegisterVC", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    

    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        //logout provisório
        let backItem = UIBarButtonItem(title: "Logout", style: .Plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backItem
        
        
    }
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBarHidden = true
        
        emailField.text = ""
        passwordField.text = ""
        
    }

    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.navigationController?.navigationBarHidden = false
        
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }


}
