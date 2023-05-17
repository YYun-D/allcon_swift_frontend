//
//  FullViewController.swift
//  AllCon
//
//  Created by YunD on 2022/06/03.
//

import UIKit

class FullViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let fullstate = UserDefaults.standard.integer(forKey: "fullstate")
        var TasteMovieList = MovieList(netflix: Netflix(movie: ["0": The0(title: "", url: "", photo: "")]
                                                    , program: ["0": The0(title: "", url: "", photo: "")]), watcha: ["0": The0(title: "", url: "", photo: "")], recommend: Recommend(the0: The0(title: "", url: "", photo: ""), the1: The0(title: "", url: "", photo: ""), the2: The0(title: "", url: "", photo: ""), the3: The0(title: "", url: "", photo: ""), the4: The0(title: "", url: "", photo: ""), the5: The0(title: "", url: "", photo: ""), the6: The0(title: "", url: "", photo: ""), the7: The0(title: "", url: "", photo: ""), the8: The0(title: "", url: "", photo: ""), the9: The0(title: "", url: "", photo: ""), the10: The0(title: "", url: "", photo: ""), the11: The0(title: "", url: "", photo: ""), the12: The0(title: "", url: "", photo: ""), the13: The0(title: "", url: "", photo: ""), the14: The0(title: "", url: "", photo: ""), the15: The0(title: "", url: "", photo: ""), the16: The0(title: "", url: "", photo: ""), the17: The0(title: "", url: "", photo: ""), the18: The0(title: "", url: "", photo: ""), the19: The0(title: "", url: "", photo: ""), the20: The0(title: "", url: "", photo: ""), the21: The0(title: "", url: "", photo: ""), the22: The0(title: "", url: "", photo: ""), the23: The0(title: "", url: "", photo: ""), the24: The0(title: "", url: "", photo: ""), the25: The0(title: "", url: "", photo: ""), the26: The0(title: "", url: "", photo: ""), the27: The0(title: "", url: "", photo: ""), the28: The0(title: "", url: "", photo: ""), the29: The0(title: "", url: "", photo: ""), genre: [""]))
        
        if let data = UserDefaults.standard.value(forKey: "movielist") as? Data{
            if let movielist = try? JSONDecoder().decode(MovieList.self, from: data) {
                TasteMovieList = movielist
            }
        }
        switch(fullstate){
        case 0:
            FullViewName.text = "    취향에 맞는 컨텐츠"
            var url = URL(string: "\(TasteMovieList.recommend.the0.photo)")
            if let imagedata = try? Data(contentsOf: url!){
            Movie1.setImage(
                resizeImage(image: UIImage(data: imagedata)!, targetSize: .init(width: 150.0, height: 150.0)), for: .normal)
            }
            url = URL(string: "\(TasteMovieList.recommend.the1.photo)")
            if let imagedata = try? Data(contentsOf: url!){
            Movie2.setImage(
                    resizeImage(image: UIImage(data: imagedata)!, targetSize: .init(width: 150.0, height: 150.0)), for: .normal)
            }
            url = URL(string: "\(TasteMovieList.recommend.the2.photo)")
            if let imagedata = try? Data(contentsOf: url!){
            Movie3.setImage(
                resizeImage(image: UIImage(data: imagedata)!, targetSize: .init(width: 150.0, height: 150.0)), for: .normal)
            }
            url = URL(string: "\(TasteMovieList.recommend.the3.photo)")
            if let imagedata = try? Data(contentsOf: url!){
            Movie4.setImage(
                resizeImage(image: UIImage(data: imagedata)!, targetSize: .init(width: 150.0, height: 150.0)), for: .normal)
            }
            url = URL(string: "\(TasteMovieList.recommend.the4.photo)")
            if let imagedata = try? Data(contentsOf: url!){
            Movie5.setImage(
                resizeImage(image: UIImage(data: imagedata)!, targetSize: .init(width: 150.0, height: 150.0)), for: .normal)
            }
            url = URL(string: "\(TasteMovieList.recommend.the5.photo)")
            if let imagedata = try? Data(contentsOf: url!){
            Movie6.setImage(
                resizeImage(image: UIImage(data: imagedata)!, targetSize: .init(width: 150.0, height: 150.0)), for: .normal)
            }
            url = URL(string: "\(TasteMovieList.recommend.the6.photo)")
            if let imagedata = try? Data(contentsOf: url!){
            Movie7.setImage(
                resizeImage(image: UIImage(data: imagedata)!, targetSize: .init(width: 150.0, height: 150.0)), for: .normal)
            }
            url = URL(string: "\(TasteMovieList.recommend.the7.photo)")
            if let imagedata = try? Data(contentsOf: url!){
            Movie8.setImage(
                resizeImage(image: UIImage(data: imagedata)!, targetSize: .init(width: 150.0, height: 150.0)), for: .normal)
            }
            url = URL(string: "\(TasteMovieList.recommend.the8.photo)")
            if let imagedata = try? Data(contentsOf: url!){
            Movie9.setImage(
                resizeImage(image: UIImage(data: imagedata)!, targetSize: .init(width: 150.0, height: 150.0)), for: .normal)
            }
            url = URL(string: "\(TasteMovieList.recommend.the9.photo)")
            if let imagedata = try? Data(contentsOf: url!){
            Movie10.setImage(
                resizeImage(image: UIImage(data: imagedata)!, targetSize: .init(width: 150.0, height: 150.0)), for: .normal)
            }
        case 1:
            FullViewName.text = "    넷플릭스 Top10"
            var url = URL(string: "\(TasteMovieList.netflix.movie["0"]!.photo)")
            if let imagedata = try? Data(contentsOf: url!){
            Movie1.setImage(
                resizeImage(image: UIImage(data: imagedata)!, targetSize: .init(width: 100.0, height: 150.0)), for: .normal)
            }
            url = URL(string: "\(TasteMovieList.netflix.movie["1"]!.photo)")
            if let imagedata = try? Data(contentsOf: url!){
            Movie2.setImage(
                resizeImage(image: UIImage(data: imagedata)!, targetSize: .init(width: 100.0, height: 150.0)), for: .normal)
            }
            url = URL(string: "\(TasteMovieList.netflix.movie["2"]!.photo)")
            if let imagedata = try? Data(contentsOf: url!){
            Movie3.setImage(
                resizeImage(image: UIImage(data: imagedata)!, targetSize: .init(width: 100.0, height: 150.0)), for: .normal)
            }
            url = URL(string: "\(TasteMovieList.netflix.movie["3"]!.photo)")
            if let imagedata = try? Data(contentsOf: url!){
            Movie4.setImage(
                resizeImage(image: UIImage(data: imagedata)!, targetSize: .init(width: 100.0, height: 150.0)), for: .normal)
            }
            url = URL(string: "\(TasteMovieList.netflix.movie["4"]!.photo)")
            if let imagedata = try? Data(contentsOf: url!){
            Movie5.setImage(
                resizeImage(image: UIImage(data: imagedata)!, targetSize: .init(width: 100.0, height: 150.0)), for: .normal)
            }
            url = URL(string: "\(TasteMovieList.netflix.movie["5"]!.photo)")
            if let imagedata = try? Data(contentsOf: url!){
            Movie6.setImage(
                resizeImage(image: UIImage(data: imagedata)!, targetSize: .init(width: 100.0, height: 150.0)), for: .normal)
            }
            url = URL(string: "\(TasteMovieList.netflix.movie["6"]!.photo)")
            if let imagedata = try? Data(contentsOf: url!){
            Movie7.setImage(
                resizeImage(image: UIImage(data: imagedata)!, targetSize: .init(width: 100.0, height: 150.0)), for: .normal)
            }
            url = URL(string: "\(TasteMovieList.netflix.movie["7"]!.photo)")
            if let imagedata = try? Data(contentsOf: url!){
            Movie8.setImage(
                resizeImage(image: UIImage(data: imagedata)!, targetSize: .init(width: 100.0, height: 150.0)), for: .normal)
            }
            url = URL(string: "\(TasteMovieList.netflix.movie["8"]!.photo)")
            if let imagedata = try? Data(contentsOf: url!){
            Movie9.setImage(
                resizeImage(image: UIImage(data: imagedata)!, targetSize: .init(width: 100.0, height: 150.0)), for: .normal)
            }
            url = URL(string: "\(TasteMovieList.netflix.movie["9"]!.photo)")
            if let imagedata = try? Data(contentsOf: url!){
            Movie10.setImage(
                resizeImage(image: UIImage(data: imagedata)!, targetSize: .init(width: 100.0, height: 150.0)), for: .normal)
            }
        case 2:
            FullViewName.text = "    왓챠 Top10"
            var url = URL(string: "\(TasteMovieList.watcha["0"]!.photo)")
            if let imagedata = try? Data(contentsOf: url!){
            Movie1.setImage(
                resizeImage(image: UIImage(data: imagedata)!, targetSize: .init(width: 150.0, height: 150.0)), for: .normal)
            }
            url = URL(string: "\(TasteMovieList.watcha["1"]!.photo)")
            if let imagedata = try? Data(contentsOf: url!){
            Movie2.setImage(
                resizeImage(image: UIImage(data: imagedata)!, targetSize: .init(width: 150.0, height: 150.0)), for: .normal)
            }
            url = URL(string: "\(TasteMovieList.watcha["2"]!.photo)")
            if let imagedata = try? Data(contentsOf: url!){
            Movie3.setImage(
                resizeImage(image: UIImage(data: imagedata)!, targetSize: .init(width: 150.0, height: 150.0)), for: .normal)
            }
            url = URL(string: "\(TasteMovieList.watcha["3"]!.photo)")
            if let imagedata = try? Data(contentsOf: url!){
            Movie4.setImage(
                resizeImage(image: UIImage(data: imagedata)!, targetSize: .init(width: 150.0, height: 150.0)), for: .normal)
            }
            url = URL(string: "\(TasteMovieList.watcha["4"]!.photo)")
            if let imagedata = try? Data(contentsOf: url!){
            Movie5.setImage(
                resizeImage(image: UIImage(data: imagedata)!, targetSize: .init(width: 150.0, height: 150.0)), for: .normal)
            }
            url = URL(string: "\(TasteMovieList.watcha["5"]!.photo)")
            if let imagedata = try? Data(contentsOf: url!){
            Movie6.setImage(
                resizeImage(image: UIImage(data: imagedata)!, targetSize: .init(width: 150.0, height: 150.0)), for: .normal)
            }
            url = URL(string: "\(TasteMovieList.watcha["6"]!.photo)")
            if let imagedata = try? Data(contentsOf: url!){
            Movie7.setImage(
                resizeImage(image: UIImage(data: imagedata)!, targetSize: .init(width: 150.0, height: 150.0)), for: .normal)
            }
            url = URL(string: "\(TasteMovieList.watcha["7"]!.photo)")
            if let imagedata = try? Data(contentsOf: url!){
            Movie8.setImage(
                resizeImage(image: UIImage(data: imagedata)!, targetSize: .init(width: 150.0, height: 150.0)), for: .normal)
            }
            url = URL(string: "\(TasteMovieList.watcha["8"]!.photo)")
            if let imagedata = try? Data(contentsOf: url!){
            Movie9.setImage(
                resizeImage(image: UIImage(data: imagedata)!, targetSize: .init(width: 150.0, height: 150.0)), for: .normal)
            }
            url = URL(string: "\(TasteMovieList.watcha["9"]!.photo)")
            if let imagedata = try? Data(contentsOf: url!){
            Movie10.setImage(
                resizeImage(image: UIImage(data: imagedata)!, targetSize: .init(width: 150.0, height: 150.0)), for: .normal)
            }
        default:
            break
        }
        
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var FullViewName: UILabel!
    @IBOutlet weak var Movie1: UIButton!
    @IBOutlet weak var Movie2: UIButton!
    @IBOutlet weak var Movie3: UIButton!
    @IBOutlet weak var Movie4: UIButton!
    @IBOutlet weak var Movie5: UIButton!
    @IBOutlet weak var Movie6: UIButton!
    @IBOutlet weak var Movie7: UIButton!
    @IBOutlet weak var Movie8: UIButton!
    @IBOutlet weak var Movie9: UIButton!
    @IBOutlet weak var Movie10: UIButton!
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
