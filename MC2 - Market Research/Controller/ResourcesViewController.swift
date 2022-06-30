//
//  ResourcesViewController.swift
//  MC2 - Market Research
//
//  Created by Anastasia Agustine on 19/06/22.
//

import UIKit

class ResourcesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var resourceTable: UITableView!
    @IBOutlet weak var resourcesCit: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.largeTitleDisplayMode = .never
        self.title = "Resource Page"

        resourcesCit.text = "Source: https://www.investopedia.com/terms/s/swot.asp"
        
        resourceTable.register(ResourceHeadingTableViewCell.nib(), forCellReuseIdentifier: ResourceHeadingTableViewCell.identifier)
        resourceTable.register(ResourceOneParagraphTableViewCell.nib(), forCellReuseIdentifier: ResourceOneParagraphTableViewCell.identifier)
        
        resourceTable.delegate = self
        resourceTable.dataSource = self
        resourceTable.separatorStyle = .none
        resourceTable.allowsSelection = false
        // Do any additional setup after loading the view.
    }
    
    //table functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: ResourceOneParagraphTableViewCell.identifier, for: indexPath) as! ResourceOneParagraphTableViewCell
            cell.configure(title: "Strengths", text: "Strengths describe what the business excels at and what separates it from the competition: a strong brand, loyal customer base, a strong balance sheet, unique technology, and so on.")
            return cell
        } else if indexPath.row == 2{
            let cell = tableView.dequeueReusableCell(withIdentifier: ResourceOneParagraphTableViewCell.identifier, for: indexPath) as! ResourceOneParagraphTableViewCell
            cell.configure(title: "Weaknesses", text: "Weaknesses stop the business from performing at its optimum level. They are areas where the business needs to improve to remain competitive: a weak brand, higher-than-average turnover, high levels of debt, an inadequate supply chain, or lack of capital.")
            return cell
        } else if indexPath.row == 3{
            let cell = tableView.dequeueReusableCell(withIdentifier: ResourceOneParagraphTableViewCell.identifier, for: indexPath) as! ResourceOneParagraphTableViewCell
            cell.configure(title: "Opportunities", text: "Opportunities refer to favorable external factors that could give an organization a competitive advantage.")
            return cell
        } else if indexPath.row == 4{
            let cell = tableView.dequeueReusableCell(withIdentifier: ResourceOneParagraphTableViewCell.identifier, for: indexPath) as! ResourceOneParagraphTableViewCell
            cell.configure(title: "Threats", text: "Threats refer to factors that have the potential to harm an organization.")
            return cell
        } else if indexPath.row == 5{
            let cell = tableView.dequeueReusableCell(withIdentifier: ResourceOneParagraphTableViewCell.identifier, for: indexPath) as! ResourceOneParagraphTableViewCell
            cell.configure(title: "How Do You Write a Good SWOT Analysis?", text: "Creating a SWOT analysis involves identifying and analyzing the strengths, weaknesses, opportunities, and threats of a company. It is recommended to first create a list of questions to answer for each element. The questions serve as a guide for completing the SWOT analysis and creating a balanced list. The SWOT framework can be constructed in list format, as free text, or, most commonly, as a 4-cell table, with quadrants dedicated to each element. Strengths and weaknesses are listed first, followed by opportunities and threats.")
            return cell
        } else if indexPath.row == 6{
            let cell = tableView.dequeueReusableCell(withIdentifier: ResourceOneParagraphTableViewCell.identifier, for: indexPath) as! ResourceOneParagraphTableViewCell
            cell.configure(title: "SWOT Analysis Examples", text: "Home Depot conducted a SWOT analysis, creating a balanced list of its internal advantages and disadvantages and external factors threatening its market position and growth strategy. High-quality customer service, strong brand recognition, and positive relationships with suppliers were some of its notable strengths; whereas, a constricted supply chain, interdependence on the U.S. market, and a replicable business model were listed as its weaknesses. Closely related to its weaknesses, Home Depot's threats were the presence of close rivals, available substitutes, and the condition of the U.S. market. It found from this study and other analysis that expanding its supply chain and global footprint would be key to its growth.")
            return cell
        }

        let cell = tableView.dequeueReusableCell(withIdentifier: ResourceHeadingTableViewCell.identifier, for: indexPath) as! ResourceHeadingTableViewCell
        cell.resourceTitleLabel.text = "SWOT Analysis"
        cell.resourceImageLabel.text = "Photo by: unsplash"
        cell.headingParagraph.text = "SWOT analysis is a technique for assessing the performance, competition, risk, and potential of a business, as well as part of a business such as a product line or division, an industry, or other entity. Using internal and external data, the technique can guide businesses toward strategies more likely to be successful, and away from those in which they have been, or are likely to be, less successful. Independent SWOT analysis, investors, or competitors can also guide them on whether a company, product line, or industry might be strong or weak and why."
        cell.resourceHeadingImage.image = UIImage(named: "swot_analysis.png")
        return cell
    }
    
}
