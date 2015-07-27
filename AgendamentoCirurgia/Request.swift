//
//  Request.swift
//  AgendamentoCirurgia
//
//  Created by Carol Grädel on 7/13/15.
//  Copyright (c) 2015 BEPiD. All rights reserved.
//

import Foundation

class Request {
    
    var patientFullName: String
    var insurance: String
    var doctorName: String
    var doctorTelephone: Int
    var nameSecretary: String
    var surgeryType: String
//    var doctorApplication: String
    var patientBirth: String
    var surgeryDate: String
    var gender: String
    var email: String
    
    
    
    init (patientFullName: String, insurance: String, doctorName: String, doctorTelephone: Int, nameSecretary: String, surgeryType: String, patientBirth: String,  surgeryDate: String, gender: String, email: String) {
        
        self.patientFullName = patientFullName
        self.insurance = insurance
        self.doctorName = doctorName
        self.doctorTelephone = doctorTelephone
        self.nameSecretary = nameSecretary
        self.surgeryDate = surgeryDate
        self.surgeryType = surgeryType
//        self.doctorApplication = doctorApplication
        self.patientBirth = patientBirth
        self.surgeryType = surgeryType
        self.gender = gender
        self.email = email
    }
}
