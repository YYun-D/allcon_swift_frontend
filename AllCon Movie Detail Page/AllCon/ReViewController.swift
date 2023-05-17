//
//  ReViewController.swift
//  
//
//  Created by YunD on 2022/05/10.
//

import UIKit
import Cosmos

class ReViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var ReviewContent: UITextView!
    @IBOutlet weak var Star: CosmosView!
    
    @IBAction func SubmitButtonAction(_ sender: Any) {
        if ReviewContent.text==""{
            let alert = UIAlertController(title:"리뷰내용을 작성하세요.",message: "",
                preferredStyle: UIAlertController.Style.alert)
            let cancle = UIAlertAction(title: "확인", style: .default, handler: nil)
            alert.addAction(cancle)
            present(alert,animated: true,completion: nil)
        }
        else {
            Webservice().moviereviewwrite(Reviewcontent: ReviewContent.text, ReviewStar: Int(Star.rating), movieid: UserDefaults.standard.integer(forKey: "movieid"))
            self.navigationController?.popViewController(animated: true)
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
