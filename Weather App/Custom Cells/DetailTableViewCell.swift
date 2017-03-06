//
//  DetailTableViewCell.swift
//  Weather App
//
//  Created by kumaran V on 06/03/17.
//  Copyright © 2017 Kumaran. All rights reserved.
//

import UIKit

class DetailTableViewCell: UITableViewCell {

    @IBOutlet var title: UILabel!
    @IBOutlet var value: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
