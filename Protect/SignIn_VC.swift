//
//  SignIn_VC.swift
//  Protect
//
//  Created by Kevin Grozav on 3/31/16.
//  Copyright © 2016 Kevin Grozav. All rights reserved.
//

import UIKit
import Parse

class SignIn_VC: UIViewController {
    
    @IBOutlet weak var singInBtn: UIButton!
    @IBOutlet weak var signUpBtn: UIButton!
    
   // @IBOutlet weak var backgroundImg: UIImageView!
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
    }
   
    
    @IBAction func loginClicked(sender: AnyObject) {
        let alarmTable = self.storyboard?.instantiateViewControllerWithIdentifier("sliderView")
        //self.dismissViewControllerAnimated(true, completion: nil)
        alarmTable!.navigationItem.setHidesBackButton(true, animated: true)
        self.showViewController(alarmTable!, sender: alarmTable)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //modify login button
        singInBtn.layer.cornerRadius = 10
        
        //modify register button
        signUpBtn.layer.borderColor = UIColor(red: 81/255, green: 159/255, blue: 243/255, alpha: 1).CGColor
        signUpBtn.layer.borderWidth  = 1
        signUpBtn.layer.cornerRadius = 10
        
        //modify background image
       // backgroundImg.alpha = 0.8
      
    }
    
    /*override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }*/
}
