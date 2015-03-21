//
//  businessTableViewCell.swift
//  letseat
//
//  Created by Andre Shonubi on 3/14/15.
//  Copyright (c) 2015 Andre Shonubi. All rights reserved.
//

import UIKit

class BusinessCell: UITableViewCell {

    @IBOutlet weak var thumbImageView: UIImageView!
    @IBOutlet weak var ratingImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
       
    override func prepareForReuse() {
        let defaultImage = UIImage(named: "Rectangle 1 + 1426551380_Food-Dome")
        self.thumbImageView.image = defaultImage
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    // set open or closed status for business
    func setStatus(status:Bool){
        if status == true {
            self.ratingLabel.text = "Open"
            self.ratingLabel.textColor = UIColor(red: 23/255, green: 144/255, blue: 25/255, alpha: 1)
        }
    }
    
    
    // set the correct ratings image to display in the the ratingsImageView
    func setRatingImage(rating:Float) {
                
        switch rating {
        case 1.0...1.2:
            self.ratingImageView.image = UIImage(named: "1s")
        case 1.3...1.7:
            self.ratingImageView.image = UIImage(named: "1.5s")
        case 1.8...2.2:
            self.ratingImageView.image = UIImage(named: "2s")
        case 2.3...2.7:
            self.ratingImageView.image = UIImage(named: "2.5s")
        case 2.8...3.2:
            self.ratingImageView.image = UIImage(named: "3s")
        case 3.3...3.7:
            self.ratingImageView.image = UIImage(named: "3.5s")
        case 3.8...4.2:
            self.ratingImageView.image = UIImage(named: "4s")
        case 4.3...4.7:
            self.ratingImageView.image = UIImage(named: "4.5s")
        case 4.8...5:
            self.ratingImageView.image = UIImage(named: "5")
        default:
            self.ratingImageView.image = UIImage(named: "0s")
        }
    }

}
