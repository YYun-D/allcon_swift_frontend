//
//  MyPageViewController.swift
//  AllCon
//
//  Created by YunD on 2022/05/26.
//

import UIKit

class MyPageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        Search1.setImage(UIImage(), for: .normal)
        Search2.setImage(UIImage(), for: .normal)
        Search3.setImage(UIImage(), for: .normal)
        Like1.setImage(UIImage(), for: .normal)
        Like2.setImage(UIImage(), for: .normal)
        Like3.setImage(UIImage(), for: .normal)
        Search1.isEnabled = false
        Search2.isEnabled = false
        Search3.isEnabled = false
        Like1.isEnabled = false
        Like2.isEnabled = false
        Like3.isEnabled = false
        
        taste = UserDefaults.standard.value(forKey: "tastelist") as! [String]
        if taste.contains("액션"){
            ActionButton.configuration = .filled()
            ActionButton.configuration?.title = "액션"
            ActionButton.configuration?.cornerStyle = .capsule
            ActionButton.configuration?.baseBackgroundColor = .systemGreen
        }
        else{
            ActionButton.configuration = .plain()
            ActionButton.configuration?.title = "액션"
            ActionButton.configuration?.cornerStyle = .capsule
            ActionButton.configuration?.background.strokeColor = .systemGreen
        }
        if taste.contains("로맨스"){
            RomanceButton.configuration = .filled()
            RomanceButton.configuration?.title = "로맨스"
            RomanceButton.configuration?.cornerStyle = .capsule
            RomanceButton.configuration?.baseBackgroundColor = .systemGreen
        }
        else{
            RomanceButton.configuration = .plain()
            RomanceButton.configuration?.title = "로맨스"
            RomanceButton.configuration?.cornerStyle = .capsule
            RomanceButton.configuration?.background.strokeColor = .systemGreen
        }
        if taste.contains("공포"){
            HorrorButton.configuration = .filled()
            HorrorButton.configuration?.title = "공포"
            HorrorButton.configuration?.cornerStyle = .capsule
            HorrorButton.configuration?.baseBackgroundColor = .systemGreen
        }
        else{
            HorrorButton.configuration = .plain()
            HorrorButton.configuration?.title = "공포"
            HorrorButton.configuration?.cornerStyle = .capsule
            HorrorButton.configuration?.background.strokeColor = .systemGreen
        }
        if taste.contains("코미디") {
            ComedyButton.configuration = .filled()
            ComedyButton.configuration?.title = "코미디"
            ComedyButton.configuration?.cornerStyle = .capsule
            ComedyButton.configuration?.baseBackgroundColor = .systemGreen
        }
        else{
            ComedyButton.configuration = .plain()
            ComedyButton.configuration?.title = "코미디"
            ComedyButton.configuration?.cornerStyle = .capsule
            ComedyButton.configuration?.background.strokeColor = .systemGreen
        }
        if taste.contains("가족"){
            KidsButton.configuration = .filled()
            KidsButton.configuration?.title = "가족"
            KidsButton.configuration?.cornerStyle = .capsule
            KidsButton.configuration?.baseBackgroundColor = .systemGreen
        }
        else{
            KidsButton.configuration = .plain()
            KidsButton.configuration?.title = "가족"
            KidsButton.configuration?.cornerStyle = .capsule
            KidsButton.configuration?.background.strokeColor = .systemGreen
        }
        if taste.contains("음악"){
            MusicalButton.configuration = .filled()
            MusicalButton.configuration?.title = "음악"
            MusicalButton.configuration?.cornerStyle = .capsule
            MusicalButton.configuration?.baseBackgroundColor = .systemGreen
        }
        else{
            MusicalButton.configuration = .plain()
            MusicalButton.configuration?.title = "음악"
            MusicalButton.configuration?.cornerStyle = .capsule
            MusicalButton.configuration?.background.strokeColor = .systemGreen
        }
        if taste.contains("애니메이션"){
            AnimationButton.configuration = .filled()
            AnimationButton.configuration?.title = "애니"
            AnimationButton.configuration?.cornerStyle = .capsule
            AnimationButton.configuration?.baseBackgroundColor = .systemGreen
        }
        else{
            AnimationButton.configuration = .plain()
            AnimationButton.configuration?.title = "애니"
            AnimationButton.configuration?.cornerStyle = .capsule
            AnimationButton.configuration?.background.strokeColor = .systemGreen
        }
        if taste.contains("판타지"){
            FantasyButton.configuration = .filled()
            FantasyButton.configuration?.title = "판타지"
            FantasyButton.configuration?.cornerStyle = .capsule
            FantasyButton.configuration?.baseBackgroundColor = .systemGreen
        }
        else{
            FantasyButton.configuration = .plain()
            FantasyButton.configuration?.title = "판타지"
            FantasyButton.configuration?.cornerStyle = .capsule
            FantasyButton.configuration?.background.strokeColor = .systemGreen
        }
        if taste.contains("SF"){
            EntertainmentButton.configuration = .filled()
            EntertainmentButton.configuration?.title = "SF"
            EntertainmentButton.configuration?.cornerStyle = .capsule
            EntertainmentButton.configuration?.baseBackgroundColor = .systemGreen
        }
        else{
            EntertainmentButton.configuration = .plain()
            EntertainmentButton.configuration?.title = "SF"
            EntertainmentButton.configuration?.cornerStyle = .capsule
            EntertainmentButton.configuration?.background.strokeColor = .systemGreen
        }
        if taste.contains("다큐멘터리"){
            DocumentaryButton.configuration = .filled()
            DocumentaryButton.configuration?.title = "다큐"
            DocumentaryButton.configuration?.cornerStyle = .capsule
            DocumentaryButton.configuration?.baseBackgroundColor = .systemGreen
        }
        else{
            DocumentaryButton.configuration = .plain()
            DocumentaryButton.configuration?.title = "다큐"
            DocumentaryButton.configuration?.cornerStyle = .capsule
            DocumentaryButton.configuration?.background.strokeColor = .systemGreen
        }
        var user = UserBody(id: 0, username: "", email: "", profile: Profile(likedMovies: "", searchedMovies: "", taste: ""))
        if let data = UserDefaults.standard.value(forKey: "user") as? Data{
            if let detail = try? JSONDecoder().decode(UserBody.self, from: data) {
                user = detail
                print(user)
            }
        }
        if user.profile.likedMovies != "[]"{
            var likemovie = user.profile.likedMovies.components(separatedBy: ["'","]","[",","])
            likemovie = likemovie.filter { $0 != "" }
            likemovie = likemovie.filter { $0 != " " }
            print(likemovie)
            if likemovie.count == 3 {
                let url = URL(string: "\(likemovie[2])")
                if let imagedata = try? Data(contentsOf: url!){
                Like1.setImage(
                    resizeImage(image: UIImage(data: imagedata)!, targetSize: .init(width: 150.0, height: 150.0)), for: .normal)
                }
                UserDefaults.standard.setValue(likemovie[1], forKey: "likemovie1url")
                UserDefaults.standard.setValue(likemovie[2], forKey: "likemovie1poster")
                Like1.isEnabled = true
            }
            else if likemovie.count == 6 {
                var url = URL(string: "\(likemovie[2])")
                if let imagedata = try? Data(contentsOf: url!){
                Like1.setImage(
                    resizeImage(image: UIImage(data: imagedata)!, targetSize: .init(width: 150.0, height: 150.0)), for: .normal)
                }
                url = URL(string: "\(likemovie[5])")
                if let imagedata = try? Data(contentsOf: url!){
                Like2.setImage(
                    resizeImage(image: UIImage(data: imagedata)!, targetSize: .init(width: 150.0, height: 150.0)), for: .normal)
                }
                UserDefaults.standard.setValue(likemovie[1], forKey: "likemovie1url")
                UserDefaults.standard.setValue(likemovie[2], forKey: "likemovie1poster")
                UserDefaults.standard.setValue(likemovie[4], forKey: "likemovie2url")
                UserDefaults.standard.setValue(likemovie[5], forKey: "likemovie2poster")
                Like1.isEnabled = true
                Like2.isEnabled = true
            }
            else {
                var url = URL(string: "\(likemovie[2])")
                if let imagedata = try? Data(contentsOf: url!){
                Like1.setImage(
                    resizeImage(image: UIImage(data: imagedata)!, targetSize: .init(width: 150.0, height: 150.0)), for: .normal)
                }
                url = URL(string: "\(likemovie[5])")
                if let imagedata = try? Data(contentsOf: url!){
                Like2.setImage(
                    resizeImage(image: UIImage(data: imagedata)!, targetSize: .init(width: 150.0, height: 150.0)), for: .normal)
                }
                url = URL(string: "\(likemovie[8])")
                if let imagedata = try? Data(contentsOf: url!){
                Like3.setImage(
                    resizeImage(image: UIImage(data: imagedata)!, targetSize: .init(width: 150.0, height: 150.0)), for: .normal)
                }
                UserDefaults.standard.setValue(likemovie[1], forKey: "likemovie1url")
                UserDefaults.standard.setValue(likemovie[2], forKey: "likemovie1poster")
                UserDefaults.standard.setValue(likemovie[4], forKey: "likemovie2url")
                UserDefaults.standard.setValue(likemovie[5], forKey: "likemovie2poster")
                UserDefaults.standard.setValue(likemovie[7], forKey: "likemovie3url")
                UserDefaults.standard.setValue(likemovie[8], forKey: "likemovie3poster")
                Like1.isEnabled = true
                Like2.isEnabled = true
                Like3.isEnabled = true
            }
        }
        if user.profile.searchedMovies != "[]"{
            var searchmovie = user.profile.searchedMovies.components(separatedBy: ["'","]","[",","])
            searchmovie = searchmovie.filter { $0 != "" }
            searchmovie = searchmovie.filter { $0 != " " }
            if searchmovie.count == 3 {
                let url = URL(string: "\(searchmovie[2])")
                if let imagedata = try? Data(contentsOf: url!){
                Search1.setImage(
                    resizeImage(image: UIImage(data: imagedata)!, targetSize: .init(width: 150.0, height: 150.0)), for: .normal)
                }
                UserDefaults.standard.setValue(searchmovie[1], forKey: "searchmovie1url")
                UserDefaults.standard.setValue(searchmovie[2], forKey: "searchmovie1poster")
                Search1.isEnabled = true
            }
            else if searchmovie.count == 6 {
                var url = URL(string: "\(searchmovie[2])")
                if let imagedata = try? Data(contentsOf: url!){
                    Search2.setImage(
                    resizeImage(image: UIImage(data: imagedata)!, targetSize: .init(width: 150.0, height: 150.0)), for: .normal)
                }
                url = URL(string: "\(searchmovie[5])")
                if let imagedata = try? Data(contentsOf: url!){
                    Search2.setImage(
                    resizeImage(image: UIImage(data: imagedata)!, targetSize: .init(width: 150.0, height: 150.0)), for: .normal)
                }
                UserDefaults.standard.setValue(searchmovie[1], forKey: "searchmovie1url")
                UserDefaults.standard.setValue(searchmovie[2], forKey: "searchmovie1poster")
                UserDefaults.standard.setValue(searchmovie[4], forKey: "searchmovie2url")
                UserDefaults.standard.setValue(searchmovie[5], forKey: "searchmovie2poster")
                Search1.isEnabled = true
                Search2.isEnabled = true
            }
            else {
                var url = URL(string: "\(searchmovie[2])")
                if let imagedata = try? Data(contentsOf: url!){
                    Search1.setImage(
                    resizeImage(image: UIImage(data: imagedata)!, targetSize: .init(width: 150.0, height: 150.0)), for: .normal)
                }
                url = URL(string: "\(searchmovie[5])")
                if let imagedata = try? Data(contentsOf: url!){
                    Search2.setImage(
                    resizeImage(image: UIImage(data: imagedata)!, targetSize: .init(width: 150.0, height: 150.0)), for: .normal)
                }
                url = URL(string: "\(searchmovie[8])")
                if let imagedata = try? Data(contentsOf: url!){
                    Search3.setImage(
                    resizeImage(image: UIImage(data: imagedata)!, targetSize: .init(width: 150.0, height: 150.0)), for: .normal)
                }
                UserDefaults.standard.setValue(searchmovie[1], forKey: "searchmovie1url")
                UserDefaults.standard.setValue(searchmovie[2], forKey: "searchmovie1poster")
                UserDefaults.standard.setValue(searchmovie[4], forKey: "searchmovie2url")
                UserDefaults.standard.setValue(searchmovie[5], forKey: "searchmovie2poster")
                UserDefaults.standard.setValue(searchmovie[7], forKey: "searchmovie3url")
                UserDefaults.standard.setValue(searchmovie[8], forKey: "searchmovie3poster")
                Search1.isEnabled = true
                Search2.isEnabled = true
                Search3.isEnabled = true
            }
        }
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var ActionButton: UIButton!
    @IBOutlet weak var RomanceButton: UIButton!
    @IBOutlet weak var HorrorButton: UIButton!
    @IBOutlet weak var ComedyButton: UIButton!
    @IBOutlet weak var KidsButton: UIButton!
    @IBOutlet weak var MusicalButton: UIButton!
    @IBOutlet weak var AnimationButton: UIButton!
    @IBOutlet weak var FantasyButton: UIButton!
    @IBOutlet weak var EntertainmentButton: UIButton!
    @IBOutlet weak var DocumentaryButton: UIButton!
    var taste: [String] = []
    
    @IBAction func Actiongenre(_ sender: Any) {
        if !taste.contains("액션"){
            ActionButton.configuration = .filled()
            ActionButton.configuration?.title = "액션"
            ActionButton.configuration?.cornerStyle = .capsule
            ActionButton.configuration?.background.strokeColor = .systemGreen
            taste.append("액션")
        }
        else{
            ActionButton.configuration = .plain()
            ActionButton.configuration?.title = "액션"
            ActionButton.configuration?.cornerStyle = .capsule
            ActionButton.configuration?.background.strokeColor = .systemGreen
            taste.remove(at: taste.firstIndex(of: "액션")!)
        }
    }
    
    @IBAction func Romancegenre(_ sender: Any) {
        if !taste.contains("로맨스"){
            RomanceButton.configuration = .filled()
            RomanceButton.configuration?.title = "로맨스"
            RomanceButton.configuration?.cornerStyle = .capsule
            RomanceButton.configuration?.background.strokeColor = .systemGreen
            taste.append("로맨스")
        }
        else{
            RomanceButton.configuration = .plain()
            RomanceButton.configuration?.title = "로맨스"
            RomanceButton.configuration?.cornerStyle = .capsule
            RomanceButton.configuration?.background.strokeColor = .systemGreen
            taste.remove(at: taste.firstIndex(of: "로맨스")!)
        }
    }
    
    @IBAction func Horrorgenre(_ sender: Any) {
        if !taste.contains("공포"){
            HorrorButton.configuration = .filled()
            HorrorButton.configuration?.title = "공포"
            HorrorButton.configuration?.cornerStyle = .capsule
            HorrorButton.configuration?.background.strokeColor = .systemGreen
            taste.append("공포")
        }
        else{
            HorrorButton.configuration = .plain()
            HorrorButton.configuration?.title = "공포"
            HorrorButton.configuration?.cornerStyle = .capsule
            HorrorButton.configuration?.background.strokeColor = .systemGreen
            taste.remove(at: taste.firstIndex(of: "공포")!)
        }
    }
    
    @IBAction func Comedygenre(_ sender: Any) {
        if !taste.contains("코미디") {
            ComedyButton.configuration = .filled()
            ComedyButton.configuration?.title = "코미디"
            ComedyButton.configuration?.cornerStyle = .capsule
            ComedyButton.configuration?.background.strokeColor = .systemGreen
            taste.append("코미디")
        }
        else{
            ComedyButton.configuration = .plain()
            ComedyButton.configuration?.title = "코미디"
            ComedyButton.configuration?.cornerStyle = .capsule
            ComedyButton.configuration?.background.strokeColor = .systemGreen
            taste.remove(at: taste.firstIndex(of: "코미디")!)
        }
    }
    
    @IBAction func Kidsgenre(_ sender: Any) {
        if !taste.contains("가족"){
            KidsButton.configuration = .filled()
            KidsButton.configuration?.title = "가족"
            KidsButton.configuration?.cornerStyle = .capsule
            KidsButton.configuration?.background.strokeColor = .systemGreen
            taste.append("가족")
        }
        else{
            KidsButton.configuration = .plain()
            KidsButton.configuration?.title = "가족"
            KidsButton.configuration?.cornerStyle = .capsule
            KidsButton.configuration?.background.strokeColor = .systemGreen
            taste.remove(at: taste.firstIndex(of: "가족")!)
        }
    }
    
    @IBAction func Musicalgenre(_ sender: Any) {
        if !taste.contains("음악"){
            MusicalButton.configuration = .filled()
            MusicalButton.configuration?.title = "음악"
            MusicalButton.configuration?.cornerStyle = .capsule
            MusicalButton.configuration?.background.strokeColor = .systemGreen
            taste.append("음악")
        }
        else{
            MusicalButton.configuration = .plain()
            MusicalButton.configuration?.title = "음악"
            MusicalButton.configuration?.cornerStyle = .capsule
            MusicalButton.configuration?.background.strokeColor = .systemGreen
            taste.remove(at: taste.firstIndex(of: "음악")!)
        }
    }
    
    @IBAction func Animationgenre(_ sender: Any) {
        if !taste.contains("애니메이션"){
            AnimationButton.configuration = .filled()
            AnimationButton.configuration?.title = "애니"
            AnimationButton.configuration?.cornerStyle = .capsule
            AnimationButton.configuration?.background.strokeColor = .systemGreen
            taste.append("애니메이션")
        }
        else{
            AnimationButton.configuration = .plain()
            AnimationButton.configuration?.title = "애니"
            AnimationButton.configuration?.cornerStyle = .capsule
            AnimationButton.configuration?.background.strokeColor = .systemGreen
            taste.remove(at: taste.firstIndex(of: "애니메이션")!)
        }
    }
    
    @IBAction func Fantasygenre(_ sender: Any) {
        if !taste.contains("판타지"){
            FantasyButton.configuration = .filled()
            FantasyButton.configuration?.title = "판타지"
            FantasyButton.configuration?.cornerStyle = .capsule
            FantasyButton.configuration?.background.strokeColor = .systemGreen
            taste.append("판타지")
        }
        else{
            FantasyButton.configuration = .plain()
            FantasyButton.configuration?.title = "판타지"
            FantasyButton.configuration?.cornerStyle = .capsule
            FantasyButton.configuration?.background.strokeColor = .systemGreen
            taste.remove(at: taste.firstIndex(of: "판타지")!)
        }
    }
    
    @IBAction func Entertainmentgenre(_ sender: Any) {
        if !taste.contains("SF"){
            EntertainmentButton.configuration = .filled()
            EntertainmentButton.configuration?.title = "SF"
            EntertainmentButton.configuration?.cornerStyle = .capsule
            EntertainmentButton.configuration?.background.strokeColor = .systemGreen
            taste.append("SF")
        }
        else{
            EntertainmentButton.configuration = .plain()
            EntertainmentButton.configuration?.title = "SF"
            EntertainmentButton.configuration?.cornerStyle = .capsule
            EntertainmentButton.configuration?.background.strokeColor = .systemGreen
            taste.remove(at: taste.firstIndex(of: "SF")!)
        }
    }
    
    
    @IBAction func Documentarygenre(_ sender: Any) {
        if !taste.contains("다큐멘터리"){
            DocumentaryButton.configuration = .filled()
            DocumentaryButton.configuration?.title = "다큐"
            DocumentaryButton.configuration?.cornerStyle = .capsule
            DocumentaryButton.configuration?.background.strokeColor = .systemGreen
            taste.append("다큐멘터리")
        }
        else{
            DocumentaryButton.configuration = .plain()
            DocumentaryButton.configuration?.title = "다큐"
            DocumentaryButton.configuration?.cornerStyle = .capsule
            DocumentaryButton.configuration?.background.strokeColor = .systemGreen
            taste.remove(at: taste.firstIndex(of: "다큐멘터리")!)
        }
    }
    
    @IBAction func ChangeTaste(_ sender: Any) {
        if !taste.isEmpty{
            let StringTaste = "\(taste)"
            UserDefaults.standard.setValue(StringTaste, forKey: "taste")
            UserDefaults.standard.setValue(taste, forKey: "tastelist")
            Webservice().puttaste()
            Webservice().tastemovie()
        }
        else{
            let alert = UIAlertController(title:"취향을 한 개 이상 선택해 주세요",message: "",
                preferredStyle: UIAlertController.Style.alert)
            let cancle = UIAlertAction(title: "확인", style: .default, handler: nil)
            alert.addAction(cancle)
            present(alert,animated: true,completion: nil)
            self.viewDidLoad()
        }
    }
    @IBOutlet weak var Search1: UIButton!
    @IBOutlet weak var Search2: UIButton!
    @IBOutlet weak var Search3: UIButton!
    @IBOutlet weak var Like1: UIButton!
    @IBOutlet weak var Like2: UIButton!
    @IBOutlet weak var Like3: UIButton!
    
    @IBAction func Searchview1(_ sender: Any) {
        let stringurl = UserDefaults.standard.string(forKey: "searchmovie1url")!
        UserDefaults.standard.setValue(UserDefaults.standard.string(forKey:"searchmovie1poster"), forKey: "poster")
        UserDefaults.standard.setValue(UserDefaults.standard.string(forKey:"searchmovie1url"), forKey: "movieurl")
        Webservice().detail(strurl: stringurl)
        let pushDV = self.storyboard?.instantiateViewController(withIdentifier: "DetailView")
        self.navigationController?.pushViewController(pushDV!, animated: true)
    }
    
    @IBAction func Searchview2(_ sender: Any) {
        let stringurl = UserDefaults.standard.string(forKey: "searchmovie2url")!
        UserDefaults.standard.setValue(UserDefaults.standard.string(forKey:"searchmovie2poster"), forKey: "poster")
        UserDefaults.standard.setValue(UserDefaults.standard.string(forKey:"searchmovie2url"), forKey: "movieurl")
        Webservice().detail(strurl: stringurl)
        let pushDV = self.storyboard?.instantiateViewController(withIdentifier: "DetailView")
        self.navigationController?.pushViewController(pushDV!, animated: true)
    }
    
    @IBAction func Searchview3(_ sender: Any) {
        let stringurl = UserDefaults.standard.string(forKey: "searchmovie3url")!
        UserDefaults.standard.setValue(UserDefaults.standard.string(forKey:"searchmovie3poster"), forKey: "poster")
        UserDefaults.standard.setValue(UserDefaults.standard.string(forKey:"searchmovie3url"), forKey: "movieurl")
        Webservice().detail(strurl: stringurl)
        let pushDV = self.storyboard?.instantiateViewController(withIdentifier: "DetailView")
        self.navigationController?.pushViewController(pushDV!, animated: true)
    }
    
    @IBAction func Likeview1(_ sender: Any) {
        let stringurl = UserDefaults.standard.string(forKey: "likemovie1url")!
        UserDefaults.standard.setValue(UserDefaults.standard.string(forKey:"likemovie1poster"), forKey: "poster")
        UserDefaults.standard.setValue(UserDefaults.standard.string(forKey:"likemovie1url"), forKey: "movieurl")
        Webservice().detail(strurl: stringurl)
        let pushDV = self.storyboard?.instantiateViewController(withIdentifier: "DetailView")
        self.navigationController?.pushViewController(pushDV!, animated: true)
    }
    
    @IBAction func Likeview2(_ sender: Any) {
        let stringurl = UserDefaults.standard.string(forKey: "likemovie2url")!
        UserDefaults.standard.setValue(UserDefaults.standard.string(forKey:"likemovie2poster"), forKey: "poster")
        UserDefaults.standard.setValue(UserDefaults.standard.string(forKey:"likemovie2url"), forKey: "movieurl")
        Webservice().detail(strurl: stringurl)
        let pushDV = self.storyboard?.instantiateViewController(withIdentifier: "DetailView")
        self.navigationController?.pushViewController(pushDV!, animated: true)
    }
    
    @IBAction func Likeview3(_ sender: Any) {
        let stringurl = UserDefaults.standard.string(forKey: "likemovie3url")!
        UserDefaults.standard.setValue(UserDefaults.standard.string(forKey:"likemovie3poster"), forKey: "poster")
        UserDefaults.standard.setValue(UserDefaults.standard.string(forKey:"likemovie3url"), forKey: "movieurl")
        Webservice().detail(strurl: stringurl)
        let pushDV = self.storyboard?.instantiateViewController(withIdentifier: "DetailView")
        self.navigationController?.pushViewController(pushDV!, animated: true)
    }
    @IBAction func Refresh(_ sender: Any) {
        Webservice().usercurrent()
        self.viewDidLoad()
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
