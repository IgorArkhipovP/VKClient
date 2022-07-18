//
//  LoginVC.swift
//  NewProject_1
//
//  Created by Игорь  Архипов on 27.10.2021.
//

import UIKit

class LoginVC: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var loginInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var usernameLabel: UILabel!
    @IBOutlet var passwordLabel: UILabel!
    @IBOutlet var loginInButton: UIButton!
    @IBOutlet var viewsCollection: [UIView]!
    @IBOutlet var firstView: UIView!
    @IBOutlet var secondView: UIView!
    @IBOutlet var thirdView: UIView!
    @IBOutlet var fourthView: UIView!
    @IBOutlet var fifthView: UIView!
    
    let toMainScreen = "toMainScreen"
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidShow(_:)), name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidHide), name: UIResponder.keyboardDidHideNotification, object: nil)
        
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(onTap))
        recognizer.cancelsTouchesInView = false
        self.view.addGestureRecognizer(recognizer)
        
        for view in viewsCollection{
            view.layer.cornerRadius = 30
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        animateLogitInput()
        animatePasswordInput()
        animateFields()
        dotsAnimate(exitAfter: 30, currentCount: 0)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animateMainTitleSubstitution()
    }
    
    func incorrectDetailsAlert() {
        let alertIncorrectLog = UIAlertController(title: "Error", message: "You have entered wrong name or password", preferredStyle: .alert)
        let action = UIAlertAction(title: "Try again", style: .cancel, handler: nil)
        alertIncorrectLog.addAction(action)
        present(alertIncorrectLog, animated: true, completion: nil)
    }
    
    @objc func keyboardDidShow(_ notification: Notification){
        let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue
        guard let keyboardHeight = keyboardSize?.height else { return }
        
        let contentInserts = UIEdgeInsets(top: 0, left: 0, bottom: keyboardHeight + 10, right: 0)
        scrollView.contentInset = contentInserts
        scrollView.scrollIndicatorInsets = contentInserts
    }
    
    @objc func keyboardDidHide(){
        let contentInserts = UIEdgeInsets.zero
        scrollView.contentInset = contentInserts
        scrollView.scrollIndicatorInsets = contentInserts
    }
    
    @objc func onTap(){
        self.view.endEditing(true)
    }
    
    deinit{
        NotificationCenter.default.removeObserver(self)
    }
    
    @IBAction func loginPressedButton(_ sender: Any) {
        
        guard let login = loginInput.text,
              let password = passwordInput.text
        else {return}
        
        if login == "1" && password == "1" {
            performSegue(withIdentifier: toMainScreen, sender: nil)
        } else {
            incorrectDetailsAlert()
        }
        
    }
}

