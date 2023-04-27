//
//  appTableViewCell.swift
//  website
//
//  Created by Mohan K on 21/11/22.
//

import UIKit

class AppTableViewCell: UITableViewCell {

    
    @IBOutlet weak var dell: UILabel!
    
    
    @IBOutlet weak var wide: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        contentView.clipsToBounds = true
        accessoryType = .disclosureIndicator
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
