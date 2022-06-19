//
//  ResourceHeadingTableViewCell.swift
//  MC2 - Market Research
//
//  Created by Anastasia Agustine on 19/06/22.
//

import UIKit

class ResourceHeadingTableViewCell: UITableViewCell {

    @IBOutlet weak var resourceHeadingImage: UIImageView!
    @IBOutlet weak var resourceTitleLabel: UILabel!
    @IBOutlet weak var resourceImageLabel: UILabel!
    
    static let identifier: String = "ResourceHeadingTableViewCell"
    
    static func nib()-> UINib {
        return UINib(nibName: "ResourceHeadingTableViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public func configure(image: UIImage, title: String, imageText: String){
        resourceHeadingImage.image = image
        resourceTitleLabel.text = title
        resourceImageLabel.text = imageText
    }
    
}
