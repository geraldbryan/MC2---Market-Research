//
//  ResearchProgressController.swift
//  MC2 - Market Research
//
//  Created by Ali Asadillah on 13/06/22.
//

import UIKit
var researchPage = [researchStep]()
func initData() {



    // Append swot analysis into research page data
    researchPage.append(researchStep(stepName: "SWOT Analysis", stepWhy: "SWOT Analysis can help you to challenge risky assumptions and to uncover dangerous blindspots about your organization's performance. It will help you to develop exactly the right strategy for any situation.", stepWhat: "SWOT analysis is a technique for assessing the performance, competition, risk, and potential of a business, as well as part of a business such as a product line or division, an industry, or other entity.", resourceTools: "You can explore the resource and try to write your SWOT Analysis."))

    // Append target market analysis into research page data
    researchPage.append(researchStep(stepName: "Target Market Analysis", stepWhy: "Target market analysis will help businesses to stay competitive in the marketplace and achieve maximum profitability on niche market segments.", stepWhat: "Target market analysis is an assessment of how your product or service fits into a specific market and where it will gain the most traction with customers.", resourceTools: "You can explore and try at least one of these tools to analyze your target market."))

    // Append competitive analysis into research page data
    researchPage.append(researchStep(stepName: "Competitive Analysis", stepWhy: "A competitive analysis is a critical part of your company marketing plan. With this evaluation, you can establish what makes your product or service unique--and therefore what attributes you play up in order to attract your target market.", stepWhat: "Identifying your competitors and evaluating their strategies to determine their strengths and weaknesses relative to those of your own product or service.", resourceTools: "You can explore and try at least one of these tools to analyze your competitor."))

    // Append indetify trend into research page data
    researchPage.append(researchStep(stepName: "Identify Trend", stepWhy: "Identify trends will give you a wider variety of things to work with- therefore, you will be able to experiment with more things and use them to generate new ideas.", stepWhat: "Identifying a market trend analysis uncovers trends in both an industry and within a target market — the group of customers most likely to purchase from a company.", resourceTools: "You can explore and try at least one of these tools to analyze the market trends."))

    researchPage.append(researchStep(stepName: "Marketing Plan", stepWhy: "Marketing plan will help determine on how best to reach them and generate a positive return of investment from the total of marketing strategies spend. ", stepWhat: "Marketing plan is an advertising strategy that a business will implement to sell its product or service.", resourceTools: "You can explore the resource and try to write your SWOT Analysis."))

}



class ResearchProgressController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    @IBOutlet weak var researchProjectTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        initData()
        researchProjectTableView.register(UINib(nibName: "ResearchProjectCell", bundle: nil), forCellReuseIdentifier: "rp_cell")
        researchProjectTableView.dataSource = self
        researchProjectTableView.delegate = self

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        researchProjectTableView.rowHeight = 125
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "rp_cell", for: indexPath) as! ResearchProjectCell
        let model = researchPage[indexPath.row]
        cell.researchStepName.text = model.stepName
        cell.researchStepProgress.text = "test"
        cell.researchStepImage.image = UIImage(named: "SWOT.png")
        return cell
    }
    

    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
