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
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    public func configure(title: String, text: String){
        self.titleLabel.text = title
        self.descriptionLabel.text = text
    }
}
