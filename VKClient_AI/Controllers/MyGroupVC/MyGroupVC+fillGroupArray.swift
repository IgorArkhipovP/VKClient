//
//  MyGroupVC+fillGroupArray.swift
//  VKClient_AI
//
//  Created by Игорь  Архипов on 27.11.2021.
//

import UIKit

extension MyGroupVC {
    
    func fillOutMyGroupsArray() {
        let group1 = Groups(name: "Spider-Man Fans", avatar: "spider-man")
        let group2 = Groups(name: "Last of us Fans", avatar: "last of us")
        myGroupsArray += [group1, group2]
    }
}
