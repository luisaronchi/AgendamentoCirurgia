//
//  RequestDAO.swift
//  AgendamentoCirurgia
//
//  Created by Carol Grädel on 7/13/15.
//  Copyright (c) 2015 BEPiD. All rights reserved.
//

import Foundation
import Parse

class RequestDAO {
    
    class func getRequest(email: String, callback:(Request?) -> Void) -> Void {
        
        var query = PFQuery(className: "Request")
        query.whereKey("Email", equalTo: email.lowercaseString)
        
        query.findObjectsInBackgroundWithBlock {
            (objects: [AnyObject]?, error: NSError?) -> Void in
            
            if (error == nil) {
                
                if (objects?.count > 0){
                    var userDict = (objects as! [PFObject])[0]
                    
                    let patientFullName = userDict["PatientFullName"] as! String
                    let insurance = userDict["Insurance"] as! String
                    let doctorName = userDict["DoctorName"] as! String
                    let doctorTelephone = userDict["DoctorTelephone"] as! Int
//                  let doctorApplication = userDict["DoctorApplication"] as! String
                    let patientBirth = userDict["PatientBirth"] as! String
                    let surgeryData = userDict["SurgeryData"] as! String
                    let surgeryType = userDict["SurgeryType"] as! String
                    let gender = userDict["Gender"] as! String
                    let email = userDict["Email"] as! String
                    
                
                    var request: Request = Request(patientFullName: patientFullName, insurance: insurance, doctorName: doctorName, doctorTelephone: doctorTelephone, surgeryType: surgeryType, patientBirth: patientBirth, surgeryDate: surgeryData, gender: gender, email: email)
                    
                    callback(request)
                    
                } else {
                    callback(nil)
                    
                }
                
            } else {
                //error
                println("Error: \(error!) \(error!.userInfo!)")

            }
        }

    }



    class func addRequest(patientFullName: String, insurance: String, doctorName: String, doctorTelephone: Int, surgeryType: String, patientBirth: String, surgeryDate: String, gender: String, email: String, callback: (error: Bool, desc: String) -> Void) -> Void {
    
    
        var search: Request?
        
        getRequest(email.lowercaseString) { request in
            
            if (request?.surgeryDate == surgeryDate){
                callback(error: true, desc: "Horário ocupado")
            } else {
                var newRequest = PFObject(className: "Request")
                newRequest.setObject(patientFullName, forKey: "PatientFullName")
                newRequest.setObject(insurance, forKey: "Insurance")
                newRequest.setObject(doctorName, forKey: "DoctorName")
                newRequest.setObject(doctorTelephone, forKey: "DoctorTelephone")
                newRequest.setObject(surgeryType, forKey: "SurgeryType")
//                newRequest.setObject(doctorApplication, forKey: "DoctorApplication")
                newRequest.setObject(patientBirth, forKey: "PatientBirth")
                newRequest.setObject(surgeryDate, forKey: "SurgeryDate")
                newRequest.setObject(gender, forKey: "Gender")
                newRequest.setObject(email, forKey: "email")
                
                newRequest.saveInBackgroundWithBlock {
                    (success: Bool, error: NSError?) -> Void in
                    
                    if (success) {
                        callback(error: false, desc: "Succeeded")
                    } else {
                        callback(error: true, desc: "Error")
                    }
                
                }
            
            }

        }
    }
    
    
    class func getRequestbyID (email: String, patientName: String, patientBirth: String, surgeryDate: String,  callback:(Request?) -> Void) -> Void {
        
        var query = PFQuery(className: "Request")
        
        query.whereKey("Email", equalTo: email.lowercaseString)
        query.whereKey("PatientFullName", equalTo: patientName)
        query.whereKey("PatientBirth", equalTo: patientBirth)
        query.whereKey("SurgeryDate", equalTo: surgeryDate)
        
