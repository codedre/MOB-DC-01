//
//  MenuButton.swift
//  letseat
//
//  Created by Andre Shonubi on 3/14/15.
//  Copyright (c) 2015 Andre Shonubi. All rights reserved.
//

import Foundation
import UIKit

class MenuButton: UINavigationController {
    
    var button: HamburgerButton! = nil
    
    func makeButton() {
    
    self.button = HamburgerButton(frame: CGRectMake(0, 0, 5, 5))
    self.button.addTarget(self, action: "toggle:", forControlEvents: .TouchUpInside)
    var transform = self.button.transform
    transform = CGAffineTransformScale(transform, 0.65, 0.65)
    
    self.button.transform = transform
    
    self.navigationItem.setLeftBarButtonItem(UIBarButtonItem(customView: self.button), animated: true)
    }
    
    func toggle(button:UIButton) {
        self.button.showsMenu = !self.button.showsMenu
    }
}
