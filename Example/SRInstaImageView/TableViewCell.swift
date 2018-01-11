//
//  TableViewCell.swift
//  instagramView
//
//  Created by Shamshir on 11/01/18.
//  Copyright © 2018 shamshir. All rights reserved.
//

import UIKit
import SRInstaImageView
class TableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var photoImageView: SRInstaImageView!
    
    
    @IBOutlet weak var photoLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
