//
//  ViewController.swift
//  AllCon
//
//  Created by YunD on 2022/05/09.
//

import UIKit
import Cosmos

class DetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        Netflix.isHidden = true
        Amazon.isHidden = true
        Disney.isHidden = true
        Wavve.isHidden = true
        Watcha.isHidden = true
        Appletv.isHidden = true
        Naver.isHidden = true
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        ReviewStar1.isHidden = true
        ReviewStar1.isUserInteractionEnabled = false
        ReviewContent1.text = ""
        Reviewname1.text = ""
        ReviewStar2.isHidden = true
        ReviewStar2.isUserInteractionEnabled = false
        ReviewContent2.text = ""
        Reviewname2.text = ""
        
        var moviedetail = Moviedetail(title: "", year: "", sites: [Site1(sort: "", site: "", price: "")], director: "", rating: "", category: [""], synopsis: "")
        
        if let data = UserDefaults.standard.value(forKey: "detail") as? Data{
            if let detail = try? JSONDecoder().decode(Moviedetail.self, from: data) {
                moviedetail = detail
                print(moviedetail)
            }
        }
        let moviename = "\(moviedetail.title)-\(moviedetail.year)"
        Webservice().movies(moviename: moviename, imageurl: UserDefaults.standard.string(forKey: "poster")!, movieurl: UserDefaults.standard.string(forKey: "movieurl")!)
        
        var Movie = Movies(id: 0, createdAt: "", updatedAt: "", content: "", liked: 0, likeCount: 0, currentUser: "")
        var movieid = 0
        if let data = UserDefaults.standard.value(forKey: "movies") as? Data{
            if let detail = try? JSONDecoder().decode(Movies.self, from: data) {
                movieid = detail.id
                print(movieid)
            }
        }
        Webservice().movieget(movieid: movieid)
        Webservice().moviereviewget(movieid: movieid)
        UserDefaults.standard.setValue(movieid, forKey: "movieid")
        if let data = UserDefaults.standard.value(forKey: "movieget") as? Data{
            if let detail = try? JSONDecoder().decode(Movies.self, from: data) {
                Movie = detail
                print(Movie)
            }
        }
        
        var review = Review()
        
        if let data = UserDefaults.standard.value(forKey: "reviews") as? Data{
            if let detail = try? JSONDecoder().decode(Review.self, from: data) {
                review = detail
                print(review)
            }
        }
        
        if review.isEmpty {
            ReviewContent1.text = "리뷰가 없습니다."
        }
        else if review.count == 1 {
            ReviewStar1.isHidden = false
            let startIndex = review[0].createdAt.index(review[0].createdAt.startIndex, offsetBy: 0)
            let endIndex = review[0].createdAt.index(review[0].createdAt.startIndex, offsetBy: 10)
            ReviewStar1.rating = Double(review[0].star)
            ReviewContent1.text = review[0].content
            Reviewname1.text = "\(review[0].owner) |  \(review[0].createdAt[startIndex..<endIndex])"
        }
        
        else if review.count > 1 {
            ReviewStar1.isHidden = false
            ReviewStar2.isHidden = false
            let startIndex = review[0].createdAt.index(review[0].createdAt.startIndex, offsetBy: 0)
            let endIndex = review[0].createdAt.index(review[0].createdAt.startIndex, offsetBy: 10)
            let start = review[1].createdAt.index(review[1].createdAt.startIndex, offsetBy: 0)
            let end = review[1].createdAt.index(review[1].createdAt.startIndex, offsetBy: 10)
            ReviewStar1.rating = Double(review[0].star)
            ReviewContent1.text = review[0].content
            Reviewname1.text = "\(review[0].owner) |  \(review[0].createdAt[startIndex..<endIndex])"
            ReviewStar2.rating = Double(review[1].star)
            ReviewContent2.text = review[1].content
            Reviewname2.text = "\(review[1].owner) |  \(review[1].createdAt[start..<end])"
        }
        if Movie.liked == 1{
            button.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            wish = 1
        }
        UserDefaults.standard.setValue(Movie.id, forKey: "currentmovieid")
        MovieTitle.text = "\(moviedetail.title)"
        if moviedetail.category.count>2{
            genre.text = "\(moviedetail.category[0]),\(moviedetail.category[1]), \(moviedetail.category[2])"
        }
        else if moviedetail.category.count==2{
            genre.text = "\(moviedetail.category[0]),\(moviedetail.category[1])"
        }
        else if moviedetail.category.count==1{
            genre.text = " \(moviedetail.category[0])"
        }
        else {
            genre.text = ""
        }
        let url = URL(string: "\(UserDefaults.standard.string(forKey: "poster")!)")
        if let imagedata = try? Data(contentsOf: url!){
            Poster.image =  resizeImage(image: UIImage(data: imagedata)!, targetSize: .init(width: 150.0, height: 150.0))
        }
        for s in moviedetail.sites{
            switch(s.site){
            case "Netflix": Netflix.isHidden = false
            case "Amazon Prime Video": Amazon.isHidden = false
            case "Disney Plus": Disney.isHidden = false
            case "wavve" : Wavve.isHidden = false
            case "Watcha" : Watcha.isHidden = false
            case "Apple TV Plus" : Appletv.isHidden = false
            case "Naver Store" : Naver.isHidden = false
            default:
                break
            }
        }
        synopsis.text = moviedetail.synopsis
        UserDefaults.standard.setValue(moviedetail.synopsis, forKey: "synopsis")
        Director.text = moviedetail.director
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var Director: UILabel!
    @IBOutlet weak var Poster: UIImageView!
    @IBOutlet weak var MovieTitle: UILabel!
    @IBOutlet weak var genre: UILabel!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var synopsis: UILabel!
    @IBOutlet weak var Appletv: UIStackView!
    @IBOutlet weak var Naver: UIStackView!
    @IBOutlet weak var Watcha: UIStackView!
    @IBOutlet weak var Wavve: UIStackView!
    @IBOutlet weak var Disney: UIStackView!
    @IBOutlet weak var Amazon: UIStackView!
    @IBOutlet weak var Netflix: UIStackView!
    @IBOutlet weak var ReviewStar1: CosmosView!
    @IBOutlet weak var ReviewContent1: UILabel!
    @IBOutlet weak var Reviewname1: UILabel!
    @IBOutlet weak var ReviewStar2: CosmosView!
    @IBOutlet weak var ReviewContent2: UILabel!
    @IBOutlet weak var Reviewname2: UILabel!
    
    var wish = 0
    @IBAction func onClick(_ sender: Any) {
        Webservice().movielike(movieid: UserDefaults.standard.integer(forKey: "currentmovieid"))
        print(UserDefaults.standard.integer(forKey: "currentmovieid"))
        if wish == 0 {
            button.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            wish = 1
        }
        else{
            button.setImage(UIImage(systemName: "heart"), for: .normal)
            wish = 0 

        }
    }
    @IBAction func Refresh(_ sender: Any) {
        self.viewDidLoad()
    }
    
}
