//
//  WineTableViewCell.swift
//  LaCarta
//
//  Created by Caleb on 29/12/2016.
//  Copyright © 2016 Caleb. All rights reserved.
//

import UIKit

class WineTableViewCell: UITableViewCell {
	
	//MARK: Properties
	@IBOutlet weak var nameLabel: UILabel!
	@IBOutlet weak var photoImageView: UIImageView!
	

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
