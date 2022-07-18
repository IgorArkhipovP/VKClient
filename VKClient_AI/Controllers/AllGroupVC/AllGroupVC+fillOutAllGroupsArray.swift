//
//  AllGroupVC+fillOutAllGroupsArray.swift
//  VKClient_AI
//
//  Created by Игорь  Архипов on 27.11.2021.
//

import UIKit

extension AllGroupVC {
    
    func fillOutAllGroupsArray () {
        let group1 = Groups(name: "Wolverine Fans", avatar: "wolverine")
        let group2 = Groups(name: "Dead Pool Fans", avatar: "dead-pool")
        let group3 = Groups(name: "Itachi Fans", avatar: "itachi")
        let group4 = Groups(name: "Edward Munch Fans", avatar: "munch")
        let group5 = Groups(name: "Rene Magritt Fans", avatar: "magritt")
        let group6 = Groups(name: "Spider-Man Fans", avatar: "spider-man")
        let group7 = Groups(name: "Last of us Fans", avatar: "last of us")
        allGroupsArray += [group1, group2, group3, group4, group5, group6, group7]
    }
}
