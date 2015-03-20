//
//  Location.swift
//  letseat
//
//  Created by Andre Shonubi on 3/20/15.
//  Copyright (c) 2015 Andre Shonubi. All rights reserved.
//

import Foundation

struct Location {
    var phone:String = ""
    var name:String = ""
    var latitude:Float?
    var longitude:Float?
    var rating: Float?
    var types: [String] = []
    var priceLevel: Int = 0
    var Id:String = ""
    var pictures: [String] = []
    var hours: [String] = []
    var website: NSURL?
    var status:String = ""
    var reviews:[String] = []
    var icon:NSURL?
    var open:Bool = false
    var address:String = ""
    
}