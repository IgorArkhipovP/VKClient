//
//  NetworkServices.swift
//  VKClient_AI
//
//  Created by Игорь  Архипов on 11.01.2022.
//

import UIKit
import Alamofire

class NetworkServices{
    
    let versionOfAPI = "5.131"
    let token = Session.sessionInstance.token
    
    //MARK: An authorization of user
    func loadAuth() -> URLRequest? {
        var urlComponents = URLComponents()
        
        urlComponents.scheme = "https"
        urlComponents.host = "oauth.vk.com"
        urlComponents.path = "/authorize"
        urlComponents.queryItems = [
            URLQueryItem(name: "client_id", value: "8047871"),
            URLQueryItem(name: "display", value: "mobile"),
            URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
            URLQueryItem(name: "scope", value: "262150"),
            URLQueryItem(name: "response_type", value: "token"),
            URLQueryItem(name: "v", value: versionOfAPI)
        ]
        
        guard let url = urlComponents.url else { return nil }
        let request = URLRequest(url: url)
        print(url)
        return request
    }
    
    //MARK: A list of user's group (example of Alamofire)
    func loadMyGroups() {
        let baseURL = "https://api.vk.com"
        let path = "/method/groups.get"
        
        let params: Parameters = [
            "access_token": token,
            "extended": 1,
            "v": versionOfAPI
        ]
        
        AF.request(baseURL + path, method: .get, parameters: params).responseJSON { (response) in
            guard let json = response.value else {
                return
            }
            print(json)
        }
    }
    
    //MARK: A list of friends
    func loadListOfFriends() {
        
        var urlComponentsOfFriendsList = URLComponents()
        
        urlComponentsOfFriendsList.scheme = "https"
        urlComponentsOfFriendsList.host = "api.vk.com"
        urlComponentsOfFriendsList.path = "/method/friends.get"
        urlComponentsOfFriendsList.queryItems = [
            URLQueryItem(name: "access_token", value: token),
            URLQueryItem(name: "v", value: versionOfAPI),
        ]
        
        guard let url = urlComponentsOfFriendsList.url else { return }
        
        let session = URLSession.shared
        
        let request = URLRequest(url: url)
        let dataTask = session.dataTask(with: request) { data, response, error in
            let json = try? JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)
            print("Friend list: \(json)")
        }
        dataTask.resume()
    }
    
    //MARK: request of user
    func loadPhotosOfUser() {
        let baseURL = "https://api.vk.com"
        let path = "/method/photos.get"
        
        let params: Parameters = [
            "access_token": token,
            "album_id": "profile",
            "v": versionOfAPI
        ]
        
        AF.request(baseURL + path, method: .get, parameters: params).responseJSON { (response) in
            guard let json = response.value else {
                return
            }
            print(json)
        }
    }
    
    func loadSearchRequest(request: String) {
        let baseURL = "https://api.vk.com"
        let path = "/method/groups.search"
        
        let params: Parameters = [
            "q": request,
            "access_token": token,
            "v": versionOfAPI
        ]
        
        AF.request(baseURL + path, method: .get, parameters: params).responseJSON { (response) in
            guard let json = response.value else {
                return
            }
            print(json)
        }
    }
}




