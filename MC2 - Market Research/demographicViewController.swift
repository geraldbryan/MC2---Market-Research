//
//  demographicViewController.swift
//  MC2 - Market Research
//
//  Created by Gerald Bryan on 21/06/22.
//

import UIKit

class demographicViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var resourceTable: UITableView!
    @IBOutlet weak var resourcesCit: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resourcesCit.text = "Source: https://extension.psu.edu/understanding-your-customers-how-demographics-and-psychographics-can-help"
        
        resourceTable.register(ResourceHeadingTableViewCell.nib(), forCellReuseIdentifier: ResourceHeadingTableViewCell.identifier)
        resourceTable.register(ResourceOneParagraphTableViewCell.nib(), forCellReuseIdentifier: ResourceOneParagraphTableViewCell.identifier)
        
        resourceTable.delegate = self
        resourceTable.dataSource = self
        resourceTable.separatorStyle = .none
        // Do any additional setup after loading the view.
    }
    
    //table functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: ResourceOneParagraphTableViewCell.identifier, for: indexPath) as! ResourceOneParagraphTableViewCell
            cell.configure(title: "Demographic: Generation", text: "Terms, such a 'Gen X,' 'Generation Jones,' and 'Baby Boomers', were created as a way of classifying 'a group of individuals, most of whom are the same approximate age, having similar ideas, problems, attitudes, etc.'. Marketers have discovered that they can often work with producers and retailers to provide goods and services that would appeal to a majority of members of a particular generation, based on the general needs and wants of consumers within the group.")
            return cell
        } else if indexPath.row == 2{
            let cell = tableView.dequeueReusableCell(withIdentifier: ResourceOneParagraphTableViewCell.identifier, for: indexPath) as! ResourceOneParagraphTableViewCell
            cell.configure(title: "Demographic: Ethnicity", text: "For the past several years, the population of certain ethnic groups has increased, particularly those who are of Asian and Hispanic or Latino descents. These changes present opportunities for many agricultural businesses. It is necessary for agricultural businesses to understand that within the Asian ethnic group, that those of Chinese, Korean, and Japanese descent will have different languages and cultures. The same is true for groups within the Hispanic ethnic group.")
            return cell
        } else if indexPath.row == 3{
            let cell = tableView.dequeueReusableCell(withIdentifier: ResourceOneParagraphTableViewCell.identifier, for: indexPath) as! ResourceOneParagraphTableViewCell
            cell.configure(title: "Demographics: Income", text: "Disposable income (or net income) is the amount of money that an individual has available to pay for expenses minus taxes and deductions. Discretionary income is the amount of money that remains after consumers pay for 'needs' (food, rent/mortgage, insurance, etc.) that are required to sustain a reasonable livelihood. In general, the higher the level of net income the greater the amount of discretionary income that would be available for a consumer to purchase 'wants,' or items not necessary to maintain their life but rather their lifestyle.")
            return cell
        } else if indexPath.row == 4{
            let cell = tableView.dequeueReusableCell(withIdentifier: ResourceOneParagraphTableViewCell.identifier, for: indexPath) as! ResourceOneParagraphTableViewCell
            cell.configure(title: "Demographics: Geographical", text: "The location where a consumer lives can greatly influence his or her needs, wants, and access to goods and services. Cultural 'tastes' and traditions can affect food preparation, ingredients commonly used, and availability of specialty cuisine.")
            return cell
        } else if indexPath.row == 5{
            let cell = tableView.dequeueReusableCell(withIdentifier: ResourceOneParagraphTableViewCell.identifier, for: indexPath) as! ResourceOneParagraphTableViewCell
            cell.configure(title: "Demographics: Homeownership", text: "Knowing the level of homeownership within a market area is particularly important for businesses that sell plants, vegetable seeds, and lawn and garden services. Consumers who are homeowners may be more willing than renters to: a) invest in the establishment and upkeep of their lawn and garden and b) purchase outdoor plant material and landscape services.")
            return cell
        }

        let cell = tableView.dequeueReusableCell(withIdentifier: ResourceHeadingTableViewCell.identifier, for: indexPath) as! ResourceHeadingTableViewCell
        cell.resourceTitleLabel.text = "Demographic Analysis"
        cell.resourceImageLabel.text = "Photo by: unsplash"
        cell.headingParagraph.text = "Demographics describe who we are as individuals, for example: ethnicity, age/generation, gender, income, marital status, education, and homeownership. These and other characteristics categorize us without describing our personality. Many demographic characteristics cannot be changed and are directly related to our physical being."
        cell.resourceHeadingImage.image = UIImage(named: "demographic.png")
        return cell
    }
    
}
