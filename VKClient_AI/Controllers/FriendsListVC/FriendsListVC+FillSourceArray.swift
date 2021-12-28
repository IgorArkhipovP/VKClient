//
//  FriendsListVC+FillSourceArray.swift
//  VKClient_AI
//
//  Created by Игорь  Архипов on 27.11.2021.
//

import UIKit

extension FriendsListVC {
    
    func fillOutFriendsArray() {
        let friend1 = Friends(name: "Batman", age: "31 \(yearsOld)", avatar: "batman", photoAray: ["batman2", "batman3", "batman4", "batman5"])
        let friend2 = Friends(name: "Robin", age: "29 \(yearsOld)", avatar: "robin", photoAray: ["robin", "robin2", "robin3", "robin4"])
        friendsArray.append(friend1)
        friendsArray.append(friend2)
    }
    
    }
