//
//  Animal.swift
//  Core Data Example
//
//  Created by Andre Shonubi on 2/25/15.
//  Copyright (c) 2015 Andre Shonubi. All rights reserved.
//

import Foundation
import CoreData

@objc(Animal) // Ports class over to objective C

class Animal: NSManagedObject {
    // @NSManage is tying our parameters to our attributes and removes requirement for value
    @NSManaged var name: String
    @NSManaged var numberOfLegs: Int32
    @NSManaged var hasFurr: Bool
    @NSManaged var noise: String
}