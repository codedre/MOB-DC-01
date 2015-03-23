//
//  DetailTableViewCell.swift
//  letseat
//
//  Created by Andre Shonubi on 3/22/15.
//  Copyright (c) 2015 Andre Shonubi. All rights reserved.
//

import UIKit

class DetailTableViewCell: UITableViewCell {
    @IBOutlet weak var galleryImgView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
