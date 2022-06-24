//
//  finishedResearchedViewController.swift
//  MC2 - Market Research
//
//  Created by Gerald Bryan on 16/06/22.
//

import UIKit

class finishedResearchedViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UINavigationControllerDelegate {
    
    var indexTwo = 0
    private var models = [Research]()
    private var finished = [Research]()
    
    @IBOutlet var finishedTable: UITableView!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Tableview

        self.navigationItem.largeTitleDisplayMode = .never
        self.title = " Finished Project"
        self.finishedTable.register(UINib(nibName: "finishedTableViewCell", bundle: nil), forCellReuseIdentifier: "fin_cell")
        self.finishedTable.dataSource = self
        self.finishedTable.delegate = self
        
        getAllItems()
        // Do any additional setup after loading the view.
    }
    
    func getAllItems(){
        do{
            models = try context.fetch(Research.fetchRequest())
            
            self.finished = models.filter{ $0.finished == "finish"}
            
            DispatchQueue.main.async {
                self.finishedTable.reloadData()
            }
            
        } catch{
            
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "fin_cell", for: indexPath) as! finishedTableViewCell
        let model = finished.reversed()[indexPath.row]

        cell.researchName?.text = model.name

        return cell
       
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return finished.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {

        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completionHandler) in

            let alert = UIAlertController(title: "Delete Research", message: "Are you sure you want to delete this research?", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Yes", style: .destructive, handler: { _ in

                let deleteObject = self.finished.reversed()[indexPath.row]
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
            performSegue(withIdentifier: "finToDetail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "finToDetail"{
            if let dest = segue.destination as? ResearchProgressController{
                
                dest.resName = finished.reversed()[indexTwo].name ?? "New Research"
                dest.resObj = finished.reversed()[indexTwo].objective ?? ""
                
            }
        }
    }
}
