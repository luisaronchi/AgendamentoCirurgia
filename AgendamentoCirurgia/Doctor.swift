//
//  Doctor.swift
//  AgendamentoCirurgia
//
//  Created by Carol Grädel on 7/13/15.
//  Copyright (c) 2015 BEPiD. All rights reserved.
//

import UIKit
import CryptoSwift

class Doctor {
    
    var fullName: String!
    var crm: Int!
    var cpf: Int!
    var speaciality: String!
    var email: String!
    var officeTelephone: Int!
    var emergencyTelephone: Int!
    var password: String!
    
    init (fullname: String, crm: Int, cpf: Int, speciality: String, email: String,officeTelephone: Int, emergencyTelephone: Int, password: String ) {
        
        self.fullName = fullname
        self.crm = crm
        self.cpf = cpf
        self.speaciality = speciality
        self.email = email
        self.officeTelephone = officeTelephone
        self.emergencyTelephone = emergencyTelephone
        self.password = password
        
    }
    
    var description : String {
        get {
            if (email != nil) {
                return "\(self.email!.lowercaseString) \n"
            } else {
                return "*** undefined email *** "
            }
            }
        }
    
    func isPasswordOK(password: String) -> Bool {
        
        if (self.password != nil) {
            
            println(self.password!.md5())
            println(password.md5())
            
            if self.password!.md5() == password.md5() {
                
            return true
                
            } else {
                return false
            }
            
        } else {
            return false
        }
    
    }
    


}




