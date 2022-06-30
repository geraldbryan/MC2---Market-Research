//
//  StepImageTableViewCell.swift
//  MC2 - Market Research
//
//  Created by Anastasia Agustine on 19/06/22.
//

import UIKit

class StepImageTableViewCell: UITableViewCell {

    @IBOutlet weak var stepImage: UIImageView!
    
    static let identifier: String = "StepImageTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "StepImageTableViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public func configure (image: UIImage){
        self.stepImage.image = image
    }
}
