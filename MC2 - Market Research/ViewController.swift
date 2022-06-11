//
//  ViewController.swift
//  MC2 - Market Research
//
//  Created by Gerald Bryan on 06/06/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    

    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "item_cell")
        self.tableView.dataSource = self
        self.tableView.delegate = self
        // Do any additional setup after loading the view

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "item_cell") as? TableViewCell {
                return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 120
        }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {

        return "On Going Research"
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
      if let headerView = view as? UITableViewHeaderFooterView {
          headerView.contentView.backgroundColor = .white
          headerView.textLabel?.textColor = .black
          headerView.textLabel?.font = UIFont.boldSystemFont(ofSize: 17)
      }
  }
    
}

