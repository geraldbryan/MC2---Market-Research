//
//  previousTableViewCell.swift
//  MC2 - Market Research
//
//  Created by Gerald Bryan on 14/06/22.
//

import UIKit

class previousTableViewCell: UITableViewCell {
        
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

        // just use the layer's shadow... adding the Bezier
        //let shadowPath = UIBezierPath(roundedRect: innerView.bounds, cornerRadius: cornerRadius)
        //innerView.layer.shadowPath = shadowPath.cgPath

        uiView.layer.cornerRadius = 12
        uiView.layer.masksToBounds = false
}
    
}
