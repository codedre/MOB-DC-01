//
//  Animal.swift
//  animalClass
//
//  Created by Andre Shonubi on 1/14/15.
//  Copyright (c) 2015 Andre Shonubi. All rights reserved.
//

import Foundation


class Animal {
    var species = ""
    var name = ""
    
    func stringRepresentation() -> String {
        
        return "The animal is a \(self.species), its name is \(self.name)"
    }
}



