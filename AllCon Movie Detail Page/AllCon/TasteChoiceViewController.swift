//
//  TasteChoiceViewController.swift
//  AllCon
//
//  Created by YunD on 2022/05/30.
//

import UIKit

class TasteChoiceViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var Action: UIButton!
    @IBOutlet weak var Romance: UIButton!
    @IBOutlet weak var Horror: UIButton!
    @IBOutlet weak var Comedy: UIButton!
    @IBOutlet weak var Kids: UIButton!
    @IBOutlet weak var Musical: UIButton!
    @IBOutlet weak var Animation: UIButton!
    @IBOutlet weak var Fantasy: UIButton!
    @IBOutlet weak var Entertainment: UIButton!
    @IBOutlet weak var Documentary: UIButton!
    var taste: [String] = []
    
    
    @IBAction func ActionClick(_ sender: Any) {
        if taste.contains("액션") {
            Action.alpha = 0.5
            taste.remove(at: taste.firstIndex(of: "액션")!)
        }
        else {
            Action.alpha = 1
            taste.append("액션")
        }
    }
    @IBAction func RomanceClick(_ sender: Any) {
        if taste.contains("로맨스") {
            Romance.alpha = 0.5
            taste.remove(at: taste.firstIndex(of: "로맨스")!)
        }
        else {
            Romance.alpha = 1
            taste.append("로맨스")
        }
    }
    @IBAction func HorrorClick(_ sender: Any) {
        if taste.contains("공포") {
            Horror.alpha = 0.5
            taste.remove(at: taste.firstIndex(of: "공포")!)
        }
        else {
            Horror.alpha = 1
            taste.append("공포")
        }
    }
    @IBAction func ComedyClick(_ sender: Any) {
        if taste.contains("코미디") {
            Comedy.alpha = 0.5
            taste.remove(at: taste.firstIndex(of: "코미디")!)
        }
        else {
            Comedy.alpha = 1
            taste.append("코미디")
        }
    }
    @IBAction func KidsClick(_ sender: Any) {
        if taste.contains("가족") {
            Kids.alpha = 0.5
            taste.remove(at: taste.firstIndex(of: "가족")!)
        }
        else {
            Kids.alpha = 1
            taste.append("가족")
        }
    }
    @IBAction func MusicalClick(_ sender: Any) {
        if taste.contains("음악") {
            Musical.alpha = 0.5
            taste.remove(at: taste.firstIndex(of: "음악")!)
        }
        else {
            Musical.alpha = 1
            taste.append("음악")
        }
    }
    @IBAction func AnimationClick(_ sender: Any) {
        if taste.contains("애니메이션") {
            Animation.alpha = 0.5
            taste.remove(at: taste.firstIndex(of: "애니메이션")!)
        }
        else {
            Animation.alpha = 1
            taste.append("애니메이션")
        }
    }
    @IBAction func FantasyClick(_ sender: Any) {
        if taste.contains("판타지") {
            Fantasy.alpha = 0.5
            taste.remove(at: taste.firstIndex(of: "판타지")!)
        }
        else {
            Fantasy.alpha = 1
            taste.append("판타지")
        }
    }
    @IBAction func EntertainmentClick(_ sender: Any) {
        if taste.contains("SF") {
            Entertainment.alpha = 0.5
            taste.remove(at: taste.firstIndex(of: "SF")!)
        }
        else {
            Entertainment.alpha = 1
            taste.append("SF")
        }
    }
    @IBAction func DocumentaryClick(_ sender: Any) {
        if taste.contains("다큐멘터리") {
            Documentary.alpha = 0.5
            taste.remove(at: taste.firstIndex(of: "다큐멘터리")!)
        }
        else {
            Documentary.alpha = 1
            taste.append("다큐멘터리")
        }
    }
    
    @IBAction func Submit(_ sender: Any) {
        if !taste.isEmpty {
            let pushTB = self.storyboard?.instantiateViewController(withIdentifier: "TabBar")
            self.navigationController?.pushViewController(pushTB!, animated: true)
            let StringTaste = "\(taste)"
            UserDefaults.standard.setValue(StringTaste, forKey: "taste")
            UserDefaults.standard.setValue(taste, forKey: "tastelist")
            Webservice().puttaste()
            Webservice().tastemovie()
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
