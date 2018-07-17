//
//  LoginViewController.swift
//  BuzzDeals
//
//  Created by Lauren Williams on 7/17/18.
//  Copyright © 2018 Make School. All rights reserved.
//


import UIKit
import FirebaseAuth
import FirebaseUI

typealias FIRUser = FirebaseAuth.User

class LoginViewController: UIViewController {
    
    //Mark: - Properties
    
    @IBOutlet weak var loginButton: UIButton!
    
    // Mark: - VC Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //Mark: - IBActions
    
    //Now that we can access the FirebaseUI library, our next focus will be to hand-off the authentication process to FirebaseUI.
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        //1, acess the FUI default auth UI singleton
        guard let authUI = FUIAuth.defaultAuthUI()
            else {return}
        
        //2, set the FUIAuth's singleton's delegate
        authUI.delegate = self
        
        //3, presnt the auth view controller and implement the FUIAuthDelegate protocol
        let authViewController = authUI.authViewController()
        present(authViewController, animated: true)
    }
    
}

extension LoginViewController: FUIAuthDelegate {
    func authUI(_ authUI: FUIAuth, didSignInWith user: FirebaseAuth.User?, error: Error?) {
        print("Handle user signup / login")
    }
}


