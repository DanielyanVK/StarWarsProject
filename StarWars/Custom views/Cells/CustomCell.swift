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
        layer.borderWidth = 1
        layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    // Method to link cell label, images, etc to actual model
    func update (with model: SwCharacter) {
        customCellLabel.text = model.name
    }
}
