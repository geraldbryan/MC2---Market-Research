//
//  ResearchProjectCell.swift
//  MC2 - Market Research
//
//  Created by Ali Asadillah on 13/06/22.
//

import UIKit

class ResearchProjectCell: UITableViewCell {

    @IBOutlet weak var researchStepName: UILabel!
    @IBOutlet weak var researchStepProgress: UILabel!
    @IBOutlet weak var researchStepImage: UIImageView!
    @IBOutlet weak var researchProjectView: UIView!
    let rp_cell = "rp_cell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //self.collectionView.dataSource = self
        //self.collectionView.delegate = self
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

        researchProjectView.layer.cornerRadius = 12
        researchProjectView.layer.masksToBounds = false
    }
}

//extension ResearchProjectCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    //func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ResearchProjectCell, for: IndexPath, for: indexPath as! rp_cell)
        
        //return cell
    //}
    
    //func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //return 5
    //}
//}
