//
//  nameObjectiveCell.swift
//  MC2 - Market Research
//
//  Created by Ali Asadillah on 16/06/22.
//

import UIKit

class nameObjectiveCell: UITableViewCell {
    @IBOutlet weak var outsideResearchName : UIView!
    @IBOutlet weak var InsideResearchName : UIView!
    @IBOutlet weak var outsideObjectiveName : UIView!
    @IBOutlet weak var insideObjectiveName : UIView!
    @IBOutlet weak var researchNameIC : UILabel!
    @IBOutlet weak var researchObjIC : UILabel!
    let nameObj_cell = "nameObj_cell"
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

        outsideResearchName.layer.cornerRadius = 12
        outsideResearchName.layer.masksToBounds = false
        InsideResearchName.layer.cornerRadius = 12
        InsideResearchName.layer.masksToBounds = false
        outsideObjectiveName.layer.cornerRadius = 12
        outsideObjectiveName.layer.masksToBounds = false
        insideObjectiveName.layer.cornerRadius = 12
        insideObjectiveName.layer.masksToBounds = false
    }
    
}
