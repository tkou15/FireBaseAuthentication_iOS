//
//  MailLinkAuthViewController.swift
//  FireBaseAuthentication_iOS
//
//  Created by kouichi on 2020/02/14.
//  Copyright © 2020 takahashi kouichi. All rights reserved.
//

import UIKit
import FirebaseAuth

class MailLinkAuthViewController: UIViewController {
        
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func mailLinkAuth(_ sender: Any) {
        let actionCodeSettings = ActionCodeSettings()
        actionCodeSettings.url = URL(string: "https://koichisampleapp.com")
        actionCodeSettings.handleCodeInApp = true
        actionCodeSettings.setIOSBundleID(Bundle.main.bundleIdentifier!)
        
        Auth.auth().sendSignInLink(toEmail: "", actionCodeSettings: actionCodeSettings) { error in
            if let error = error {
                // リンクの送信失敗
                print(error)
                return
            }
            // リンクの送信成功
            print("success")
        }
    }
}
