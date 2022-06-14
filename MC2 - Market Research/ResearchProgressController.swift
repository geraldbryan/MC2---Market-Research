//
//  ResearchProgressController.swift
//  MC2 - Market Research
//
//  Created by Ali Asadillah on 13/06/22.
//

import UIKit

class ResearchProgressController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    @IBOutlet weak var researchProjectTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        researchProjectTableView.register(UINib(nibName: "ResearchProjectCell", bundle: nil), forCellReuseIdentifier: "rp_cell")
        researchProjectTableView.dataSource = self
        researchProjectTableView.delegate = self
        

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //researchProjectTableView.rowHeight = view.frame.height
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "rp_cell", for: indexPath) as! ResearchProjectCell
        cell.researchStepName.text = "test"
        cell.researchStepProgress.text = "test"
        return cell
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
