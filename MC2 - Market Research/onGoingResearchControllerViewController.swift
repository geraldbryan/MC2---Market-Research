//
//  onGoingResearchControllerViewController.swift
//  MC2 - Market Research
//
//  Created by Gerald Bryan on 15/06/22.
//

import UIKit

class onGoingResearchControllerViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UINavigationControllerDelegate {
    var indexTwo = 0
    private var models = [Research]()
    private var onGoing = [Research]()
    private var result = [ResearchResult]()
    private var filterResult = [ResearchResult]()
    
    @IBOutlet var onGoingTable: UITableView!
    
    // Core data configuration
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidAppear(_ animated: Bool) {
        getAllItems()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "On Going Research"
        self.navigationItem.largeTitleDisplayMode = .never
        // Tableview
        self.onGoingTable.register(UINib(nibName: "onGoingTableViewCell", bundle: nil), forCellReuseIdentifier: "onGoing_cell")
        self.onGoingTable.dataSource = self
        self.onGoingTable.delegate = self
        
        getAllItems()
        // Do any additional setup after loading the view.
    }
    
    // Core data funtion
    func getAllItems(){
        do{
            models = try context.fetch(Research.fetchRequest())
            result = try context.fetch(ResearchResult.fetchRequest())
            
            self.onGoing = models.filter{ $0.name != "Ali"}
            
            DispatchQueue.main.async {
                self.onGoingTable.reloadData()
            }
            
        } catch{
            
        }
    }
    
    // Table view funtion
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "onGoing_cell", for: indexPath) as! onGoingTableViewCell
        let model = onGoing.reversed()[indexPath.row]

        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, yyyy"

        let strDeadline = formatter.string(from: model.deadline!)

        cell.researchName?.text = model.name
        cell.researchObjective?.text = "Deadline: \(strDeadline)"
        
        filterResult = result.filter{ $0.id == model.id}
        cell.progress?.progress = Float(filterResult.count) / Float(5)
        
        let progStr = String(round((Float(filterResult.count) / Float(5)) * Float(100)))
        cell.progressText?.text = "\(progStr)%"

        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return onGoing.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 126
    }
    
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
      if let headerView = view as? UITableViewHeaderFooterView {
          headerView.contentView.backgroundColor = .white
          headerView.textLabel?.textColor = .black
          headerView.textLabel?.font = UIFont.boldSystemFont(ofSize: 17)
      }
  }

    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {

        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completionHandler) in

            let alert = UIAlertController(title: "Delete Research", message: "Are you sure you want to delete this research?", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Yes", style: .destructive, handler: { _ in

                let deleteObject = self.onGoing.reversed()[indexPath.row]
                self.context.delete(deleteObject)

                do
                {
                    try self.context.save()
                    self.getAllItems()
                }

                catch
                {

                }
            }))

            alert.addAction(UIAlertAction(title: "No", style: .default, handler: { _ in
                alert.dismiss(animated: true)
            }))

            self.present(alert, animated: true)
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
            self.indexTwo = indexPath.row
            performSegue(withIdentifier: "onGoingToDetail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "onGoingToDetail"{
            if let dest = segue.destination as? ResearchProgressController{
                
                dest.resName = onGoing.reversed()[indexTwo].name ?? "New Research"
                dest.resObj = onGoing.reversed()[indexTwo].objective ?? ""
                dest.resId = onGoing.reversed()[indexTwo].id ?? ""
                
            }
        }
    }


}
