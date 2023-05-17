//
//  LoginViewController.swift
//  AllCon
//
//  Created by YunD on 2022/05/28.
//

import UIKit
import Foundation

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var ID: UITextField!
    
    @IBOutlet weak var PassWord: UITextField!
    
    var username: String = ""
    var password: String = ""
    var login: Int = 0
    
    @IBAction func Login(_ sender: Any) {
        username = ID.text!
        password = PassWord.text!
        let pushTB = self.storyboard?.instantiateViewController(withIdentifier: "TabBar")
        
        let pushTC = self.storyboard?.instantiateViewController(withIdentifier: "TasteChoice")
        let defaults = UserDefaults.standard
        Webservice().login(username: username, password: password){ [self] result in
            switch result{
            case .success(let token):
                login = 1
                defaults.setValue(token, forKey: "jsonwebtoken")
                defaults.setValue(self.username, forKey: "username")
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        sleep(1)
        if login==1 {
            Webservice().currentuser(){ result in
                switch result{
                case .success(_):
                    if let savedata = defaults.object(forKey: "user") as? Data {
                        if let save = try? JSONDecoder().decode(UserBody.self,from: savedata){
                            print(save.profile.taste)
                            if save.profile.taste == "[]"{
                                self.navigationController?.pushViewController(pushTC!, animated: true)
                            }
                            else{
                                var tastelist = save.profile.taste.components(separatedBy: [" ","'","]","[",","])
                                tastelist = tastelist.filter { $0 != "" }
                                UserDefaults.standard.setValue(tastelist, forKey: "tastelist")
                                UserDefaults.standard.setValue("\(tastelist)", forKey: "taste")
                                Webservice().tastemovie()
                                self.navigationController?.pushViewController(pushTB!, animated: true)
                                
                            }
                        }
                    }
                    
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
        else{
            let alert = UIAlertController(title:"아이디 또는 비밀번호가 일치하지 않습니다",message: "",
                preferredStyle: UIAlertController.Style.alert)
            let cancle = UIAlertAction(title: "확인", style: .default, handler: nil)
            alert.addAction(cancle)
            present(alert,animated: true,completion: nil)
        }
        ID.text = ""
        PassWord.text = ""
        login = 0
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
