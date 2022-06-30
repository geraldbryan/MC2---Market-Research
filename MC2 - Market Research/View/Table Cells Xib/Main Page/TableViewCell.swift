//
//  TableViewCell.swift
//  MC2 - Market Research
//
//  Created by Gerald Bryan on 11/06/22.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet var researchName: UILabel!
    @IBOutlet var researchObjective: UILabel!
    @IBOutlet var innerView: UIView!
    @IBOutlet var progress: UIProgressView!
    @IBOutlet var progressText: UILabel!
    
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

        innerView.layer.cornerRadius = 12
        innerView.layer.masksToBounds = false
        
        
        progress.layer.cornerRadius = progress.layer.shadowOffset.height/2
        self.progress.clipsToBounds = true
        // Set the rounded edge for the inner bar
        self.layer.sublayers![1].cornerRadius = 12
        self.subviews[1].clipsToBounds = true
        
        progress.layer.borderColor = .init(red: 77, green: 90, blue: 130, alpha: 100)
        //progress.transform = progress.transform.scaledBy(x: 1, y: 2)
        var transform : CGAffineTransform = CGAffineTransform(scaleX: 1.0, y: 4.0)
        progress.transform = transform
}


}
