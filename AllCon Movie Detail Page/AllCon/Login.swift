//
//  Login.swift
//  AllCon
//
//  Created by YunD on 2022/05/28.
//

import Foundation

enum AuthenticationError: Error {
    case invalidCredentials
    case custom(errorMessage: String)
}

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

struct LoginRequestBody: Codable {
    let username: String
    let password: String
}

struct LoginResponse: Codable {
    let access: String?
    let message: String?
    let success: Bool?
}

struct RegisterRequestBody: Codable {
    let username: String
    let password: String
    let email: String
    let profile: InitialProfile
}

struct InitialProfile: Codable {
}

struct RegisterResponse: Codable{
    let username: String?
}

struct UserBody: Codable {
    let id: Int
    let username: String
    let email: String
    let profile: Profile
}

struct Profile: Codable {
    let likedMovies: String
    let searchedMovies: String
    let taste: String
}

struct MovieList: Codable {
    let netflix: Netflix
    let watcha: [String: The0]
    let recommend: Recommend
}

struct Netflix: Codable {
    let movie, program: [String: The0]
}

struct The0: Codable {
    let title: String
    let url: String
    let photo: String
}

struct Recommend: Codable {
    let the0, the1, the2, the3: The0
    let the4, the5, the6, the7: The0
    let the8, the9, the10, the11: The0
    let the12, the13, the14, the15: The0
    let the16, the17, the18, the19: The0
    let the20, the21, the22, the23: The0
    let the24, the25, the26, the27: The0
    let the28, the29: The0
    let genre: [String]

    enum CodingKeys: String, CodingKey {
        case the0 = "0"
        case the1 = "1"
        case the2 = "2"
        case the3 = "3"
        case the4 = "4"
        case the5 = "5"
        case the6 = "6"
        case the7 = "7"
        case the8 = "8"
        case the9 = "9"
        case the10 = "10"
        case the11 = "11"
        case the12 = "12"
        case the13 = "13"
        case the14 = "14"
        case the15 = "15"
        case the16 = "16"
        case the17 = "17"
        case the18 = "18"
        case the19 = "19"
        case the20 = "20"
        case the21 = "21"
        case the22 = "22"
        case the23 = "23"
        case the24 = "24"
        case the25 = "25"
        case the26 = "26"
        case the27 = "27"
        case the28 = "28"
        case the29 = "29"
        case genre
    }
}

struct SearchValue: Codable {
    let title: String
    let url, href: String
    let sites: [Site]
}

enum Site: String, Codable {
    case disneyPlus = "Disney Plus"
    case naverStore = "Naver Store"
    case netflix = "Netflix"
    case watcha = "Watcha"
    case wavve = "wavve"
}

struct Moviedetail: Codable {
    let title, year: String
    let sites: [Site1]
    let director, rating: String
    let category: [String]
    let synopsis: String
}

struct Site1: Codable {
    let sort, site, price: String
}

typealias SearchValueList = [String: SearchValue]

struct Movies: Codable {
    let id: Int
    let createdAt, updatedAt, content: String
    let liked, likeCount: Int
    let currentUser: String
}

struct ReviewElement: Codable {
    let id: Int
    let content, owner: String
    let movieID, star: Int
    let createdAt, updatedAt: String

    enum CodingKeys: String, CodingKey {
        case id, content, owner
        case movieID = "movieId"
        case star, createdAt, updatedAt
    }
}

typealias Review = [ReviewElement]

class Webservice {

