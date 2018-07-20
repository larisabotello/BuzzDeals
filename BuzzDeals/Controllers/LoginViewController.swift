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
    var ref: DatabaseReference!
    var dealsList = [Deals]()
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //THIS IS WHERE I READ DATA -LARISA
        ref = Database.database().reference().child("Deals")
        //addDeals()
        ref.observe(DataEventType.value, with: {(snapshot) in
            if snapshot.childrenCount > 0{
                self.dealsList.removeAll()
                for deal in snapshot.children.allObjects as![DataSnapshot]{
                    let dealsObject = deal.value as?[String:AnyObject]
                    let dealName = dealsObject?["Name"]
                    let dealLocation = dealsObject?["Location"]
                    let deals = dealsObject?["Deal"]
                    let data = Deals(name: (dealName as! String), location: dealLocation as! String, deal: deals as! String)
                    self.dealsList.append(data)
                }
            }
        })
    }
//    func addDeals(){
//        let key = ref.childByAutoId().key
//        let deal = ["Name": "Asia SF",
//                    "Location": "South of Market, San Francisco",
//                    "Deal": "33% off Cal-Asian 3 course Dinner and Show for 2 on Wednesday, Thursday or Sunday @ 7:15pm"]
//        let deal1 = ["Name": "Catch",
//                    "Location": "The Castro, San Francisco",
//                    "Deal": "35% off, $40 voucher towards dinner"]
//        let deal2 = ["Name": "Mel’s Drive-in San Francisco",
//                     "Location": "4th and Mission, San Francisco",
//                     "Deal": "38% off, $20 voucher for Food and Drink for Parties of Two or Three People"]
//        ref.child(key).setValue(deal)
//        //ref.child(key).setValue(deal1)
//        //ref.child(key).setValue(deal2)
//    }
    @IBAction func loginButtonTapped(_ sender: Any) {
        guard let authUI = FUIAuth.defaultAuthUI()
            else {return}
        authUI.delegate = self
        
        let authViewController = authUI.authViewController()
        present(authViewController, animated: true)
        //tersting data retrieval
        print(dealsList[0].deal)
    }
    
}

extension LoginViewController: FUIAuthDelegate {
    func authUI(_ authUI: FUIAuth, didSignInWith authDataResult: AuthDataResult?, error: Error?) {
        if let error = error {
            assertionFailure("Error signing in: \(error.localizedDescription)")
            return
        }else{
            print("Signed In")
            UserDefaults.standard.set(true, forKey: Constants.UserDefaults.currentUser)
            UserDefaults.standard.synchronize()
            let initialViewController = UIStoryboard.initialViewController(for: .main)
            self.view.window?.rootViewController = initialViewController
            self.view.window?.makeKeyAndVisible()
        }
    }
}
























