//
//  CustomTableViewCell.swift
//  RSSFromScratch
//
//  Created by Developer on 26/02/17.
//  Copyright © 2017 vlad. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var myDescription: UILabel!
    @IBOutlet weak var myTitle: UILabel!

    @IBOutlet weak var myImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

}
