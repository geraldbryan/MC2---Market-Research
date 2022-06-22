//
//  NewResearch.swift
//  MC2 - Market Research
//
//  Created by Gerald Bryan on 11/06/22.
//

import UIKit

class NewResearch: UIViewController {
    
    private var models = [Research]()
    private var countId = [Dummy]()
    
    @IBOutlet var resObj: UITextField!
    @IBOutlet var resName: UITextField!
    @IBOutlet var resDead: UIDatePicker!
    @IBOutlet var saveResearch: UIButton!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    

    let name: String = ""
    let objective: String = ""
    let deadline: Date = Date()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getAllItems()
        resObj.borderStyle = .roundedRect
        resName.borderStyle = .roundedRect
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func tapSaveButton(){
        let newItem = Research(context: context)
        let idCount = Dummy(context: context)
        
        idCount.count = "initiate"
        newItem.name = resName.text
        newItem.objective = resObj.text
        newItem.deadline = resDead.date
        
        let identifier = countId.count
        newItem.id = String(identifier)
        
        do{
            try context.save()
            getAllItems()
            performSegue(withIdentifier: "backToHome", sender: self)
        } catch{
            
        }
    }
    
    func getAllItems(){
        do{
            models = try context.fetch(Research.fetchRequest())
            countId = try context.fetch(Dummy.fetchRequest())
            
        } catch{
            
        }
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
