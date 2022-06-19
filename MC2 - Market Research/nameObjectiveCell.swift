//
//  nameObjectiveCell.swift
//  MC2 - Market Research
//
//  Created by Ali Asadillah on 16/06/22.
//

import UIKit

class nameObjectiveCell: UITableViewCell {
    @IBOutlet weak var InsideResearchName : UIView!
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
        researchNameIC.numberOfLines = 0
        researchNameIC.lineBreakMode = .byWordWrapping
        self.researchNameIC.sizeToFit()
        self.researchNameIC.layoutIfNeeded()
        
        researchObjIC.numberOfLines = 0
        researchObjIC.lineBreakMode = .byWordWrapping
        self.researchObjIC.sizeToFit()
        self.researchObjIC.layoutIfNeeded()
        

        // Research Name
        InsideResearchName.layer.cornerRadius = 12
        InsideResearchName.layer.masksToBounds = false
        InsideResearchName.layer.borderWidth = 1
        InsideResearchName.layer.borderColor = UIColor(red: 77/255, green: 90/255, blue: 130/255, alpha: 1).cgColor
        
        // Research objectives
        insideObjectiveName.layer.cornerRadius = 12
        insideObjectiveName.layer.masksToBounds = false
        insideObjectiveName.layer.borderWidth = 1
        insideObjectiveName.layer.borderColor = UIColor(red: 77/255, green: 90/255, blue: 130/255, alpha: 1).cgColor
    }
    
}
