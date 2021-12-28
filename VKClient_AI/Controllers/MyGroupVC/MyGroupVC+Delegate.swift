//
//  MyGroupVC + Delegate.swift
//  VKClient_AI
//
//  Created by Игорь  Архипов on 26.11.2021.
//

import UIKit

extension MyGroupVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return heightTableViewCell
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            //MARK: Alert controler in case of delete
            let alertDeleteControler = UIAlertController(title: "Delete Group", message: "Are you sure you want to delete the group?", preferredStyle: .alert)
            let actionDeleteYes = UIAlertAction(title: "Yes", style: .default) {[weak self] _ in
                self?.myGroupsArray.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
            let actionDeleteNo = UIAlertAction(title: "No", style: .cancel, handler: nil)
            alertDeleteControler.addAction(actionDeleteYes)
            alertDeleteControler.addAction(actionDeleteNo)
            self.present(alertDeleteControler, animated: true, completion: nil)
    }
    
    
    
}
}
