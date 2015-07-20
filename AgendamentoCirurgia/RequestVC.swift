//
//  RequestVC.swift
//  AgendamentoCirurgia
//
//  Created by Jenifer Emmanuel on 15/07/15.
//  Copyright (c) 2015 BEPiD. All rights reserved.
//

import UIKit

class RequestVC: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var nameField: UITextField!

    @IBAction func TextFieldEditing(sender: UITextField) {
        
        
        var datePickerView:UIDatePicker = UIDatePicker()
        
        datePickerView.datePickerMode = UIDatePickerMode.Date
        
        sender.inputView = datePickerView
        
        datePickerView.addTarget(self, action: Selector("datePickerValueChanged:"), forControlEvents: UIControlEvents.ValueChanged)

    }
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var insuranceField: UITextField!
    
    @IBOutlet weak var nameDoctorField: UITextField!
    
    @IBOutlet weak var phoneField: UITextField!

    @IBOutlet weak var surgeryTypeField: UITextField!
    
   
    @IBOutlet weak var SurgeryDate: UITextField!
  
    @IBAction func SurgeryDatePicker(sender: UITextField) {
        var datePickerView:UIDatePicker = UIDatePicker()
        
        datePickerView.datePickerMode = UIDatePickerMode.Date
        
        sender.inputView = datePickerView
        
        datePickerView.addTarget(self, action: Selector("datePickerValueChanged:"), forControlEvents: UIControlEvents.ValueChanged)
    }
    
    @IBOutlet weak var materialField: UITextField!
    
    @IBOutlet weak var observationField: UITextField!
    
    func datePickerValueChanged(sender:UIDatePicker) {
        
        var dateFormatter = NSDateFormatter()
        
        dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
        
        dateFormatter.timeStyle = NSDateFormatterStyle.NoStyle
        
        dateTextField.text = dateFormatter.stringFromDate(sender.date)

    
        func datePickerValueChanged(sender:UIDatePicker) {
            
            var dateFormatter = NSDateFormatter()
            
            dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
            
            dateFormatter.timeStyle = NSDateFormatterStyle.NoStyle
            
            SurgeryDate.text = dateFormatter.stringFromDate(sender.date)
}

 func didReceiveMemoryWarning()
    
{
}

}
}
