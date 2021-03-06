//
//  ToolsAndResourcesCollectionViewCell.swift
//  MC2 - Market Research
//
//  Created by Anastasia Agustine on 19/06/22.
//

import UIKit

class ToolsAndResourcesCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var toolImageView: UIImageView!
    @IBOutlet weak var toolLabel: UILabel!
    
    static let identifier: String = "ToolsAndResourcesCollectionViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "ToolsAndResourcesCollectionViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.layer.borderColor = UIColor(named: "colorTesting")?.cgColor
        self.layer.cornerRadius = 8
        self.layer.borderWidth = 1
    }

    public func configure(image: UIImage, name: String){
//        toolImageView.image = image
        toolImageView.image = image
        toolLabel.text = name
    }
}

