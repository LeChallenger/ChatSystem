//
//  LoginViewController.swift
//  chadodo
//
//  Created by Alexander Saberdine on 22/05/2016.
//  Copyright © 2016 unknown. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBAction func signInButtonAction(sender: AnyObject) {
        
        
        
        if ((usernameTextField.text?.isEmpty) != nil) {
            let nm = NetworkManager()
            nm.openSocket(usernameTextField.text!)
        }else{
            
        }
    }
}
