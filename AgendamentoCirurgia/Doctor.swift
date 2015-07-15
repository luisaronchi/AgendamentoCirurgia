//
//  Doctor.swift
//  AgendamentoCirurgia
//
//  Created by Carol Grädel on 7/13/15.
//  Copyright (c) 2015 BEPiD. All rights reserved.
//

import Foundation

class Doctor {
    
    var fullName: String
    var crm: Int
    var cpf: Int
    var speaciality: String
    var email: String
    var officeTelephone: Int
    var emergencyTelephone: Int
    

    init (fullName: String, crm: Int, cpf:Int, speaciality: String, email: String, officeTelephone: Int, emergencyTelephone: Int) {
        
        self.fullName = fullName
        self.crm = crm
        self.cpf = cpf
        self.speaciality = speaciality
        self.email = email
        self.officeTelephone = officeTelephone
        self.emergencyTelephone = emergencyTelephone
    }
}


