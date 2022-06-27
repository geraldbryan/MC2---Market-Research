//
//  StepDetailViewController.swift
//  MC2 - Market Research
//
//  Created by Anastasia Agustine on 19/06/22.
//

import UIKit
import CoreData

class StepDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    private var result = [ResearchResult]()
    
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var finishButton: UIButton!
    
    var step = researchStep()
    var resId = ""
    var stepResult: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
        
        getAllItems()
        self.title = step.stepName
        finishButton.isEnabled = false
        
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
        if let index = result.firstIndex(where: {$0.id == resId && $0.type == step.stepName}) {
            if let newResult = stepResult{
                updateItem(item: result[index], newResult: newResult)
                print(result[index])
            }
        } else {
            let newRes = ResearchResult(context: context)
            
            newRes.id = resId
            newRes.type = step.stepName
            newRes.result = stepResult
            
            do{
                try context.save()
                getAllItems()
            } catch{
            }
        }
        navigationController?.popViewController(animated: true)
    }
    
    
    //table functions
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: StepImageTableViewCell.identifier, for: indexPath) as! StepImageTableViewCell
            cell.selectionStyle = .none
            if step.imageVector != nil {
                cell.stepImage.image = step.imageColor
            }
            return cell
        }
        else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: StepDescriptionTableViewCell.identifier, for: indexPath) as! StepDescriptionTableViewCell
            cell.selectionStyle = .none
            if step.stepWhat != nil {
                cell.configure(title: (step.stepName ?? ""), description: (step.stepWhat ?? ""))
            }
            return cell
        }
        else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: StepDescriptionTableViewCell.identifier, for: indexPath) as! StepDescriptionTableViewCell
            cell.selectionStyle = .none
            if step.stepWhy != nil {
                cell.configure(title: "Why Important?", description: (step.stepWhy ?? ""))
            }
            return cell
        }
        else if indexPath.row == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: ToolsAndResourcesTableViewCell.identifier, for: indexPath) as! ToolsAndResourcesTableViewCell
            cell.delegate = self
            cell.selectionStyle = .none
            cell.configure(with: step)
            return cell
        }
        //result cell
        let cell = tableView.dequeueReusableCell(withIdentifier: StepResultTableViewCell.identifier, for: indexPath) as! StepResultTableViewCell
        if let index = result.firstIndex(where: {$0.id == resId && $0.type == step.stepName}){
            let model = result[index]
            cell.resultTextView.text = model.result
        } else {
            cell.resultTextView.text = "Write your research results here..."
        }

        cell.delegateStepResult = self
        cell.selectionStyle = .none

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
        
    
    //Core Data Functions
    func getAllItems(){
        do{
            result = try context.fetch(ResearchResult.fetchRequest())
        } catch{
            
        }
    }
    
    func updateItem(item: ResearchResult, newResult: String){
        item.result = newResult
        do {
            try context.save()
        } catch  {
            
        }
    }
}


//delegate
extension StepDetailViewController: TriggerCollectionViewDelegate{
    func getCellName(_ toolname: String) {
        let index = step.toolLists?.firstIndex(of: toolname) ?? 0
        
        if let referenceId = step.toolSegueId?[index] {
            performSegue(withIdentifier: referenceId, sender: self)
        } else {
            performSegue(withIdentifier: "detailToComingSoon", sender: self)
        }
    }
}

extension StepDetailViewController: StepResultTextViewDelegate{
    func textViewState(text: String) {
        if text.isEmpty{
            finishButton.isEnabled = false
        } else {
            finishButton.isEnabled = true
        }
        stepResult = text
    }
}
