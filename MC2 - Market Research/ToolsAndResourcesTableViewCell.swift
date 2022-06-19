//
//  ToolsAndResourcesTableViewCell.swift
//  MC2 - Market Research
//
//  Created by Anastasia Agustine on 19/06/22.
//

import UIKit

class ToolsAndResourcesTableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate {
    
    static let identifier: String = "ToolsAndResourcesTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "ToolsAndResourcesTableViewCell", bundle: nil)
    }
    
    private var models = researchStep()
    @IBOutlet weak var toolCollectionView: UICollectionView!
    @IBOutlet weak var toolDetailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        toolCollectionView.register(ToolsAndResourcesCollectionViewCell.nib(), forCellWithReuseIdentifier: ToolsAndResourcesCollectionViewCell.identifier)
        toolCollectionView.delegate = self
        toolCollectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public func configure(with model: researchStep){
        self.models = model
        self.toolDetailLabel.text = model.resourceTools
        toolCollectionView.reloadData()
    }
    
    //Collection view functions
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ToolsAndResourcesCollectionViewCell.identifier, for: indexPath) as! ToolsAndResourcesCollectionViewCell
        cell.configure(image: models.imageVector!, name: models.stepName!)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout,sizeForItemAt indexPath: IndexPath) -> CGSize{
        return CGSize(width: 250, height: 250)
    }
    

    
}
