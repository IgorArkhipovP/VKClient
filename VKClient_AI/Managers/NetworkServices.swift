//
//  NetworkServices.swift
//  VKClient_AI
//
//  Created by Игорь  Архипов on 11.01.2022.
//

import UIKit
import Alamofire

final class NetworkServices{
    
    let versionOfAPI = "5.131"
    let token = Session.sessionInstance.token
    static let shared = NetworkServices()
    
    //MARK: An authorization of user
    func loadAuth() -> URLRequest? {
        var urlComponents = URLComponents()
        
        urlComponents.scheme = "https"
        urlComponents.host = "oauth.vk.com"
        urlComponents.path = "/authorize"
        urlComponents.queryItems = [
            URLQueryItem(name: "client_id", value: "8081179"),
            URLQueryItem(name: "display", value: "mobile"),
            URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
            URLQueryItem(name: "scope", value: "270342"),
            URLQueryItem(name: "response_type", value: "token"),
            URLQueryItem(name: "v", value: versionOfAPI)
        ]
        
        guard let url = urlComponents.url else { return nil }
        let request = URLRequest(url: url)
        print(url)
        return request
    }
    
    //MARK: A list of user's group (example of Alamofire)
    func loadMyGroups(completion: @escaping ((Result<GroupOnlineModel, Error>) -> Void)) {
        let baseURL = "https://api.vk.com"
        let path = "/method/groups.get"
        
        let params: Parameters = [
            "access_token": token,
            "extended": 1,
            "v": versionOfAPI
        ]
        
        AF.request(baseURL + path, method: .get, parameters: params).responseJSON { (response) in
            switch response.result {
            case .failure(let error):
                completion(.failure(error))
            case .success( _):
                if let data = response.data {
                    do {
                        let groups = try JSONDecoder().decode(GroupOnlineModel.self, from: data)
                        completion(.success(groups))
                    } catch {
                        completion(.failure(error))
                    }
                }
            }
            
            //AF.request(baseURL + path, method: .get, parameters: params).responseJSON { (response) in
            //  guard let json = response.value else {
            //    return
            // }
            //print(response.request)
            //print(json)
        }
    }
    
    //MARK: A list of friends
    func loadListOfFriends(completion: @escaping ((Result<FriendOnlineModel, Error>) -> Void)) {
        
        let baseURL = "https://api.vk.com"
        let path = "/method/friends.get"
        
        let params: Parameters = [
            "access_token": token,
            "fields": "photo_100",
            "v": versionOfAPI
        ]
        
        AF.request(baseURL + path, method: .get, parameters: params).responseJSON { (response) in
            switch response.result {
            case .failure(let error):
                completion(.failure(error))
            case .success( _):
                if let data = response.data {
                    do {
                        let friends = try JSONDecoder().decode(FriendOnlineModel.self, from: data)
                        completion(.success(friends))
                    } catch {
                        completion(.failure(error))
                    }
                }
            }
        }
    }
    //        var urlComponentsOfFriendsList = URLComponents()
    //
    //        urlComponentsOfFriendsList.scheme = "https"
    //        urlComponentsOfFriendsList.host = "api.vk.com"
    //        urlComponentsOfFriendsList.path = "/method/friends.get"
    //        urlComponentsOfFriendsList.queryItems = [
    //            URLQueryItem(name: "access_token", value: token),
    //            URLQueryItem(name: "v", value: versionOfAPI),
    //            URLQueryItem(name: "fields", value: "city")
    //        ]
    //
    //        guard let url = urlComponentsOfFriendsList.url else { return }
    //
    //        print(url)
    //
    //        let session = URLSession.shared
    //
    //        let request = URLRequest(url: url)
    //        let dataTask = session.dataTask(with: request) { data, response, error in
    //            let json = try? JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)
    //          //  print("Friend list: \(json)")
    //        }
    //        dataTask.resume()
    //    }
    //
    //MARK: request of user
    func loadPhotosOfUser(completion: @escaping ((Result<PhotoOnlineModel, Error>) -> Void)) {
        let baseURL = "https://api.vk.com"
        let path = "/method/photos.get"
        
        let params: Parameters = [
            "access_token": token,
            "album_id": "profile",
            "v": versionOfAPI
        ]
        
        AF.request(baseURL + path, parameters: params).responseJSON { (response) in
            switch response.result {
            case .failure(let error):
                completion(.failure(error))
            case .success( _):
                if let data = response.data {
                    do {
                        let photos = try JSONDecoder().decode(PhotoOnlineModel.self, from: data)
                        completion(.success(photos))
                    } catch {
                        completion(.failure(error))
                    }
                }
            }
        }
    }
    
