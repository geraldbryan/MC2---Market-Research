//
//  ViewController.swift
//  MC2 - Market Research
//
//  Created by Gerald Bryan on 06/06/22.
//

import UIKit
import Foundation
import CoreData


class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // Core data configuration
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    private var models = [Research]()
    var filtered = [Research]()
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var prevTableView: UITableView!
    @IBOutlet var quoteImage: UIImageView!
    @IBOutlet var pageControl: UIPageControl!
    
    let images = ["motivation2.png","motivation1.png","motivation3.png"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        
        // Image Carousel
        self.pageControl.numberOfPages = images.count
        self.pageControl.currentPage = 0
        let timers = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
        timers.fire()

        // Tableview - On going
        self.tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "item_cell")
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        // Tableview - Previous
        self.prevTableView.register(UINib(nibName: "previousTableViewCell", bundle: nil), forCellReuseIdentifier: "prev_cell")
        self.prevTableView.dataSource = self
        self.prevTableView.delegate = self
        
        // Fetching core data
        getAllItems()
        
        //deleteAllData("Research")
        
        // Do any additional setup after loading the view

    }
    
    var index = 0
    @objc func update()  {
        index = index + 1

        if index >= images.count {
            index = 0
        }
        quoteImage.image = UIImage(named: images[index])
        pageControl.currentPage = index
    }
    
    //delete all research data
    func deleteAllData(_ entity:String) {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
        fetchRequest.returnsObjectsAsFaults = false
        do {
            let results = try context.fetch(fetchRequest)
            for object in results {
                guard let objectData = object as? NSManagedObject else {continue}
                context.delete(objectData)
                do{
                    try context.save()
                } catch{
                    
                }
            }
        } catch let error {
            print("Detele all data in \(entity) error :", error)
        }
    }
    
    // Segue Function
    @objc func addItem()
    {
        self.performSegue(withIdentifier: "newResearch", sender: self)
    }
    
    // Core data funtion
    func getAllItems(){
        do{
            models = try context.fetch(Research.fetchRequest())
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
            DispatchQueue.main.async {
                self.prevTableView.reloadData()
            }
            
        } catch{
            
        }
    }
    
    func deleteItem(item:Research){
        context.delete(item)
        
        do{
            try context.save()
        } catch{
            
        }
    }
    
    
    func updateItem(item:Research, newName:String, newObjective:String, newDeadline:Date){
        
        item.name = newName
        item.objective = newObjective
        item.deadline = newDeadline
        
        do{
            try context.save()
        } catch{
            
        }
        
    }
    
    // Table view funtion
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == tableView,
                let cell = tableView.dequeueReusableCell(withIdentifier: "item_cell") as? TableViewCell {
                let model = models.reversed()[indexPath.row]
        
                let formatter = DateFormatter()
                formatter.dateFormat = "MMM d, yyyy"
        
                let strDeadline = formatter.string(from: model.deadline!)
        
                cell.researchName?.text = model.name
                cell.researchObjective?.text = "Deadline: \(strDeadline)"
        
                return cell
            
            } else if tableView == prevTableView,
                let cell = tableView.dequeueReusableCell(withIdentifier: "prev_cell") as? previousTableViewCell {
                
                self.filtered = models.filter{ $0.name == "Ali"}
        
                let model = filtered.reversed()[indexPath.row]
        
                cell.researchName?.text = model.name
        
                return cell
            }
//        let cell = tableView.dequeueReusableCell(withIdentifier: "item_cell", for: indexPath) as! TableViewCell
//
//        self.filtered = models.filter{ $0.name == "Ali"}
//
//        let model = models.reversed()[indexPath.row]
//
//        let formatter = DateFormatter()
//        formatter.dateFormat = "MMM d, yyyy"
//
//        let strDeadline = formatter.string(from: model.deadline!)
//
//        cell.researchName?.text = model.name
//        cell.researchObjective?.text = "Deadline: \(strDeadline)"
//
//        return cell
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 97
        }
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//
//        return "On Going Research"
//    }
    
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
                
                let deleteObject = self.models[indexPath.row]
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
    
//    // Table view funtion
//    func TableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "prev_cell", for: indexPath) as! previousTableViewCell
//
//        self.filtered = models.filter{ $0.name == "Ali"}
//
//        let model = filtered.reversed()[indexPath.row]
//
//        let formatter = DateFormatter()
//        formatter.dateFormat = "MMM d, yyyy"
//
//        let strDeadline = formatter.string(from: model.deadline!)
//
//        cell.researchName?.text = model.name
//
//        return cell
//    }
//
//    func TableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 2
//
//    }
//
//    func TableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//
//        return 97
//        }
    
    
}

