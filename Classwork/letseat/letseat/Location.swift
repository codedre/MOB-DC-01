//
//  Location.swift
//  letseat
//
//  Created by Andre Shonubi on 3/20/15.
//  Copyright (c) 2015 Andre Shonubi. All rights reserved.
//

import Foundation

struct baseLocation {
    var name:String = ""
    var rating: Float = 0.0
    var types: String = ""
    var priceLevel: String = ""
    var Id:String = ""
    var icon:NSURL?
    var open:Bool = false
    var address:String = ""
    var details:detailedLocation?
    var reviews:Reviews?

}

struct detailedLocation {
    var address:String = ""
    var hours: [String] = []
    var pictures: [String] = []
    var website: NSURL? 
    var latitude:Float = 0.0
    var longitude:Float = 0.0
    var rating: UIImageView?
    var phone:String = ""
    var status:String = ""
}

struct Reviews {
    var author: [String] = []
    var rating: [Float] = []
    var review: [String] = []
    var time: [Int] = []
}

struct Days {
    var view:UIView?
    var label: UILabel?
    var constraint: NSLayoutConstraint?
}