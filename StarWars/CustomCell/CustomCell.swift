//
//  CustomCell.swift
//  StarWars
//
//  Created by Vladislav on 24.12.2021.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var customCellLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.layer.borderWidth = 1
        self.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
