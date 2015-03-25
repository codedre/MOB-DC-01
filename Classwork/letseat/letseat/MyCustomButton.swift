//
//  MyCustomButton.swift
//  letseat
//
//  Created by Andre Shonubi on 3/24/15.
//  Copyright (c) 2015 Andre Shonubi. All rights reserved.
//

import Foundation
import UIKit

class MyCustomButton: UIView {
    
    var buttonLabels:String?

    required init(coder aDecoder: NSCoder) {
        super.init(coder:aDecoder)
        
        self.layer.cornerRadius = 10.0
        self.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.3)
    }
    
}
