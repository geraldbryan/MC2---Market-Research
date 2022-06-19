//
//  ResourceOneParagraphTableViewCell.swift
//  MC2 - Market Research
//
//  Created by Anastasia Agustine on 19/06/22.
//

import UIKit

class ResourceOneParagraphTableViewCell: UITableViewCell {

    static let identifier: String = "ResourceOneParagraphTableViewCell"
    static func nib()-> UINib{
        return UINib(nibName: "ResourceOneParagraphTableViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
