//
//  HomeViewController.swift
//  BuzzDeals
//
//  Created by Lauren Williams on 7/17/18.
//  Copyright © 2018 Make School. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseAuth
import FirebaseUI
import FirebaseDatabase

class HomeViewController: UIViewController{
    var ref: DatabaseReference!
    var dealsList = [Deals]()

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
                //tersting data retrieval
                print(self.dealsList[0].deal)
            }
        })
        
    }
}
