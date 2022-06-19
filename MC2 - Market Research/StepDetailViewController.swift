//
//  StepDetailViewController.swift
//  MC2 - Market Research
//
//  Created by Anastasia Agustine on 19/06/22.
//

import UIKit

class StepDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var table: UITableView!
    private var model = [Research]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        table.register(StepImageTableViewCell.nib(), forCellReuseIdentifier: StepImageTableViewCell.identifier)
        table.register(StepDescriptionTableViewCell.nib(), forCellReuseIdentifier: StepDescriptionTableViewCell.identifier)
        table.register(ToolsAndResourcesTableViewCell.nib(), forCellReuseIdentifier: ToolsAndResourcesTableViewCell.identifier)
        table.register(StepResultTableViewCell.nib(), forCellReuseIdentifier: StepResultTableViewCell.identifier)
        table.delegate = self
        table.dataSource = self
        table.separatorStyle = UITableViewCell.SeparatorStyle.none
    }
    
    //table functions
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: StepImageTableViewCell.identifier, for: indexPath) as! StepImageTableViewCell
            cell.configure(image: UIImage(named: "target")!)
            return cell
        } else if indexPath.row == 1 || indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: StepDescriptionTableViewCell.identifier, for: indexPath) as! StepDescriptionTableViewCell
            return cell
        } else if indexPath.row == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: ToolsAndResourcesTableViewCell.identifier, for: indexPath) as! ToolsAndResourcesTableViewCell
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: StepResultTableViewCell.identifier, for: indexPath) as! StepResultTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(model.count)
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 3 {
            return 150
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
