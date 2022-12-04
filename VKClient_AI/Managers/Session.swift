//
//  Session.swift
//  VKClient_AI
//
//  Created by Игорь  Архипов on 02.01.2022.
//

import UIKit

class Session {
    
    static let sessionInstance = Session()
    
    private init () {}
    
    var token = ""
    var userId = 0
}
