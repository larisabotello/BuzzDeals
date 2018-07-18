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
import FirebaseDatabase

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
        //Larisa Added thi code to display home page...
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        
        if let initialViewController = storyboard.instantiateInitialViewController() {
            self.view.window?.rootViewController = initialViewController
            self.view.window?.makeKeyAndVisible()
        }
    }
}

//reading the user JSOn object from our database if the user exists

func authUI(_ authUI: FUIAuth, didSignInWith authDataResult: AuthDataResult?, error: Error?) {
    if let error = error {
        assertionFailure("Error signing in: \(error.localizedDescription)")
        return
    }
    
    //1, check that the FIRUser returend from authentication is not nil by unwrapping it.
    guard let user = authDataResult?.user
        else {return}
    
    //2, construct a relative path to the frefernce of the usre's info in our database
    let userRef = Database.database().reference().child("users").child(user.uid)
    
    //3, read from the path we created and pass an event closure to handle the data(snapshot) that is passed back from the dtabase.
    userRef.observeSingleEvent(of: .value, with: { (snapshot) in
        // 1
        if let userDict = snapshot.value as? [String : Any] {
            print("User already exists \(userDict.debugDescription).")
        } else {
            print("New user!")
        }
    })
    //4 retireve user data from snapshot
        
   
}
























