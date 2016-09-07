//
//  TimerViewController.swift
//  Protect
//
//  Created by Kevin Grozav on 4/6/16.
//  Copyright © 2016 Kevin Grozav. All rights reserved.
//

import UIKit


class TimerViewController: UIViewController {

    @IBOutlet weak var textView: UIView!
    
    var textBGColor = UIColor()
    
    @IBOutlet weak var etaText: UILabel!
    @IBOutlet weak var countUpTimer: UILabel!
    @IBOutlet weak var countDownTimer: UILabel!
    @IBOutlet weak var cancelBtn: UIButton!
    @IBOutlet weak var startLabel: UILabel!
    
    @IBOutlet weak var eLbl: UILabel!
    @IBOutlet weak var cLbl: UILabel!
    @IBOutlet weak var aLbl: UILabel!
    @IBOutlet weak var rLbl: UILabel!
    @IBOutlet weak var whatLbl: UILabel!
    var downTimer : NSTimer = NSTimer()
    var upTimer : NSTimer = NSTimer()
    var timeToHelp = 300
    var timeSinceAlarm = 0
    
    var type : AlarmTypes = .FIRE
    

    func sendPush() {
        
//        switch(type) {
//        case .FIRE:
//            PFCloud.callFunctionInBackground("firePush", withParameters: nil)
//        case .MEDICAL:
//            PFCloud.callFunctionInBackground("medicalPush", withParameters: nil)
//        case .EXTREME:
//            PFCloud.callFunctionInBackground("extremePush", withParameters: nil)
//        case .MINOR:
//            PFCloud.callFunctionInBackground("minorPush", withParameters: nil)
//        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        //send the appropriate push notification
        sendPush()

        //make text responsive to 4s device height in portrait
        if UIScreen.mainScreen().nativeBounds.height == 960.0 {
            etaText.font = UIFont(name: etaText.font.fontName, size: 16)
            countUpTimer.font = UIFont(name: countUpTimer.font.fontName, size: 24)
            countDownTimer.font = UIFont(name: countDownTimer.font.fontName, size: 24)
            startLabel.font = UIFont(name: startLabel.font.fontName, size: 16)
            
            whatLbl.font = UIFont(name: whatLbl.font.fontName, size: 16)
            rLbl.font = UIFont(name: rLbl.font.fontName, size: 12)
            aLbl.font = UIFont(name: aLbl.font.fontName, size: 12)
            cLbl.font = UIFont(name: cLbl.font.fontName, size: 12)
            eLbl.font = UIFont(name: eLbl.font.fontName, size: 12)
            
        }
        
        
        textView.backgroundColor = textBGColor
        self.title = "Emergency"
        let subviews = self.textView.subviews
        for subview in subviews {
            if let label = subview as? UILabel {
                label.textColor = UIColor.whiteColor()
            }
        }
        
        etaText.textColor = textBGColor
        countDownTimer.textColor = textBGColor
        countUpTimer.textColor = textBGColor
        startLabel.textColor = textBGColor
        
        //modify the cancel button
        //cancelBtn.frame = CGRectMake(100, 100, 50, 50)
        cancelBtn.layer.cornerRadius = 0.1 * cancelBtn.bounds.size.width
        cancelBtn.layer.borderColor = textBGColor.CGColor
        cancelBtn.layer.borderWidth = 1
        cancelBtn.titleLabel?.textColor = textBGColor
        cancelBtn.clipsToBounds = true
        
        cancelBtn.setTitleColor(textBGColor, forState: UIControlState.Normal)
        
        self.startDownTimer()
        self.startUpTimer()
    }
 
    func startUpTimer() {
        upTimer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(TimerViewController.runUp), userInfo: nil, repeats: true)
    }
    
    func runUp() {
        timeSinceAlarm  += 1
        let minutes = timeSinceAlarm / 60
        let seconds = timeSinceAlarm - (minutes * 60)
        let hours = 0
        
        let upTimerOutput = NSString.localizedStringWithFormat("%02d:%02d:%02d",hours, minutes, seconds)
        countUpTimer.text! = upTimerOutput as String
        
    }
    @IBAction func cancelAlarm(sender: AnyObject) {
        let cancelAlert = UIAlertController(title: "Cancel", message: "Enter Passcode To Cancel", preferredStyle: .Alert)
        let cancelAction = UIAlertAction(title: "Enter", style: .Default) { (action: UIAlertAction) in
            let passCodeField = cancelAlert.textFields![0] as UITextField
            
                let alarmTable = self.storyboard?.instantiateViewControllerWithIdentifier("sliderView")
            //self.dismissViewControllerAnimated(true, completion: nil)
            alarmTable!.navigationItem.setHidesBackButton(true, animated: true)
            self.showViewController(alarmTable!, sender: alarmTable)
        }
        
        let exitAction = UIAlertAction(title: "Exit", style: .Default, handler: nil)
        
        cancelAlert.addTextFieldWithConfigurationHandler { (textField: UITextField!) in
            textField.placeholder = "Enter Passcode"
            textField.keyboardType = UIKeyboardType.NumberPad
            textField.secureTextEntry = true
        }
        
        cancelAlert.addAction(cancelAction)
        cancelAlert.addAction(exitAction)
        self.presentViewController(cancelAlert, animated: true, completion: nil)
        
    }
    
    func startDownTimer() {

        //set the count down timer
        downTimer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(TimerViewController.runDown), userInfo: nil, repeats: true)
    }
    
    func runDown() {
      
        timeToHelp -= 1
        let minutes = timeToHelp / 60
        let seconds = timeToHelp - (minutes * 60)
        let hours = 0
        
        let downTimerOutput = NSString.localizedStringWithFormat( "%02d:%02d:%02d", hours, minutes, seconds)
        
        countDownTimer.text! = downTimerOutput as String
        
        if (timeToHelp == 0) {
            downTimer.invalidate()
        }
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
}




