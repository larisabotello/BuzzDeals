//
//  LoginViewController.swift
//  BuzzDeals
//
//  Created by Lauren Williams on 7/17/18.
//  Copyright © 2018 Make School. All rights reserved.
//


import UIKit


class LoginViewController: UIViewController {
    
    //Mark: - Properties
    
    @IBOutlet weak var loginButton: UIButton!
    
    // Mark: - VC Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //Mark: - IBActions
    
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        print("Login button was tapped")
    }
    
}


