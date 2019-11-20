//
//  LoginViewController.swift
//  chatterApp
//
//  Created by Karan Sagar on 10/11/19.
//  Copyright © 2019 Karan. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    @IBOutlet weak var emailTextField1: UITextField!
    @IBOutlet weak var passwordTextField1: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        Auth.auth().signIn(withEmail: emailTextField1.text!, password: passwordTextField1.text!) { (user, error) in
            
            //check erros
            if error != nil {
                print("Error \(error!)")
            } else {
                //Sucess
                print("Login Sucess")
                
                //Segue to chat view
                self.performSegue(withIdentifier: "goToChat", sender: self)
                
            }
        }
    }
    

}
