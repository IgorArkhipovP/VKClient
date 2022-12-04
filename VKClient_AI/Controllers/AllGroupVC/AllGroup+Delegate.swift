//
//  AllGroup+Delegate.swift
//  VKClient_AI
//
//  Created by Игорь  Архипов on 27.11.2021.
//

import UIKit

extension AllGroupVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return heightTableViewCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        NotificationCenter.default.post(name: NSNotification.Name("allGroupSelectedNotificaion"), object: allGroupsArray[indexPath.row])
    }
}
