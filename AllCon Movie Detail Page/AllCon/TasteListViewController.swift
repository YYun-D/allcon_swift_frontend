//
//  SearchViewController.swift
//  AllCon
//
//  Created by YunD on 2022/06/02.
//

import UIKit

class TasteListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        if let username = UserDefaults.standard.string(forKey: "username"){
            userna.text = "    \(username)님을 위한"
        }
        var TasteMovieList = MovieList(netflix: Netflix(movie: ["0": The0(title: "", url: "", photo: "")]
                                                    , program: ["0": The0(title: "", url: "", photo: "")]), watcha: ["0": The0(title: "", url: "", photo: "")], recommend: Recommend(the0: The0(title: "", url: "", photo: ""), the1: The0(title: "", url: "", photo: ""), the2: The0(title: "", url: "", photo: ""), the3: The0(title: "", url: "", photo: ""), the4: The0(title: "", url: "", photo: ""), the5: The0(title: "", url: "", photo: ""), the6: The0(title: "", url: "", photo: ""), the7: The0(title: "", url: "", photo: ""), the8: The0(title: "", url: "", photo: ""), the9: The0(title: "", url: "", photo: ""), the10: The0(title: "", url: "", photo: ""), the11: The0(title: "", url: "", photo: ""), the12: The0(title: "", url: "", photo: ""), the13: The0(title: "", url: "", photo: ""), the14: The0(title: "", url: "", photo: ""), the15: The0(title: "", url: "", photo: ""), the16: The0(title: "", url: "", photo: ""), the17: The0(title: "", url: "", photo: ""), the18: The0(title: "", url: "", photo: ""), the19: The0(title: "", url: "", photo: ""), the20: The0(title: "", url: "", photo: ""), the21: The0(title: "", url: "", photo: ""), the22: The0(title: "", url: "", photo: ""), the23: The0(title: "", url: "", photo: ""), the24: The0(title: "", url: "", photo: ""), the25: The0(title: "", url: "", photo: ""), the26: The0(title: "", url: "", photo: ""), the27: The0(title: "", url: "", photo: ""), the28: The0(title: "", url: "", photo: ""), the29: The0(title: "", url: "", photo: ""), genre: [""]))
        
        if let data = UserDefaults.standard.value(forKey: "movielist") as? Data{
            if let movielist = try? JSONDecoder().decode(MovieList.self, from: data) {
                TasteMovieList = movielist
            }
        }
        var url = URL(string: "\(TasteMovieList.recommend.the0.photo)")
        if let imagedata = try? Data(contentsOf: url!){
        Movie1.setImage(
            resizeImage(image: UIImage(data: imagedata)!, targetSize: .init(width: 150.0, height: 150.0)), for: .normal)
        }
        UserDefaults.standard.setValue(TasteMovieList.recommend.the0.url, forKey: "TasteMovie1")
        UserDefaults.standard.setValue(TasteMovieList.recommend.the0.photo, forKey: "TasteMovie1Poster")
        url = URL(string: "\(TasteMovieList.recommend.the1.photo)")
        if let imagedata = try? Data(contentsOf: url!){
        Movie2.setImage(
                resizeImage(image: UIImage(data: imagedata)!, targetSize: .init(width: 150.0, height: 150.0)), for: .normal)
        }
        UserDefaults.standard.setValue(TasteMovieList.recommend.the1.url, forKey: "TasteMovie2")
        UserDefaults.standard.setValue(TasteMovieList.recommend.the1.photo, forKey: "TasteMovie2Poster")
        url = URL(string: "\(TasteMovieList.recommend.the2.photo)")
        if let imagedata = try? Data(contentsOf: url!){
        Movie3.setImage(
            resizeImage(image: UIImage(data: imagedata)!, targetSize: .init(width: 150.0, height: 150.0)), for: .normal)
        }
        UserDefaults.standard.setValue(TasteMovieList.recommend.the2.url, forKey: "TasteMovie3")
        UserDefaults.standard.setValue(TasteMovieList.recommend.the2.photo, forKey: "TasteMovie3Poster")
        url = URL(string: "\(TasteMovieList.netflix.movie["0"]!.photo)")
        if let imagedata = try? Data(contentsOf: url!){
        Netflix1.setImage(
            resizeImage(image: UIImage(data: imagedata)!, targetSize: .init(width: 100.0, height: 150.0)), for: .normal)
        }
        url = URL(string: "\(TasteMovieList.netflix.movie["1"]!.photo)")
        if let imagedata = try? Data(contentsOf: url!){
        Netflix2.setImage(
            resizeImage(image: UIImage(data: imagedata)!, targetSize: .init(width: 100.0, height: 150.0)), for: .normal)
        }
        url = URL(string: "\(TasteMovieList.netflix.movie["2"]!.photo)")
        if let imagedata = try? Data(contentsOf: url!){
        Netflix3.setImage(
            resizeImage(image: UIImage(data: imagedata)!, targetSize: .init(width: 100.0, height: 150.0)), for: .normal)
        }
        url = URL(string: "\(TasteMovieList.watcha["0"]!.photo)")
        if let imagedata = try? Data(contentsOf: url!){
        Watcha1.setImage(
            resizeImage(image: UIImage(data: imagedata)!, targetSize: .init(width: 150.0, height: 150.0)), for: .normal)
        }
        url = URL(string: "\(TasteMovieList.watcha["1"]!.photo)")
        if let imagedata = try? Data(contentsOf: url!){
        Watcha2.setImage(
            resizeImage(image: UIImage(data: imagedata)!, targetSize: .init(width: 150.0, height: 150.0)), for: .normal)
        }
        url = URL(string: "\(TasteMovieList.watcha["2"]!.photo)")
        if let imagedata = try? Data(contentsOf: url!){
        Watcha3.setImage(
            resizeImage(image: UIImage(data: imagedata)!, targetSize: .init(width: 150.0, height: 150.0)), for: .normal)
        }
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var userna: UILabel!
    @IBOutlet weak var Movie1: UIButton!
    @IBOutlet weak var Movie2: UIButton!
    @IBOutlet weak var Movie3: UIButton!
    @IBOutlet weak var Netflix1: UIButton!
    @IBOutlet weak var Netflix2: UIButton!
    @IBOutlet weak var Netflix3: UIButton!
    @IBOutlet weak var Watcha1: UIButton!
    @IBOutlet weak var Watcha2: UIButton!
    @IBOutlet weak var Watcha3: UIButton!
    
    @IBAction func tastefullview(_ sender: Any) {
        let fullstate = 0
        UserDefaults.standard.setValue(fullstate, forKey: "fullstate")
        let pushFV = self.storyboard?.instantiateViewController(withIdentifier: "FullView")
        self.navigationController?.pushViewController(pushFV!, animated: true)
    }
    
    @IBAction func Netflixfullview(_ sender: Any) {
        let fullstate = 1
        UserDefaults.standard.setValue(fullstate, forKey: "fullstate")
        let pushFV = self.storyboard?.instantiateViewController(withIdentifier: "FullView")
        self.navigationController?.pushViewController(pushFV!, animated: true)
    }
    
    @IBAction func Watchafullview(_ sender: Any) {
        let fullstate = 2
        UserDefaults.standard.setValue(fullstate, forKey: "fullstate")
        let pushFV = self.storyboard?.instantiateViewController(withIdentifier: "FullView")
        self.navigationController?.pushViewController(pushFV!, animated: true)
    }
    
    @IBAction func TasteMovie1(_ sender: Any) {
        let stringurl = UserDefaults.standard.string(forKey: "TasteMovie1")!
        UserDefaults.standard.setValue(UserDefaults.standard.string(forKey:"TasteMovie1Poster"), forKey: "poster")
        UserDefaults.standard.setValue(UserDefaults.standard.string(forKey:"TasteMovie1"), forKey: "movieurl")
        Webservice().detail(strurl: stringurl)
        let pushDV = self.storyboard?.instantiateViewController(withIdentifier: "DetailView")
        self.navigationController?.pushViewController(pushDV!, animated: true)
    }
    
    @IBAction func TasteMovie2(_ sender: Any) {
        let stringurl = UserDefaults.standard.string(forKey: "TasteMovie2")!
        UserDefaults.standard.setValue(UserDefaults.standard.string(forKey:"TasteMovie2Poster"), forKey: "poster")
        UserDefaults.standard.setValue(UserDefaults.standard.string(forKey:"TasteMovie2"), forKey: "movieurl")
        Webservice().detail(strurl: stringurl)
        let pushDV = self.storyboard?.instantiateViewController(withIdentifier: "DetailView")
        self.navigationController?.pushViewController(pushDV!, animated: true)
    }
    
    @IBAction func TasteMovie3(_ sender: Any) {
        let stringurl = UserDefaults.standard.string(forKey: "TasteMovie3")!
        UserDefaults.standard.setValue(UserDefaults.standard.string(forKey:"TasteMovie3Poster"), forKey: "poster")
        UserDefaults.standard.setValue(UserDefaults.standard.string(forKey:"TasteMovie3"), forKey: "movieurl")
        Webservice().detail(strurl: stringurl)
        let pushDV = self.storyboard?.instantiateViewController(withIdentifier: "DetailView")
        self.navigationController?.pushViewController(pushDV!, animated: true)
    }
    
    @IBAction func Refresh(_ sender: Any) {
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
