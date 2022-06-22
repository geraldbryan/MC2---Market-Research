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
    researchPage.append(researchStep(stepName: "SWOT Analysis", stepWhy: "SWOT Analysis can help you to challenge risky assumptions and to uncover dangerous blindspots about your organization's performance. It will help you to develop exactly the right strategy for any situation.", stepWhat: "SWOT analysis is a technique for assessing the performance, competition, risk, and potential of a business, as well as part of a business such as a product line or division, an industry, or other entity.", resourceTools: "You can explore the resource and try to write your SWOT Analysis.", imageVector: UIImage(named: "swot_vector.png"), imageColor: UIImage(named: "swot.png"), toolLists: ["SWOT Analysis"], toolSegueId: ["detailToSwotTool"]))

    // Append target market analysis into research page data
    researchPage.append(researchStep(stepName: "Target Market Analysis", stepWhy: "Target market analysis will help businesses to stay competitive in the marketplace and achieve maximum profitability on niche market segments.", stepWhat: "Target market analysis is an assessment of how your product or service fits into a specific market and where it will gain the most traction with customers.", resourceTools: "You can explore and try at least one of these tools to analyze your target market.",imageVector: UIImage(named: "target_vector.png"),imageColor: UIImage(named: "target.png"), toolLists: ["User Persona", "Demographic Analysis"], toolSegueId: ["detailToUserPersonaTool", "detailToDemographicTool"]))

    // Append competitive analysis into research page data
    researchPage.append(researchStep(stepName: "Competitive Analysis", stepWhy: "A competitive analysis is a critical part of your company marketing plan. With this evaluation, you can establish what makes your product or service unique--and therefore what attributes you play up in order to attract your target market.", stepWhat: "Identifying your competitors and evaluating their strategies to determine their strengths and weaknesses relative to those of your own product or service.", resourceTools: "You can explore and try at least one of these tools to analyze your competitor.", imageVector: UIImage(named: "competitor_vector.png"), imageColor: UIImage(named: "competitor.png")))

    // Append indetify trend into research page data
    researchPage.append(researchStep(stepName: "Identify Trend", stepWhy: "Identify trends will give you a wider variety of things to work with- therefore, you will be able to experiment with more things and use them to generate new ideas.", stepWhat: "Identifying a market trend analysis uncovers trends in both an industry and within a target market — the group of customers most likely to purchase from a company.", resourceTools: "You can explore and try at least one of these tools to analyze the market trends.", imageVector: UIImage(named: "trends_vector.png"), imageColor: UIImage(named: "trends.png")))

    researchPage.append(researchStep(stepName: "Marketing Plan", stepWhy: "Marketing plan will help determine on how best to reach them and generate a positive return of investment from the total of marketing strategies spend. ", stepWhat: "Marketing plan is an advertising strategy that a business will implement to sell its product or service.", resourceTools: "You can explore and try at least one of these tools to analyze your target market.", imageVector: UIImage(named: "marketing_vector.png"), imageColor: UIImage(named: "marketing.png")))

}


class ResearchProgressController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate  {
    
    var resName = ""
    var resObj = ""
    
    @IBOutlet weak var researchProjectTableView: UITableView!

    @IBOutlet weak var finishButton: UIButton!
    
    @IBAction func finishButtonAction(_ sender: UIButton) {
//        for i in researchProjectTableView{
//
//        }
            
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        if researchProjectTableView.cellForRow(at: 0)?.backgroundColor == UIColor(red: 206/255, green: 229/255, blue: 214/255, alpha: 1){
//
//        }
        finishButton.tintColor = UIColor(named: "colorTesting")?.withAlphaComponent(0.2)
        finishButton.isEnabled = false
        self.navigationItem.largeTitleDisplayMode = .never
        self.title = "Research Project"

        
        initData()
        researchProjectTableView.register(UINib(nibName: "ResearchProjectCell", bundle: nil), forCellReuseIdentifier: "rp_cell")
        researchProjectTableView.register(UINib(nibName: "nameObjectiveCell", bundle: nil), forCellReuseIdentifier: "nameObj_cell")
        researchProjectTableView.dataSource = self
        researchProjectTableView.delegate = self

    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "nameObj_cell", for: indexPath) as! nameObjectiveCell
            cell.researchNameIC.text = resName
            cell.researchObjIC.text = resObj
            return cell
        }
        //researchProjectTableView.rowHeight = 169
        let cell = tableView.dequeueReusableCell(withIdentifier: "rp_cell", for: indexPath) as! ResearchProjectCell
        let model = researchPage[indexPath.row-1]
        cell.researchStepName.text = model.stepName
        cell.researchStepImage.image = model.imageVector
        cell.researchProgress.image = UIImage(named: "notStarted.png")
        //cell.researchProgress.image = UIImage.
        if model.stepName == "SWOT Analysis"{
            cell.researchProjectView.backgroundColor = UIColor(red: 206/255, green: 229/255, blue: 214/255, alpha: 1)
            cell.researchProgress.image = UIImage(named: "done.png")
        }
        else if model.stepName == "Target Market Analysis"{
            cell.researchProjectView.backgroundColor = UIColor(red: 248/255, green: 220/255, blue: 200/255, alpha: 1)
            cell.researchProgress.image = UIImage(named: "onProgress.png")
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var height : CGFloat
        if indexPath.row == 0 {
            height = 190
        }else {
            height = 140
        }
        return height
        }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row > 0 {
            performSegue(withIdentifier: "ProgressToStepDetail", sender: self)
        }
    }
    
    
    
    //segue prepare
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ProgressToStepDetail" {
            if let newVC = segue.destination as? StepDetailViewController {
                let index = researchProjectTableView.indexPathForSelectedRow
                newVC.step = researchPage[index!.row-1]
            }
        }
    }

}
