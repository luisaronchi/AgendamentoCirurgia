//
//  Request.swift
//  AgendamentoCirurgia
//
//  Created by Carol Grädel on 7/13/15.
//  Copyright (c) 2015 BEPiD. All rights reserved.
//

import Foundation
import Foundation

class Request {
    
    var patientFullName: String
    var insurance: String
    var doctorName: String
    var doctorTelephone: Int
    var surgeryType: String
    var doctorApplication: String
    var patientBirth: Int
    var surgeryDate: Int
    var gender: Bool
    
    
    
    init (patientFullName: String, insurance: String, doctorName: String, doctorTelephone: Int, surgeryType: String, doctorApplication: String, patientBirth: Int, surgeryDate: Int, gender: Bool) {
        
        self.patientFullName = patientFullName
        self.insurance = insurance
        self.doctorName = doctorName
        self.doctorTelephone = doctorTelephone
        self.surgeryDate = surgeryDate
        self.surgeryType = surgeryType
        self.doctorApplication = doctorApplication
        self.patientBirth = patientBirth
        self.surgeryType = surgeryType
        self.gender = gender
    }
}
