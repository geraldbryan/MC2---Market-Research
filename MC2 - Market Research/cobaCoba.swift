//
//  cobaCoba.swift
//  MC2 - Market Research
//
//  Created by Gerald Bryan on 16/06/22.
//

import UIKit

class cobaCoba: UIViewController {
    
    @IBOutlet weak var nama:UILabel!
    @IBOutlet weak var obj:UILabel!
    
    var resName = ""
    var resObj = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nama.text = resName
        obj.text = resObj
        // Do any additional setup after loading the view.
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
