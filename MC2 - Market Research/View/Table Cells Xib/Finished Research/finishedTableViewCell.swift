//
//  finishedTableViewCell.swift
//  MC2 - Market Research
//
//  Created by Gerald Bryan on 16/06/22.
//

import UIKit

class finishedTableViewCell: UITableViewCell {
    @IBOutlet weak var researchName: UILabel!
    @IBOutlet weak var uiView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    override func layoutSubviews() {

        uiView.layer.cornerRadius = 12
        uiView.layer.masksToBounds = false
    }
}