        query.findObjectsInBackgroundWithBlock {
            (objects: [AnyObject]?, error: NSError?) -> Void in
            
            if (error == nil) {
                
                if (objects?.count == 1){
                    var userDict = (objects as! [PFObject])[0]
                    
                    let patientFullName = userDict["PatientFullName"] as! String
                    let insurance = userDict["Insurance"] as! String
                    let doctorName = userDict["DoctorName"] as! String
                    let doctorTelephone = userDict["DoctorTelephoe"] as! Int
//                    let doctorApplication = userDict["DoctorApplication"] as! String
                    let patientBirth = userDict["PatientBirth"] as! String
                    let surgeryData = userDict["SurgeryData"] as! String
                    let surgeryType = userDict["SurgeryType"] as! String
                    let gender = userDict["Gender"] as! String
                    let email = userDict["Email"] as! String
                    
                    
                    var request: Request = Request(patientFullName: patientFullName, insurance: insurance, doctorName: doctorName, doctorTelephone: doctorTelephone, surgeryType: surgeryType, patientBirth: patientBirth, surgeryDate: surgeryData, gender: gender, email: email)
                    
                    callback(request)
                    
                } else {
                    callback(nil)
                    
                }
                
            } else {
                //error
                println("Error: \(error!) \(error!.userInfo!)")
                
            }
        }

    }
    
    class func updateRequest(patientFullName: String, insurance: String, doctorName: String, doctorTelephone: Int, surgeryType: String, patientBirth: String, surgeryDate: String, gender: String, email: String, callback: (error: Bool, desc: String) -> Void) -> Void {
    
    
        var search: Request?
    
        getRequestbyID(email, patientName: patientFullName, patientBirth: patientBirth, surgeryDate: surgeryDate) { request in
    
        if (request == nil){
            callback(error: true, desc: "Não existe nada no Parse com esse ID")
        } else {
            
            var newRequest = PFObject(className: "Request")
            newRequest.setObject(patientFullName, forKey: "PatientFullName")
            newRequest.setObject(insurance, forKey: "Insurance")
            newRequest.setObject(doctorName, forKey: "DoctorName")
            newRequest.setObject(doctorTelephone, forKey: "DoctorTelephone")
            newRequest.setObject(surgeryType, forKey: "SurgeryType")
//            newRequest.setObject(doctorApplication, forKey:"DoctorApplication")
            newRequest.setObject(patientBirth, forKey: "PatientBirth")
            newRequest.setObject(surgeryDate, forKey: "SurgeryDate")
            newRequest.setObject(gender, forKey: "Gender")
            newRequest.setObject(email, forKey: "email")
    
            newRequest.saveInBackgroundWithBlock {
                (success: Bool, error: NSError?) -> Void in
    
                if (success) {
                    callback(error: false, desc: "Succeeded")
                } else {
                    callback(error: true, desc: "Error")
                }
    
            }
    
        }
    }
    
}

    
    
    
    class func removeRequest (patientFullName: String, insurance: String, doctorName: String, doctorTelephone: Int, surgeryType: String, doctorApplication: String, patientBirth: String, surgeryDate: String, gender: String, email: String, callback: (error: Bool, desc: String) -> Void) -> Void {
        
        
        var search: Request?
        
        getRequestbyID(email, patientName: patientFullName, patientBirth: patientBirth, surgeryDate: surgeryDate) { request in
            
            if (request == nil){
                callback(error: true, desc: "Não existe nada no Parse com esse ID")
            } else {
                
                var newRequest = PFObject(className: "Request")
                newRequest.setObject(patientFullName, forKey: "PatientFullName")
                newRequest.setObject(insurance, forKey: "Insurance")
                newRequest.setObject(doctorName, forKey: "DoctorName")
                newRequest.setObject(doctorTelephone, forKey: "DoctorTelephone")
                newRequest.setObject(surgeryType, forKey: "SurgeryType")
                newRequest.setObject(doctorApplication, forKey:"DoctorApplication")
                newRequest.setObject(patientBirth, forKey: "PatientBirth")
                newRequest.setObject(surgeryDate, forKey: "SurgeryDate")
                newRequest.setObject(gender, forKey: "Gender")
                newRequest.setObject(email, forKey: "email")
                
                newRequest.deleteInBackgroundWithBlock {
                    (success: Bool, error: NSError?) -> Void in
                    
                    if (success) {
                        callback(error: false, desc: "Succeeded")
                    } else {
                        callback(error: true, desc: "Error")
                    }
                    
                }
                
            }
        }
    }
}



