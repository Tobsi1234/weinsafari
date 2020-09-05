//
//  RestaurantTableViewCell.swift
//  Weinsafari
//
//  Created by Tobias Steinbrück on 16.11.19.
//  Copyright © 2019 Tobias Steinbrück. All rights reserved.
//

import UIKit

class RestaurantTableViewCell: UITableViewCell {

    @IBOutlet var restaurantLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
