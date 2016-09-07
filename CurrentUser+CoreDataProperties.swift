//
//  CurrentUser+CoreDataProperties.swift
//  Protect
//
//  Created by Kevin Grozav on 4/4/16.
//  Copyright © 2016 Kevin Grozav. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension CurrentUser {

    @NSManaged var firstName: String?
    @NSManaged var lastName: String?
    @NSManaged var email: String?
    @NSManaged var position: String?
    @NSManaged var phoneNumber: NSDecimalNumber?
    @NSManaged var organization: String?

}
