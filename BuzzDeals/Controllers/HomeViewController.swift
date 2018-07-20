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

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    @IBOutlet weak var tableView: UITableView!
    
    var ref: DatabaseReference!
    var dealsList = [Deals]()
    
    //    //TableView Functions Needed
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return (dealsList.count)
    }
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell =  tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ViewControllerTableViewCell

            cell.dataName.text = "testing"
            //print (cell.dataName.text)
               // cell.dataDeal.text = "testing"
                //cell.dataLocation.text = "testAgain"
//                cell.dataName.text = dealsList[indexPath.row].name
//                cell.dataDeal.text = dealsList[indexPath.row].deal
//                cell.dataLocation.text = dealsList[indexPath.row].location

        return (cell)
    }
    
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
                //testing data retrieval
                print(self.dealsList[0].deal)
            }
        })
        
    }
    
}
//extension HomeViewController: UITableViewDataSource, UITableViewDelegate{
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return (dealsList.count)
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell =  tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ViewControllerTableViewCell
//        //            cell.dataName.text = "testing"
//        //            print (cell.dataName.text)
//        //               // cell.dataDeal.text = "testing"
//        //                //cell.dataLocation.text = "testAgain"
//                        cell.dataName.text = dealsList[indexPath.row].name
//        ////                cell.dataDeal.text = dealsList[indexPath.row].deal
//        ////                cell.dataLocation.text = dealsList[indexPath.row].location
//        //
//                return (cell)
//           }
//
//}
