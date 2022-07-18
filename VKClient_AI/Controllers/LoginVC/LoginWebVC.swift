//
//  LoginWebVC.swift
//  VKClient_AI
//
//  Created by Игорь  Архипов on 11.01.2022.
//

import UIKit
import WebKit

class LoginWebVC: UIViewController {
    
    let toViews = "loginSegue"
    
    @IBOutlet var webView: WKWebView! {
        didSet {
            webView.navigationDelegate = self
        }
    }
    
    var session = Session.sessionInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let request = NetworkServices().loadAuth(){
            webView.load(request)
        }
    }
}

//MARK: Example of request inside of LogibWebVC
//private extension LoginWebVC {
//    func loadAuth(){
//        var urlComponents = URLComponents()
//
//        urlComponents.scheme = "https"
//        urlComponents.host = "oauth.vk.com"
//        urlComponents.path = "/authorize"
//        urlComponents.queryItems = [
//            URLQueryItem(name: "client_id", value: "8047871"),
//            URLQueryItem(name: "display", value: "mobile"),
//            URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
//            URLQueryItem(name: "scope", value: "262150"),
//            URLQueryItem(name: "response_type", value: "token"),
//            URLQueryItem(name: "v", value: "5.68")
//        ]
//
//        let request = URLRequest(url: urlComponents.url!)
//        webView.load(request)
//    }
//}

extension LoginWebVC: WKNavigationDelegate{
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        guard
            let url = navigationResponse.response.url,
            url.path == "/blank.html",
            let fragment = url.fragment
        else {
            decisionHandler(.allow)
            return
        }
        let params = fragment
            .components(separatedBy: "&")
            .map {$0.components(separatedBy: "=")}
            .reduce([String:String]()) {result, param in
                var dict = result
                let key = param[0]
                let value = param[1]
                dict[key] = value
                return dict
            }
        if let token = params["access_token"], let userId = params["user_id"] {
            session.token = token
            session.userId = Int(userId)!
            performSegue(withIdentifier: toViews, sender: nil)
            
            decisionHandler(.cancel)
        }
    }
    
}
