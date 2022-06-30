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
    
    // Initiate IBOutlet function
    @IBOutlet var resObj: UITextField!
    @IBOutlet var resName: UITextField!
    @IBOutlet var resDead: UIDatePicker!
    @IBOutlet var saveResearch: UIButton!
    
    // Core data configuration
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    // Initiate variable for passing data from home page
    var name: String = ""
    var objective: String = ""
    var deadline: Date = Date()
    var id: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // fetch item from core data
        getAllItems()
        
        // Make text field border rounded
        resObj.borderStyle = .roundedRect
        resName.borderStyle = .roundedRect
        
        // Logic for update the value of the research (if start neww then this logic is not triggered)
        if name != ""{
            self.resName.text = name
            self.resObj.text = objective
            self.resDead.date = deadline
        }
        
    }
    
    // Save button action in the new research page
    @IBAction func tapSaveButton(){
        // Logic for new research
        if name == ""{
            let newItem = Research(context: context)
            let idCount = Dummy(context: context)
            
            idCount.count = "initiate"
            newItem.name = resName.text
            newItem.objective = resObj.text
            newItem.deadline = resDead.date
            
            let identifier = countId.count
                newItem.id = String(identifier)
        } else{ // logic for update research
            let index = models.firstIndex(where: {$0.name == name})
            updateItem(item: models[index ?? 0], newName: resName.text ?? "New Research", newObjective: resObj.text ?? "No Objective", newDeadline: resDead.date)
        }
        
        do{
            try context.save()
            
            // Fetch all item in Research entity in core data
            getAllItems()
            
            // Trigger notification
            configureUserNotificationCenter()
            triggerNotification()
            
            // Perform segue to home menu
            performSegue(withIdentifier: "backToHome", sender: self)
        } catch{
            
        }
    }
    
    // function to fetch all item in Research entity in core data
    func getAllItems(){
        do{
            models = try context.fetch(Research.fetchRequest())
            countId = try context.fetch(Dummy.fetchRequest())
            
        } catch{
            
        }
    }
    
    // function to update Research entity in core data
    func updateItem(item:Research, newName:String, newObjective:String, newDeadline:Date){
        
        item.name = newName
        item.objective = newObjective
        item.deadline = newDeadline
        
        do{
            try context.save()
        } catch{
            
        }
        
    }
    
    // Notification
    let notificationCenter = UNUserNotificationCenter.current()
    
    func triggerNotification() {
            notificationCenter.getNotificationSettings { (notificationSettings) in
                switch notificationSettings.authorizationStatus {
                case .notDetermined:
                    self.requestAuthorization(completionHandler: { (success) in
                        guard success else { return }
                                            print("The application is allowed to display notifications")
                    })
                case .authorized:
                                    print("The application is allowed to display notifications")
                case .denied:
                    print("The application not allowed to display notifications")
                case .provisional:
                    print("The application authorized to post non-interruptive user notifications")
                case .ephemeral:
                    print("The application is temporarily authorized to post notifications. Only available to app clips.")
                @unknown default:
                    print("Application Not Allowed to Display Notifications")
                }
            }

       notificationCenter.getNotificationSettings { (notificationSettings) in
           switch notificationSettings.authorizationStatus {
           case .notDetermined:
               self.requestAuthorization(completionHandler: { (success) in
                   guard success else { return }
                   self.scheduleNotification()
               })
           case .authorized:
               self.scheduleNotification()
           case .denied:
               print("The application not allowed to display notifications")
           case .provisional:
               print("The application authorized to post non-interruptive user notifications")
           case .ephemeral:
               print("The application is temporarily authorized to post notifications. Only available to app clips.")
           @unknown default:
               print("Application Not Allowed to Display Notifications")
           }
       }
    }
    
    //triggering notification function
    private func scheduleNotification() {
        let content = UNMutableNotificationContent()
                content.title = "Your Research is Waiting"
                content.body = "Hi MARCH People! Don't forget to fill in the next step of your research. Remember business is moving so fast nowadays, finish your research ASAP! 🔥🔥"
                content.sound = UNNotificationSound.default
                content.badge = 2
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: (60*60*24), repeats: true)
        let identifier = "Local"
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
                notificationCenter.add(request) { (error) in
                    if let error = error {
                        print("Error \(error.localizedDescription)")
                    }
                }
    }
    
    // request authorization function
    private func requestAuthorization(completionHandler: @escaping (_ success: Bool) -> ()) {
            // Request Authorization
            notificationCenter.requestAuthorization(options: [.alert, .sound, .badge]) { (success, error) in
                if let error = error {
                    print("Request Authorization Failed (\(error), \(error.localizedDescription))")
                }
                completionHandler(success)
            }
        }
    
    private func configureUserNotificationCenter() {
    notificationCenter.delegate = self
            }
}

extension NewResearch: UNUserNotificationCenterDelegate {

    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.list, .banner])
    }

}
