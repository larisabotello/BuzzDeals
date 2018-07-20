//
//  MySettingsViewController.swift
//  BuzzDeals
//
//  Created by Lauren Williams on 7/17/18.
//  Copyright © 2018 Make School. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseUI

class MySettingsViewController: UIViewController{
    @IBAction func SignoutBtnPressed(_ sender: UIButton) {
        print("Signing Out...")
        do {
            try Auth.auth().signOut()
        } catch let error as NSError {
            assertionFailure("Error signing out: \(error.localizedDescription)")
        }
        let loginViewController = UIStoryboard.initialViewController(for: .login)
        self.view.window?.rootViewController = loginViewController
        self.view.window?.makeKeyAndVisible()
    }
}
