//
//  ResourcesViewController.swift
//  MC2 - Market Research
//
//  Created by Anastasia Agustine on 19/06/22.
//

import UIKit

class ResourcesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var resourceTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        resourceTable.register(ResourceHeadingTableViewCell.nib(), forCellReuseIdentifier: ResourceHeadingTableViewCell.identifier)
        resourceTable.delegate = self
        resourceTable.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    //table functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ResourceHeadingTableViewCell.identifier, for: indexPath)
        return cell
    }
    
}
