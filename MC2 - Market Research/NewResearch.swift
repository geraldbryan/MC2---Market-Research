//
//  NewResearch.swift
//  MC2 - Market Research
//
//  Created by Gerald Bryan on 11/06/22.
//

import UIKit

class NewResearch: UIViewController {
    
    private var models = [Research]()
    
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
        
        resObj.borderStyle = .roundedRect
        resName.borderStyle = .roundedRect
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func changeDatePicker(){
        
        
    }
    
    @IBAction func tapSaveButton(){
        let newItem = Research(context: context)
        
        newItem.name = resName.text
        //newItem.objective = resObj.text
        newItem.deadline = resDead.date
        
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
