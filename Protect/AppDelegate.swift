/**
 * Copyright (c) 2015-present, Parse, LLC.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree. An additional grant
 * of patent rights can be found in the PATENTS file in the same directory.
 */

import UIKit
import Firebase


// If you want to use any of the UI components, uncomment this line
// import ParseUI

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        FIRApp.configure()
        return true
    }
    




    func login() {
        
        //Perform a fetch request
        let email = NSUserDefaults.standardUserDefaults().stringForKey("email")
        
        if email != nil {
            let storybaord: UIStoryboard = UIStoryboard(name:"Main", bundle: nil)
            let sliderView = storybaord.instantiateViewControllerWithIdentifier("sliderView")
            window?.rootViewController = sliderView
        }
        
    }
    
    

}

