//
//  RegisterViewController.swift
//  chatterApp
//
//  Created by Karan Sagar on 10/11/19.
//  Copyright © 2019 Karan. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD

class RegisterViewController: UIViewController {
    
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardWhenTappedAround()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func RegisterButtonPressed(_ sender: UIButton) {
        
        SVProgressHUD.show()
        
        //TODO: Setup a new user on Firebase Database
        Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
            if error != nil {
                //UnSucessful
                print(error!)
                SVProgressHUD.dismiss()
            } else {
                //Success
                print("Successfully Register")
                SVProgressHUD.dismiss()
                
                //Perform Segue to GoToChat Screen
                self.performSegue(withIdentifier: "goToChat", sender: self)
            }

        }
    }
    

}
