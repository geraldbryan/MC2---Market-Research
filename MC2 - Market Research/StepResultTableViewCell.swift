//
//  StepResultTableViewCell.swift
//  MC2 - Market Research
//
//  Created by Anastasia Agustine on 19/06/22.
//

import UIKit

class StepResultTableViewCell: UITableViewCell {

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var resultTextView: UITextView!
    
    static var identifier: String = "StepResultTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "StepResultTableViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        resultLabel.textColor = UIColor(named: "colorTesting")
        resultTextView.layer.borderWidth = 0.4
        resultTextView.layer.cornerRadius = 10
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
