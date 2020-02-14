//
//  MailAuthViewController.swift
//  FireBaseAuthentication_iOS
//
//  Created by kouichi on 2020/02/14.
//  Copyright © 2020 takahashi kouichi. All rights reserved.
//

import UIKit
import Firebase

class MailAuthViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func registerAccount(_ sender: Any) {
        guard
            let email = self.emailTextField.text,
            let password = self.passwordTextField.text
            else { return }
        
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                print(error)
                return
            }
            self.performSegue(withIdentifier: "AuthSuccess", sender: (authResult)?.user)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextViewController = segue.destination as! MailAuthSuccessViewController
    }
    
}
