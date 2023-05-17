//
//  SummaryViewController.swift
//  AllCon
//
//  Created by YunD on 2022/05/10.
//

import UIKit

class SummaryViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        Summary.text = UserDefaults.standard.string(forKey: "synopsis")!
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var Summary: UILabel!
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
