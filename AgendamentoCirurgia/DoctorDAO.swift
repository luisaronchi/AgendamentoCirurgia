//
//  DoctorDAO.swift
//  AgendamentoCirurgia
//
//  Created by Carol Grädel on 7/13/15.
//  Copyright (c) 2015 BEPiD. All rights reserved.
//

import Foundation
import Parse
import Foundation
import Parse


class DoctorDAO: NSObject {
    
    class func logOut() {
        
        var email: String
        email = ""
        
        var password: String
        password = ""
        
        var feed: String
        feed = ""
        
        var paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as! String
        var path = paths.stringByAppendingPathComponent("Doctor.plist")
        var fileManager = NSFileManager.defaultManager()
        if (!(fileManager.fileExistsAtPath(path)))
        {
            var bundle : NSString = NSBundle.mainBundle().pathForResource("Doctor", ofType: "plist")!
            fileManager.copyItemAtPath(bundle as String, toPath: path, error:nil)
        }
        
        var data : NSMutableDictionary! = NSMutableDictionary(contentsOfFile: path)
        data.setObject(email, forKey: "email")
        data.setObject(password, forKey: "password")
        data.setObject(feed, forKey: "feed")
        data.writeToFile(paths, atomically: true)
        println("salvo")
        
        
        
    }
    
    class func setCurrentUser(email: String, password: String){
        
        var paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as! String
        var path = paths.stringByAppendingPathComponent("Doctor.plist")
        var fileManager = NSFileManager.defaultManager()
        if (!(fileManager.fileExistsAtPath(path)))
        {
            var bundle : NSString = NSBundle.mainBundle().pathForResource("Doctor", ofType: "plist")!
            fileManager.copyItemAtPath(bundle as String, toPath: path, error:nil)
        }
        
        var data : NSMutableDictionary! = NSMutableDictionary(contentsOfFile: path)
        data.setObject(email, forKey: "email")
        data.setObject(password, forKey: "password")
        data.writeToFile(path, atomically: true)
        
    }
    
    
    class func getCurrentUser() -> Doctor? {
        
        
        var pathAux = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as! String
        var path: NSString = pathAux.stringByAppendingPathComponent("Doctor.plist")
        let contents:NSDictionary! = NSDictionary(contentsOfFile: path as String)
        
        if(contents == nil)
            
        {
            return nil
        }
        
        var email = contents.objectForKey("email") as? String
        var password = contents.objectForKey("password") as! String
        var fullName = contents.objectForKey("fullName") as! String
        println(email)
        println(password)
        
        if(email == nil)
        {
            return nil
        }
        else {
            
            return Doctor (fullname: String(), crm: Int(), cpf: Int(), speciality: String(), email: String(), officeTelephone: Int(), emergencyTelephone: Int(), password: String())
        }
        
    }
    
    
    class func getUser(comEmail email: String, callback: (Doctor?) -> Void) ->Void {
        
        var query = PFQuery(className: "Doctor")
        query.whereKey("Email", equalTo: email.lowercaseString)
        
        query.findObjectsInBackgroundWithBlock {
            (objects: [AnyObject]?, error: NSError?) -> Void in
            
            if error == nil {
                if (objects?.count > 0){
                    var userDict = (objects as! [PFObject])[0]
                    
                    let fullName = userDict["FullName"] as! String
                    let email = userDict["Email"] as! String
                    let crm = userDict["CRM"] as! Int
                    //                        let speciality = userDict["Speciality"] as! String
                    let phone = userDict["OfficeTelephone"] as! Int
                    let password = userDict["password"] as! String
                    
                    
                    var doctor: Doctor = Doctor (fullname: fullName, crm: crm, cpf: Int(), speciality: String(), email: email, officeTelephone: phone, emergencyTelephone: Int(), password: password)
                    
                    callback(doctor)
                    
                } else {
                    callback(nil)
                }
            } else {
                //erro!
                println("Error: \(error!) \(error!.userInfo!)")
            }
        }
    }
    
    
    
    
    
    class func isValidEmail(testStr: String) -> Bool{
        
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluateWithObject(testStr)
    }
    
    
    // FALTA ADICIONAR O RESTO DO CADASTRO DO MEDICO
    
    class func addUser(fullName: String, password: String, email: String, crm: Int, phone: Int, callback: (error: Bool, desc: String) -> Void) -> Void {
        
        var search: Doctor?
        
        getUser(comEmail: email.lowercaseString) { doctor in
            
            if(doctor != nil) {
                callback(error: true, desc: "Esse usuário já existe")
            } else {
                
                if !(self.isValidEmail(email.lowercaseString)) {
                    
                    callback(error: true, desc: "Email Inválido")
                } else {
                    
                    var newDoctor = PFObject(className: "Doctor")
                    newDoctor.setObject(fullName, forKey: "FullName")
                    newDoctor.setObject(email.lowercaseString, forKey: "Email")
                    newDoctor.setObject(password, forKey: "password")
                    newDoctor.setObject(crm, forKey: "CRM")
                    newDoctor.setObject(phone, forKey: "OfficeTelephone")
                    
                    newDoctor.saveInBackgroundWithBlock {
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
}

