//
//  RequestVC.swift
//  AgendamentoCirurgia
//
//  Created by Jenifer Emmanuel on 15/07/15.
//  Copyright (c) 2015 BEPiD. All rights reserved.
//

import UIKit
import MobileCoreServices


class RequestVC: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate
{
    var newMedia: Bool?
    
    @IBOutlet weak var dateTextField: UITextField!
    
    @IBOutlet weak var insuranceField: UITextField!
    
    @IBOutlet weak var nameDoctorField: UITextField!
    
    @IBOutlet weak var phoneField: UITextField!
    
    @IBOutlet weak var surgeryTypeField: UITextField!
    
    @IBOutlet weak var SurgeryDate: UITextField!
    
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var materialField: UITextField!
    
    @IBOutlet weak var observationField: UITextField!
    
    var id = 1;
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        dateTextField.delegate = self
        SurgeryDate.delegate = self
        
        let tap = UITapGestureRecognizer(target: self, action: "didTapView")
        view.addGestureRecognizer(tap)
    }

    func didTapView () {
        view.endEditing(true)
    }
    
    var birthDatePicker: UIDatePicker!
    
    var sugeryDatePicker: UIDatePicker!
    
    @IBAction func TextFieldEditing(sender: UITextField)
    {
        var birthDatePicker:UIDatePicker = UIDatePicker()
        
        birthDatePicker.datePickerMode = UIDatePickerMode.Date
        
        sender.inputView = birthDatePicker
        
        birthDatePicker.addTarget(self, action: Selector("datePickerValueChanged:"), forControlEvents: UIControlEvents.ValueChanged)
    }
  
    @IBAction func SurgeryDatePicker(sender: UITextField)
    {
        var sugeryDatePicker:UIDatePicker = UIDatePicker()
        
        sugeryDatePicker.datePickerMode = UIDatePickerMode.Date
        
        sender.inputView = sugeryDatePicker
        
        sugeryDatePicker.addTarget(self, action: Selector("datePickerValueChanged:"), forControlEvents: UIControlEvents.ValueChanged)
    }
    
    @IBAction func useCameraRoll(sender: AnyObject) {
        
        
        if UIImagePickerController.isSourceTypeAvailable(
            UIImagePickerControllerSourceType.SavedPhotosAlbum) {
                let imagePicker = UIImagePickerController()
                
                imagePicker.delegate = self
                imagePicker.sourceType =
                    UIImagePickerControllerSourceType.PhotoLibrary
                imagePicker.mediaTypes = [kUTTypeImage as NSString]
                imagePicker.allowsEditing = false
                self.presentViewController(imagePicker, animated: true,
                    completion: nil)
                newMedia = false
        }
    }

    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        
        let mediaType = info[UIImagePickerControllerMediaType] as! NSString
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
        if mediaType.isEqualToString(kUTTypeImage as! NSString as String) {
            let image = info[UIImagePickerControllerOriginalImage]
                as! UIImage
            
//            imageView.image = image
            
            if (newMedia == true) {
                UIImageWriteToSavedPhotosAlbum(image, self,
                    "image:didFinishSavingWithError:contextInfo:", nil)
            } else if mediaType.isEqualToString(kUTTypeMovie as! String) {
                // Code to support video here
            }
            
        }
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        if(textField == self.dateTextField)
        {
            self.id = 1
        }
        else
        {
            self.id = 2
        }
    }
    
    func datePickerValueChanged(sender:UIDatePicker)
    {
        if(self.id == 1)
        {
        
            var dateFormatter = NSDateFormatter()
            
            dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
            
            dateFormatter.timeStyle = NSDateFormatterStyle.NoStyle
            
            dateTextField.text = dateFormatter.stringFromDate(sender.date)
        }
        else
        {
            var dateFormatter = NSDateFormatter()
            
            dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
            
            dateFormatter.timeStyle = NSDateFormatterStyle.NoStyle
            
            SurgeryDate.text = dateFormatter.stringFromDate(sender.date)
        }
        
    }
 
//    
//    func datePickerValueChanged(sender:UIDatePicker)
//    {
//        var dateFormatter = NSDateFormatter()
//        
//        dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
//        
//        dateFormatter.timeStyle = NSDateFormatterStyle.NoStyle
//        
//        SurgeryDate.text = dateFormatter.stringFromDate(sender.date)
//            
//    }
}