//
//  RegisterViewController.swift
//  AllCon
//
//  Created by YunD on 2022/05/29.
//

import UIKit

class RegisterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var IdText: UITextField!
    @IBOutlet weak var PwText: UITextField!
    
    var username: String = ""
    var password: String = ""
    var register: Int = 0
    
    @IBAction func Register(_ sender: Any) {
        username = IdText.text!
        password = PwText.text!
        Webservice().register(username: username, password: password){ result in
            switch result{
            case .success(let id):
                print(id)
                self.register = 1
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        sleep(1)
        if register==1 {
            
            self.navigationController?.popViewController(animated: true)
        }
        IdText.text = ""
        PwText.text = ""
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