    func login(username: String, password: String, completion: @escaping (Result<String, AuthenticationError>) -> Void) {
            
            guard let url = URL(string: "http://127.0.0.1:8000/api/token/") else {
                completion(.failure(.custom(errorMessage: "URL is not correct")))
                return
            }
            
            let body = LoginRequestBody(username: username, password: password)
            
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = try? JSONEncoder().encode(body)
            
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                
                guard let data = data, error == nil else {
                    completion(.failure(.custom(errorMessage: "No data")))
                    return
                }
                
                try! JSONDecoder().decode(LoginResponse.self, from: data)
                
                guard let loginResponse = try? JSONDecoder().decode(LoginResponse.self, from: data) else {
                    completion(.failure(.invalidCredentials))
                    return
                }
                
                guard let token = loginResponse.access
                else {
                    completion(.failure(.invalidCredentials))
                    return
                }
                
                completion(.success(token))
                
            }.resume()
            
        }
    
    func register(username: String, password: String, completion: @escaping (Result<String, AuthenticationError>) -> Void) {
            
            guard let url = URL(string: "http://127.0.0.1:8000/register/") else {
                completion(.failure(.custom(errorMessage: "URL is not correct")))
                return
            }
        
        let body = RegisterRequestBody(username: username, password: password, email: "", profile: InitialProfile())
            
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = try? JSONEncoder().encode(body)
            
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                
                guard let data = data, error == nil else {
                    completion(.failure(.custom(errorMessage: "No data")))
                    return
                }
                
                try! JSONDecoder().decode(RegisterResponse.self, from: data)
                
                guard let registerResponse = try? JSONDecoder().decode(RegisterResponse.self, from: data) else {
                    completion(.failure(.invalidCredentials))
                    return
                }
                
                guard let id = registerResponse.username
                else {
                    completion(.failure(.invalidCredentials))
                    return
                }
                
                completion(.success(id))
                
            }.resume()
            
        }
    
    
    
    func currentuser(completion: @escaping (Result<String, AuthenticationError>) -> Void) {
        let semaphore = DispatchSemaphore (value: 0)
        guard let url = URL(string: "http://127.0.0.1:8000/users/current/") else {
            completion(.failure(.custom(errorMessage: "URL is not correct")))
            return
        }
        
        var request = URLRequest(url: url)
        let token = UserDefaults.standard.string(forKey: "jsonwebtoken")!
        
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue( "Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) {
            data,response,error in
            guard let data = data else {
                print(String(describing: error))
                semaphore.signal()
                return
              }
            guard let user = try? JSONDecoder().decode(UserBody.self, from: data) else {
                completion(.failure(.invalidCredentials))
                return
            }
            UserDefaults.standard.setValue(data, forKey: "user")
              semaphore.signal()
            }.resume()
            usleep(500000)
            completion(.success(""))
            
        }
    
    func usercurrent(){
        let semaphore = DispatchSemaphore (value: 0)

        var request = URLRequest(url: URL(string: "http://127.0.0.1:8000/users/current/")!,timeoutInterval: Double.infinity)
        let token = UserDefaults.standard.string(forKey: "jsonwebtoken")!
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            semaphore.signal()
            return
          }
            UserDefaults.standard.setValue(data, forKey: "user")
          print(String(data: data, encoding: .utf8)!)
          semaphore.signal()
        }

        task.resume()
        semaphore.wait()
    }
    
    func puttaste(){
        let semaphore = DispatchSemaphore (value: 0)
        let taste = UserDefaults.standard.string(forKey: "taste")!
        let parameters = "{\"taste\": \(taste)}"
        let postData = parameters.data(using: .utf8)
        var userid = -1
        if let savedata = UserDefaults.standard.object(forKey: "user") as? Data {
            if let save = try? JSONDecoder().decode(UserBody.self,from: savedata){
                userid = save.id
            }
        }
        var request = URLRequest(url: URL(string: "http://127.0.0.1:8000/users/\(userid)/")!,timeoutInterval: Double.infinity)
        let token = UserDefaults.standard.string(forKey: "jsonwebtoken")!
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        request.httpMethod = "PUT"
        request.httpBody = postData

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            semaphore.signal()
            return
          }
          print(String(data: data, encoding: .utf8)!)
          semaphore.signal()
        }
        task.resume()
        semaphore.wait()
    }
    
    func tastemovie(){
        let semaphore = DispatchSemaphore (value: 0)
        
        let taste = UserDefaults.standard.string(forKey: "taste")!
        print(taste)
        
        let stringurl = "http://127.0.0.1:8000/search_result/?fav=\(taste)"
        
        var request = URLRequest(url: URL(string: stringurl.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)!,timeoutInterval: Double.infinity)

        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            semaphore.signal()
            return
          }
            UserDefaults.standard.setValue(data, forKey: "movielist")
            print(String(data: data, encoding: .utf8)!)
            semaphore.signal()
        }

        task.resume()
        semaphore.wait()
    }
    
    func search(searchname: String){
        let semaphore = DispatchSemaphore (value: 0)
        print(searchname)
        let stringurl = "http://127.0.0.1:8000/search_result/?keyword=\(searchname)"
        
        var request = URLRequest(url: URL(string: stringurl.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)!,timeoutInterval: Double.infinity)

        request.httpMethod = "POST"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            semaphore.signal()
            return
          }
            UserDefaults.standard.setValue(data, forKey: "searchlist")
          print(String(data: data, encoding: .utf8)!)
          semaphore.signal()
        }

        task.resume()
        semaphore.wait()
    }
    
    func detail(strurl: String){
        let semaphore = DispatchSemaphore (value: 0)
        
        let stringurl = "http://127.0.0.1:8000/search_result/?url=\(strurl)"

        var request = URLRequest(url: URL(string: stringurl.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)!,timeoutInterval: Double.infinity)

        request.httpMethod = "POST"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            semaphore.signal()
            return
          }
            UserDefaults.standard.setValue(data, forKey: "detail")
          print(String(data: data, encoding: .utf8)!)
          semaphore.signal()
        }

        task.resume()
        semaphore.wait()

    }
    
    func movies(moviename: String, imageurl: String, movieurl: String){
        let semaphore = DispatchSemaphore (value: 0)

        let parameters = "{\n    \"content\": \"\(moviename)\",\n    \"imageURL\": \"\(imageurl)\",\n    \"movieURL\": \"\(movieurl)\"\n}"
        let postData = parameters.data(using: .utf8)
        let token = UserDefaults.standard.string(forKey: "jsonwebtoken")!

        var request = URLRequest(url: URL(string: "http://127.0.0.1:8000/movies/")!,timeoutInterval: Double.infinity)
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        request.httpMethod = "POST"
        request.httpBody = postData

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            semaphore.signal()
            return
          }
            UserDefaults.standard.setValue(data, forKey: "movies")
          print(String(data: data, encoding: .utf8)!)
          semaphore.signal()
        }

        task.resume()
        semaphore.wait()
    }
    
    func movielike(movieid: Int){
        let semaphore = DispatchSemaphore (value: 0)

        var request = URLRequest(url: URL(string: "http://127.0.0.1:8000/movies/\(movieid)/like/")!,timeoutInterval: Double.infinity)
        let token = UserDefaults.standard.string(forKey: "jsonwebtoken")!
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")

        request.httpMethod = "POST"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            semaphore.signal()
            return
          }
            
          print(String(data: data, encoding: .utf8)!)
          semaphore.signal()
        }

        task.resume()
        semaphore.wait()

    }
    
    func movieget(movieid: Int){
        let semaphore = DispatchSemaphore (value: 0)

        var request = URLRequest(url: URL(string: "http://127.0.0.1:8000/movies/\(movieid)/")!,timeoutInterval: Double.infinity)
        let token = UserDefaults.standard.string(forKey: "jsonwebtoken")!
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            semaphore.signal()
            return
          }
            UserDefaults.standard.setValue(data, forKey: "movieget")
          print(String(data: data, encoding: .utf8)!)
          semaphore.signal()
        }
        task.resume()
        semaphore.wait()
    }
    
    func moviereviewget(movieid: Int){
        let semaphore = DispatchSemaphore (value: 0)

        var request = URLRequest(url: URL(string: "http://127.0.0.1:8000/movies/\(movieid)/reviews/")!,timeoutInterval: Double.infinity)
        let token = UserDefaults.standard.string(forKey: "jsonwebtoken")!
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")

        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            semaphore.signal()
            return
          }
            UserDefaults.standard.setValue(data, forKey: "reviews")
          print(String(data: data, encoding: .utf8)!)
          semaphore.signal()
        }

        task.resume()
        semaphore.wait()
    }
    
    func moviereviewwrite(Reviewcontent: String, ReviewStar: Int, movieid: Int){
        let semaphore = DispatchSemaphore (value: 0)

        let parameters = "{\n    \"content\":\"\(Reviewcontent)\",\n    \"movieId\" : \"\(movieid)\",\n    \"star\" : \"\(ReviewStar)\"\n}"
        let postData = parameters.data(using: .utf8)

        var request = URLRequest(url: URL(string: "http://127.0.0.1:8000/reviews/")!,timeoutInterval: Double.infinity)
        let token = UserDefaults.standard.string(forKey: "jsonwebtoken")!
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        request.httpMethod = "POST"
        request.httpBody = postData

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            semaphore.signal()
            return
          }
          print(String(data: data, encoding: .utf8)!)
          semaphore.signal()
        }

        task.resume()
        semaphore.wait()
    }
}
