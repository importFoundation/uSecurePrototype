//
//  User.swift
//  Protect
//
//  Created by Kevin Grozav on 8/1/16.
//  Copyright © 2016 Kevin Grozav. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase

struct User {
    
    // user properties
    let username : String
    let passcode : String
    let email : String
    let uid : String
    
    
    // intilization with arbitray data
    init(username: String, passcode : String, email:String, uid: String) {
        self.username = username
        self.passcode = passcode
        self.email = email
        self.uid = uid
    }
    
    // initilization with FIRUser api
    init(user: FIRUser) {
        self.uid = user.uid
        self.email = user.providerData.first!.email!
        self.passcode = user.valueForKey("passcode") as! String
        self.username = user.valueForKey("username") as! String
    }

    
    func toAnyObject() -> AnyObject {
        return ["username" : self.username, "email": self.email, "passcode" : self.passcode, "uid":self.uid]
    }
}