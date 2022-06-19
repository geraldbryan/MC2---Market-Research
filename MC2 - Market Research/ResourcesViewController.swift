//
//  ResourcesViewController.swift
//  MC2 - Market Research
//
//  Created by Anastasia Agustine on 19/06/22.
//

import UIKit

class ResourcesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var resourceTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        resourceTable.register(ResourceHeadingTableViewCell.nib(), forCellReuseIdentifier: ResourceHeadingTableViewCell.identifier)
        resourceTable.delegate = self
        resourceTable.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    //table functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ResourceHeadingTableViewCell.identifier, for: indexPath) as! ResourceHeadingTableViewCell
        cell.resourceTitleLabel.text = "SWOT Analysis"
        cell.resourceImageLabel.text = "Photo by: unsplash"
        cell.headingParagraph.text = "SWOT analysis is a technique for assessing the performance, competition, risk, and potential of a business, as well as part of a business such as a product line or division, an industry, or other entity. Using internal and external data, the technique can guide businesses toward strategies more likely to be successful, and away from those in which they have been, or are likely to be, less successful. Independent SWOT analysis, investors, or competitors can also guide them on whether a company, product line, or industry might be strong or weak and why."
        return cell
    }
    
}
