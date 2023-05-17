//
//  SearchViewController.swift
//  AllCon
//
//  Created by YunD on 2022/06/05.
//

import UIKit

class SearchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func SearchButton(_ sender: Any) {
        Movie1.setImage(UIImage(), for: .normal)
        Movie2.setImage(UIImage(), for: .normal)
        Movie3.setImage(UIImage(), for: .normal)
        Movie4.setImage(UIImage(), for: .normal)
        Movie5.setImage(UIImage(), for: .normal)
        Movie6.setImage(UIImage(), for: .normal)
        Movie7.setImage(UIImage(), for: .normal)
        Movie8.setImage(UIImage(), for: .normal)
        Movie9.setImage(UIImage(), for: .normal)
        
        if (Search.text != nil){
            Webservice().search(searchname: Search.text!)
            var SearchList = SearchValueList()
            if let data = UserDefaults.standard.value(forKey: "searchlist") as? Data{
                if let movielist = try? JSONDecoder().decode(SearchValueList.self, from: data) {
                    SearchList = movielist
                }
            }
            
            var url: URL?
            
            if (SearchList["0"] != nil){
                url = URL(string: "\(SearchList["0"]!.url)")
                if let imagedata = try? Data(contentsOf: url!){
                Movie1.setImage(
                    resizeImage(image: UIImage(data: imagedata)!, targetSize: .init(width: 150.0, height: 150.0)), for: .normal)
                }
                UserDefaults.standard.setValue(SearchList["0"]!.href, forKey: "SearchMovie1")
                UserDefaults.standard.setValue(SearchList["0"]!.url, forKey: "SearchMovie1Poster")
            }
            
            else{
                let alert = UIAlertController(title:"검색결과가 없습니다.",message: "",
                    preferredStyle: UIAlertController.Style.alert)
                let cancle = UIAlertAction(title: "확인", style: .default, handler: nil)
                alert.addAction(cancle)
                present(alert,animated: true,completion: nil)
            }
            if (SearchList["1"] != nil){
                url = URL(string: "\(SearchList["1"]!.url)")
                if let imagedata = try? Data(contentsOf: url!){
                Movie2.setImage(
                        resizeImage(image: UIImage(data: imagedata)!, targetSize: .init(width: 150.0, height: 150.0)), for: .normal)
                }
                UserDefaults.standard.setValue(SearchList["1"]!.href, forKey: "SearchMovie2")
                UserDefaults.standard.setValue(SearchList["1"]!.url, forKey: "SearchMovie2Poster")
            }
            if (SearchList["2"] != nil){
                url = URL(string: "\(SearchList["2"]!.url)")
                if let imagedata = try? Data(contentsOf: url!){
                Movie3.setImage(
                    resizeImage(image: UIImage(data: imagedata)!, targetSize: .init(width: 150.0, height: 150.0)), for: .normal)
                }
                UserDefaults.standard.setValue(SearchList["2"]!.href, forKey: "SearchMovie3")
                UserDefaults.standard.setValue(SearchList["2"]!.url, forKey: "SearchMovie3Poster")
            }
            if (SearchList["3"] != nil) {
                url = URL(string: "\(SearchList["3"]!.url)")
                if let imagedata = try? Data(contentsOf: url!){
                Movie4.setImage(
                    resizeImage(image: UIImage(data: imagedata)!, targetSize: .init(width: 150.0, height: 150.0)), for: .normal)
                }
                UserDefaults.standard.setValue(SearchList["3"]!.href, forKey: "SearchMovie4")
                UserDefaults.standard.setValue(SearchList["3"]!.url, forKey: "SearchMovie4Poster")
            }
            if (SearchList["4"] != nil) {
                url = URL(string: "\(SearchList["4"]!.url)")
                if let imagedata = try? Data(contentsOf: url!){
                Movie5.setImage(
                    resizeImage(image: UIImage(data: imagedata)!, targetSize: .init(width: 150.0, height: 150.0)), for: .normal)
                }
                UserDefaults.standard.setValue(SearchList["4"]!.href, forKey: "SearchMovie5")
                UserDefaults.standard.setValue(SearchList["4"]!.url, forKey: "SearchMovie5Poster")
            }
            if (SearchList["5"] != nil) {
                url = URL(string: "\(SearchList["5"]!.url)")
                if let imagedata = try? Data(contentsOf: url!){
                Movie6.setImage(
                    resizeImage(image: UIImage(data: imagedata)!, targetSize: .init(width: 150.0, height: 150.0)), for: .normal)
                }
                UserDefaults.standard.setValue(SearchList["5"]!.href, forKey: "SearchMovie6")
                UserDefaults.standard.setValue(SearchList["5"]!.url, forKey: "SearchMovie6Poster")
            }
            if (SearchList["6"] != nil) {
                url = URL(string: "\(SearchList["6"]!.url)")
                if let imagedata = try? Data(contentsOf: url!){
                Movie7.setImage(
                    resizeImage(image: UIImage(data: imagedata)!, targetSize: .init(width: 150.0, height: 150.0)), for: .normal)
                }
                UserDefaults.standard.setValue(SearchList["6"]!.href, forKey: "SearchMovie7")
                UserDefaults.standard.setValue(SearchList["6"]!.url, forKey: "SearchMovie7Poster")
            }
            if (SearchList["7"] != nil) {
                url = URL(string: "\(SearchList["7"]!.url)")
                if let imagedata = try? Data(contentsOf: url!){
                Movie8.setImage(
                    resizeImage(image: UIImage(data: imagedata)!, targetSize: .init(width: 150.0, height: 150.0)), for: .normal)
                }
                UserDefaults.standard.setValue(SearchList["7"]!.href, forKey: "SearchMovie8")
                UserDefaults.standard.setValue(SearchList["7"]!.url, forKey: "SearchMovie8Poster")
            }
            if (SearchList["8"] != nil){
                url = URL(string: "\(SearchList["8"]!.url)")
                if let imagedata = try? Data(contentsOf: url!){
                Movie9.setImage(
                    resizeImage(image: UIImage(data: imagedata)!, targetSize: .init(width: 150.0, height: 150.0)), for: .normal)
                }
                UserDefaults.standard.setValue(SearchList["8"]!.href, forKey: "SearchMovie9")
                UserDefaults.standard.setValue(SearchList["8"]!.url, forKey: "SearchMovie9Poster")
            }
        }
        else{
            let alert = UIAlertController(title:"검색할 영화를 적어주세요",message: "",
                preferredStyle: UIAlertController.Style.alert)
            let cancle = UIAlertAction(title: "확인", style: .default, handler: nil)
            alert.addAction(cancle)
            present(alert,animated: true,completion: nil)
        }
        Search.text = ""
    }
    
    @IBOutlet weak var Search: UITextField!
    @IBOutlet weak var Movie1: UIButton!
    @IBOutlet weak var Movie2: UIButton!
    @IBOutlet weak var Movie3: UIButton!
    @IBOutlet weak var Movie4: UIButton!
    @IBOutlet weak var Movie5: UIButton!
    @IBOutlet weak var Movie6: UIButton!
    @IBOutlet weak var Movie7: UIButton!
    @IBOutlet weak var Movie8: UIButton!
    @IBOutlet weak var Movie9: UIButton!
    
    @IBAction func searchmovie1(_ sender: Any) {
        let stringurl = UserDefaults.standard.string(forKey: "SearchMovie1")!
        UserDefaults.standard.setValue(UserDefaults.standard.string(forKey: "SearchMovie1Poster"), forKey: "poster")
        UserDefaults.standard.setValue(UserDefaults.standard.string(forKey:"SearchMovie1"), forKey: "movieurl")
        Webservice().detail(strurl: stringurl)
        let pushDV = self.storyboard?.instantiateViewController(withIdentifier: "DetailView")
        self.navigationController?.pushViewController(pushDV!, animated: true)
    }
    
    @IBAction func searchmovie2(_ sender: Any) {
        let stringurl = UserDefaults.standard.string(forKey: "SearchMovie2")!
        UserDefaults.standard.setValue(UserDefaults.standard.string(forKey: "SearchMovie2Poster"), forKey: "poster")
        UserDefaults.standard.setValue(UserDefaults.standard.string(forKey:"SearchMovie2"), forKey: "movieurl")
        Webservice().detail(strurl: stringurl)
        let pushDV = self.storyboard?.instantiateViewController(withIdentifier: "DetailView")
        self.navigationController?.pushViewController(pushDV!, animated: true)
    }
    
    @IBAction func searchmovie3(_ sender: Any) {
        let stringurl = UserDefaults.standard.string(forKey: "SearchMovie3")!
        UserDefaults.standard.setValue(UserDefaults.standard.string(forKey: "SearchMovie3Poster"), forKey: "poster")
        UserDefaults.standard.setValue(UserDefaults.standard.string(forKey:"SearchMovie3"), forKey: "movieurl")
        Webservice().detail(strurl: stringurl)
        let pushDV = self.storyboard?.instantiateViewController(withIdentifier: "DetailView")
        self.navigationController?.pushViewController(pushDV!, animated: true)
    }
    
    @IBAction func searchmovie4(_ sender: Any) {
        let stringurl = UserDefaults.standard.string(forKey: "SearchMovie4")!
        UserDefaults.standard.setValue(UserDefaults.standard.string(forKey: "SearchMovie4Poster"), forKey: "poster")
        UserDefaults.standard.setValue(UserDefaults.standard.string(forKey:"SearchMovie4"), forKey: "movieurl")
        Webservice().detail(strurl: stringurl)
        let pushDV = self.storyboard?.instantiateViewController(withIdentifier: "DetailView")
        self.navigationController?.pushViewController(pushDV!, animated: true)
    }
    
    @IBAction func searchmovie5(_ sender: Any) {
        let stringurl = UserDefaults.standard.string(forKey: "SearchMovie5")!
        UserDefaults.standard.setValue(UserDefaults.standard.string(forKey: "SearchMovie5Poster"), forKey: "poster")
        UserDefaults.standard.setValue(UserDefaults.standard.string(forKey:"SearchMovie5"), forKey: "movieurl")
        Webservice().detail(strurl: stringurl)
        let pushDV = self.storyboard?.instantiateViewController(withIdentifier: "DetailView")
        self.navigationController?.pushViewController(pushDV!, animated: true)
    }
    
    @IBAction func searchmovie6(_ sender: Any) {
        let stringurl = UserDefaults.standard.string(forKey: "SearchMovie6")!
        UserDefaults.standard.setValue(UserDefaults.standard.string(forKey: "SearchMovie6Poster"), forKey: "poster")
        UserDefaults.standard.setValue(UserDefaults.standard.string(forKey:"SearchMovie6"), forKey: "movieurl")
        Webservice().detail(strurl: stringurl)
        let pushDV = self.storyboard?.instantiateViewController(withIdentifier: "DetailView")
        self.navigationController?.pushViewController(pushDV!, animated: true)
    }
    
    @IBAction func searchmovie7(_ sender: Any) {
        let stringurl = UserDefaults.standard.string(forKey: "SearchMovie7")!
        UserDefaults.standard.setValue(UserDefaults.standard.string(forKey: "SearchMovie7Poster"), forKey: "poster")
        UserDefaults.standard.setValue(UserDefaults.standard.string(forKey:"SearchMovie7"), forKey: "movieurl")
        Webservice().detail(strurl: stringurl)
        let pushDV = self.storyboard?.instantiateViewController(withIdentifier: "DetailView")
        self.navigationController?.pushViewController(pushDV!, animated: true)
    }
    
    @IBAction func searchmovie8(_ sender: Any) {
        let stringurl = UserDefaults.standard.string(forKey: "SearchMovie8")!
        UserDefaults.standard.setValue(UserDefaults.standard.string(forKey: "SearchMovie8Poster"), forKey: "poster")
        UserDefaults.standard.setValue(UserDefaults.standard.string(forKey:"SearchMovie8"), forKey: "movieurl")
        Webservice().detail(strurl: stringurl)
        let pushDV = self.storyboard?.instantiateViewController(withIdentifier: "DetailView")
        self.navigationController?.pushViewController(pushDV!, animated: true)
    }
    
    @IBAction func searchmovie9(_ sender: Any) {
        let stringurl = UserDefaults.standard.string(forKey: "SearchMovie9")!
        UserDefaults.standard.setValue(UserDefaults.standard.string(forKey: "SearchMovie9Poster"), forKey: "poster")
        UserDefaults.standard.setValue(UserDefaults.standard.string(forKey:"SearchMovie9"), forKey: "movieurl")
        Webservice().detail(strurl: stringurl)
        let pushDV = self.storyboard?.instantiateViewController(withIdentifier: "DetailView")
        self.navigationController?.pushViewController(pushDV!, animated: true)
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