    //        AF.request(baseURL + path, method: .get, parameters: params).responseJSON { (response) in
    //            guard let json = response.value else {
    //                return
    //            }
    //            print(response.request)
    //           // print(json)
    //        }
    //    }
    
    func loadSearchRequest(request: String, completion: @escaping ((Result<GroupOnlineModel, Error>) -> Void)) {
        let baseURL = "https://api.vk.com"
        let path = "/method/groups.search"
        
        let params: Parameters = [
            "q": request,
            "access_token": token,
            "v": versionOfAPI
        ]
        
        
        AF.request(baseURL + path, method: .get, parameters: params).responseJSON { (response) in
            switch response.result {
            case .failure(let error):
                completion(.failure(error))
            case .success( _):
                if let data = response.data {
                    do {
                        let groups = try JSONDecoder().decode(GroupOnlineModel.self, from: data)
                        completion(.success(groups))
                    } catch {
                        completion(.failure(error))
                    }
                }
            }
        }
    }
    //        AF.request(baseURL + path, method: .get, parameters: params).responseJSON { (response) in
    //            guard let json = response.value else {
    //                return
    //            }
    //            print(response.request)
    //            //print(json)
    //        }
    //    }
    
    
    //MARK: ONLINE REQUEST
    
//    func getNewsFeed(completion: @escaping ((Result<NewsFeedOnline, Error>) -> Void))
//    {
//        
//    let baseURL = "https://api.vk.com"
//    let path = "/method/newsfeed.get"
//
//    let params: Parameters = [
//    "access_token": token,
//    "filters": "post,photo",
//    "v": versionOfAPI
//    ]
//
//    
//    AF.request(baseURL + path, method: .get, parameters: params).responseJSON { (response) in
//        switch response.result {
//        case .failure(let error):
//            completion(.failure(error))
//        case .success( _):
//            if let data = response.data {
//                do {
//                    let feeds = try JSONDecoder().decode(NewsFeedOnline.self, from: data)
//                    completion(.success(feeds))
//                    print(feeds)
//                } catch {
//                    completion(.failure(error))
//                }
//            }
//        }
//    }
//}

    func newsFeedJSON(){

      var urlComponentsNewsFeed = URLComponents()

      urlComponentsNewsFeed.scheme = "https"
      urlComponentsNewsFeed.host = "api.vk.com"
      urlComponentsNewsFeed.path = "/method/newsfeed.get"
      urlComponentsNewsFeed.queryItems = [
          URLQueryItem(name: "access_token", value: token),
          URLQueryItem(name: "filters", value: "post"),
          URLQueryItem(name: "v", value: versionOfAPI)
      ]

      guard let url = urlComponentsNewsFeed.url else { return }


      print(url)
    }
//    func getNewsFeed(completion: @escaping ((Result<FeedResponseOnlineModel, Error>) -> Void))

//       AF.request(baseURL + path, method: .get, parameters: params).responseJSON { (response) in
//           switch response.result {
//           case .failure(let error):
//               completion(.failure(error))
//           case .success( _):
//               if let data = response.data {
//                   do {
//                       let feeds = try JSONDecoder().decode(FeedResponseOnlineModel.self, from: data)
//                       completion(.success(feeds))
//                       print(feeds)
//                   } catch {
//                       completion(.failure(error))
//                   }
//               }
//           }
//       }
}
