//
//  StepDetailViewController.swift
//  MC2 - Market Research
//
//  Created by Anastasia Agustine on 19/06/22.
//

import UIKit

class StepDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var finishButton: UIButton!
    var step = researchStep()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = step.stepName
        
        //register table cells
        table.register(StepImageTableViewCell.nib(), forCellReuseIdentifier: StepImageTableViewCell.identifier)
        table.register(StepDescriptionTableViewCell.nib(), forCellReuseIdentifier: StepDescriptionTableViewCell.identifier)
        table.register(ToolsAndResourcesTableViewCell.nib(), forCellReuseIdentifier: ToolsAndResourcesTableViewCell.identifier)
        table.register(StepResultTableViewCell.nib(), forCellReuseIdentifier: StepResultTableViewCell.identifier)
        
        //setting up table
        table.delegate = self
        table.dataSource = self
        table.separatorStyle = UITableViewCell.SeparatorStyle.none
        
    }
    
    //IBActions
    @IBAction func goBackToProgress(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    
    //table functions
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: StepImageTableViewCell.identifier, for: indexPath) as! StepImageTableViewCell
            cell.selectionStyle = .none
            if step.imageVector != nil {
                cell.stepImage.image = step.imageVector
            }
            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: StepDescriptionTableViewCell.identifier, for: indexPath) as! StepDescriptionTableViewCell
            cell.selectionStyle = .none
            if step.stepWhat != nil {
                cell.configure(title: (step.stepName ?? ""), description: (step.stepWhat ?? ""))
            }
            return cell
        } else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: StepDescriptionTableViewCell.identifier, for: indexPath) as! StepDescriptionTableViewCell
            cell.selectionStyle = .none
            if step.stepWhy != nil {
                cell.configure(title: "Why Important?", description: (step.stepWhy ?? ""))
            }
            return cell
        } else if indexPath.row == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: ToolsAndResourcesTableViewCell.identifier, for: indexPath) as! ToolsAndResourcesTableViewCell
            cell.delegate = self
            cell.selectionStyle = .none
            cell.configure(with: step)
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: StepResultTableViewCell.identifier, for: indexPath) as! StepResultTableViewCell
        cell.selectionStyle = .none
        cell.resultTextView.text = "Write your research results here..."
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 3 {
            return 220
        } else if indexPath.row == 0 {
            return 200
        } else {
            return UITableView.automaticDimension
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}

extension StepDetailViewController: TriggerCollectionViewDelegate{
    func getCellRow(_ cellIndex: Int) {
        performSegue(withIdentifier: "detailToResources", sender: self)
    }
}
