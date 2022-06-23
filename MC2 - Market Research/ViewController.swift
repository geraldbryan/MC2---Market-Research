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
    private var filtered = [Research]()
    private var onGoing = [Research]()
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var prevTableView: UITableView!
    @IBOutlet var quoteImage: UIImageView!
    @IBOutlet var pageControl: UIPageControl!
    @IBOutlet var emptyOnGoing: UIView!
    @IBOutlet var emptyOnGoing2: UIView!
    @IBOutlet var emptyPrevious: UIView!
    @IBOutlet var emptyImage: UIImageView!
    @IBOutlet var emptyAll: UIView!
    @IBOutlet var emptyAllImage: UIImageView!
    
    let images = ["motivation2.png","motivation1.png","motivation3.png"]
    var indexTwo = 0
    var indexThree = 0
    
    override func viewDidAppear(_ animated: Bool) {
        getAllItems()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        
        emptyImage.image = UIImage(named: "empty_ongoing.png")
        emptyAllImage.image = UIImage(named: "empty_state.png")
        //deleteAllData("Research")
        
        // Image Carousel
        self.pageControl.numberOfPages = images.count
        self.pageControl.currentPage = 0
        let timers = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
        timers.fire()
        
        // Tableview - On going
        self.tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "item_cell")
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.allowsSelection = true
        
        // Tableview - Previous
        self.prevTableView.register(UINib(nibName: "previousTableViewCell", bundle: nil), forCellReuseIdentifier: "prev_cell")
        self.prevTableView.dataSource = self
        self.prevTableView.delegate = self
        
        // Fetching core data
        getAllItems()
        
//        deleteAllData("Research")
//        deleteAllData("Dummy")
//        deleteAllData("ResearchResult")
        
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
            
            self.filtered = models.filter{ $0.name == "Ali"}
            self.onGoing = models.filter{ $0.name != "Ali"}
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
            DispatchQueue.main.async {
                self.prevTableView.reloadData()
            }
            
            if onGoing.count == 0{
                emptyOnGoing.isHidden = false
                emptyOnGoing2.isHidden = false
            } else {
                emptyOnGoing.isHidden = true
                emptyOnGoing2.isHidden = true
            }
            
            if filtered.count == 0{
                emptyPrevious.isHidden = false
            } else {
                emptyPrevious.isHidden = true
            }
            
            if filtered.count == 0 && onGoing.count == 0 {
                emptyAll.isHidden = false
            } else {
                emptyAll.isHidden = true
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
            
            let model = onGoing.reversed()[indexPath.row]
            
            let formatter = DateFormatter()
            formatter.dateFormat = "MMM d, yyyy"
            
            let strDeadline = formatter.string(from: model.deadline ?? Date())
            
            cell.researchName?.text = model.id
            cell.researchObjective?.text = "Deadline: \(strDeadline)"
            
            return cell
            
        } else if tableView == prevTableView,
                  let cell = tableView.dequeueReusableCell(withIdentifier: "prev_cell") as? previousTableViewCell {
            
            let model = filtered.reversed()[indexPath.row]
            
            cell.researchName?.text = model.name
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count:Int?
        
        if tableView == self.tableView {
            if onGoing.count <= 2{
                count = onGoing.count
            } else {
                count = 2
            }
        }
        
        if tableView == self.prevTableView {
            if filtered.count <= 2 {
                count = filtered.count
            } else {
                count = 2
            }
        }
        
        return count!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var tinggi:CGFloat?
        
        if tableView == tableView{
            tinggi =  120
        }
        
        if tableView == prevTableView{
            tinggi = 80
        }
        
        return tinggi!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        if tableView == self.tableView{
            self.indexTwo = indexPath.row
            performSegue(withIdentifier: "klikCell", sender: self)
        } else {
            self.indexThree = indexPath.row
            performSegue(withIdentifier: "klikFinished", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "klikCell"{
            if let dest = segue.destination as? ResearchProgressController{
                
                dest.resName = onGoing.reversed()[indexTwo].name ?? "New Research"
                dest.resObj = onGoing.reversed()[indexTwo].objective ?? ""
                dest.resId = onGoing.reversed()[indexTwo].id ?? ""
                
            }
        } else {
            if let dest = segue.destination as? ResearchProgressController{
                
                dest.resName = filtered.reversed()[indexThree].name ?? "New Research"
                dest.resObj = filtered.reversed()[indexThree].objective ?? ""
                dest.resId = filtered.reversed()[indexThree].id ?? ""
                
            }
        }
    }
    @IBAction func tapOnGoing(){
        performSegue(withIdentifier: "onGoingSegue", sender: self)
    }
    
    @IBAction func tapPrev(){
        performSegue(withIdentifier: "prevSegue", sender: self)
    }
    
    @IBAction func newResc(){
        performSegue(withIdentifier: "newResSegue", sender: self)
    }
    
    @IBAction func newResearch(){
        performSegue(withIdentifier: "emptyNew", sender: self)
    }
    
}
