//
//  CategoryCell.swift
//  Yelp
//
//  Created by David Bocardo on 10/24/16.
//  Copyright © 2016 Timothy Lee. All rights reserved.
//

import UIKit

@objc protocol CategoryCellDelegate {
    @objc optional func categoryCell(categoryCell: CategoryCell, didChangeValue value: Bool)
}

class CategoryCell: UITableViewCell {
    
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var categorySwitch: UISwitch!
    
    weak var delegate: CategoryCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func switchValueChanged(_ sender: AnyObject) {
        delegate?.categoryCell?(categoryCell: self, didChangeValue: categorySwitch.isOn)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
