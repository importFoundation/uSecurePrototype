//
//  SingUp_VC.swift
//  Protect
//
//  Created by Kevin Grozav on 3/31/16.
//  Copyright © 2016 Kevin Grozav. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class SingUp_VC: UIViewController {
   
    
    // reference to our FirebaseDB
    let dbReference = FIRDatabase.database().reference()
    
    @IBOutlet weak var cancelBtn: UIButton!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var position: UITextField!
    @IBOutlet weak var organizationID: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var passcode: UITextField!
    
    @IBOutlet weak var repeatPassword: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var registerBtn: UIButton!
    
    @IBOutlet weak var scrollView: UIScrollView!
    var keyboard = CGRect()
    var scrollViewHeight : CGFloat = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //button borders
        cancelBtn.layer.borderWidth = 1
        cancelBtn.layer.borderColor = UIColor(red: 81/255, green: 159/255, blue: 243/255, alpha: 1).CGColor
        cancelBtn.layer.cornerRadius = 10
        
        //button borders
        registerBtn.layer.cornerRadius = 10
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(SingUp_VC.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    //Calls this function when the tap is recognized.
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func cacnelBtnClicked(sender: AnyObject) {
        self.view.endEditing(true)
        let loginPage = self.storyboard?.instantiateViewControllerWithIdentifier("LoginView")
        self.presentViewController(loginPage!, animated: true, completion: nil)
        
    }
 
    
    @IBAction func registerBtnClick(sender: AnyObject) {
       self.view.endEditing(true)
        
        //alert the user if required fields are not entered
        if (username.text!.isEmpty || passcode.text!.isEmpty || email.text!.isEmpty
            || password.text!.isEmpty || repeatPassword.text!.isEmpty) {
            let checkFields = UIAlertController(title: "Fields", message: "Please enter requried fields", preferredStyle: .Alert)
            let okAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
            checkFields.addAction(okAction)
            self.presentViewController(checkFields, animated: true, completion: nil)
            
        }
        
        
        //check if the passwords match
        if (password.text != repeatPassword.text) {
            let checkPassword = UIAlertController(title: "Passwords", message: "Do not match", preferredStyle: .Alert)
            let okAction = UIAlertAction(title: "OK", style: .Default , handler:nil)
            checkPassword.addAction(okAction)
            self.presentViewController(checkPassword, animated: true, completion: nil)
        }
        
        //save user data to Firebase
        FIRAuth.auth()?.createUserWithEmail(self.email.text!, password: self.password.text!, completion: { (user:FIRUser?, error:NSError?) in
            if error != nil {
                print(error.debugDescription)
            } else {
            
                // create the user
                let newUser = User(username: self.username.text!, passcode: self.passcode.text!, email: self.email.text!, uid: (user?.uid)!)
            
                // store the users information permanently and in real time to cloud
                self.dbReference.child("users").child(newUser.uid).setValue(newUser.toAnyObject())
            }
        })
        
        
        let alarmTable = self.storyboard?.instantiateViewControllerWithIdentifier("sliderView")
        //self.dismissViewControllerAnimated(true, completion: nil)
        alarmTable!.navigationItem.setHidesBackButton(true, animated: true)
        self.showViewController(alarmTable!, sender: alarmTable)
    }
    
    
}
