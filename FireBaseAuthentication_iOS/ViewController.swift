//
//  ViewController.swift
//  FireBaseAuthentication_iOS
//
//  Created by kouichi on 2020/02/13.
//  Copyright © 2020 takahashi kouichi. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseUI

class ViewController: UIViewController, FUIAuthDelegate {
    
    var handle: AuthStateDidChangeListenerHandle?
    var authUI: FUIAuth { get { FUIAuth.defaultAuthUI()! }}
    
    // 認証に使用するプロバイダの選択
    lazy var  providers: [FUIAuthProvider] = [
        FUIGoogleAuth(),
//        FUIFacebookAuth(),
//        self.twitterAuthProvider()!,
        FUIPhoneAuth(authUI:FUIAuth.defaultAuthUI()!),
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        self.authUI.delegate = self
//        self.authUI.providers = providers
//        DispatchQueue.main.async {
//            let authViewController = self.authUI.authViewController()
//            self.present(authViewController,animated: true, completion: nil)
//        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        Auth.auth().removeStateDidChangeListener(handle!)
    }
    
    func twitterAuthProvider() -> FUIAuthProvider? {
      let buttonColor = UIColor(red: 71.0/255.0, green: 154.0/255.0, blue: 234.0/255.0, alpha: 1.0)
      return FUIOAuth(authUI: self.authUI,
                      providerID: "twitter.com",
                      buttonLabelText: "Sign in with Twitter",
                      shortName: "Twitter",
                      buttonColor: buttonColor,
                      iconImage: UIImage(contentsOfFile: Bundle.main.path(forResource: "twtrsymbol", ofType: "png")!)!,
                      scopes: ["user.readwrite"],
                      customParameters: ["prompt" : "consent"],
                      loginHintKey: nil)
        
    }
}

