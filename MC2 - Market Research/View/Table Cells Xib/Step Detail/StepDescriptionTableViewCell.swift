//
//  StepDescriptionTableViewCell.swift
//  MC2 - Market Research
//
//  Created by Anastasia Agustine on 19/06/22.
//

import UIKit

class StepDescriptionTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    static let identifier: String = "StepDescriptionTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "StepDescriptionTableViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        titleLabel.textColor = UIColor(named: "colorTesting")
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public func configure (title: String, description: String){
        self.titleLabel.text = title
        self.subtitleLabel.text = description
    }
    
}
