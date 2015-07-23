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
    
    @IBOutlet weak var birthField: UITextField!

    @IBOutlet weak var insuranceField: UITextField!
    
    @IBOutlet weak var nameDoctorField: UITextField!
    
    @IBOutlet weak var phoneField: UITextField!

    @IBOutlet weak var surgeryTypeField: UITextField!
    
    @IBOutlet weak var surgeryDateField: UITextField!
    
    @IBOutlet weak var materialField: UITextField!
    
    @IBOutlet weak var observationField: UITextField!
    
    var dt : NSDate = NSDate()

    @IBAction func textFieldEditing(sender: UITextField) {
        var datePickerView: UIDatePicker = UIDatePicker()
        datePickerView.datePickerMode = UIDatePickerMode.Date
        sender.inputView = datePickerView
        datePickerView.addTarget(self, action: Selector("datePickerValueChanged:"), forControlEvents: UIControlEvents.ValueChanged)
    }
    
    func datePickerValueChanged(sender: UIDatePicker) {
        var dateformatter = NSDateFormatter()
        dateformatter.dateStyle = NSDateFormatterStyle.MediumStyle
        birthField.text = dateformatter.stringFromDate(sender.date)
        
        dt = sender.date
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var data: NSDate = NSDate()
        
        birthField.delegate = self

    }

    }

func didReceiveMemoryWarning()
    
{
   didReceiveMemoryWarning()
}








