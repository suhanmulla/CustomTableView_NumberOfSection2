//
//  VegNonvegTableViewCell.swift
//  CustomTableView_NumberOfSection2
//
//  Created by Macintosh on 18/03/25.
//

import UIKit

class VegNonvegTableViewCell: UITableViewCell {
    
    @IBOutlet weak var foodItemImageView: UIImageView!
    
    @IBOutlet weak var foodItemNameLabel: UILabel!
    
    @IBOutlet weak var foodItemDescriptionLabel: UILabel!
    
    @IBOutlet weak var foodItemPriceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
