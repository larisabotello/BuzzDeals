//
//  HomeViewController.swift
//  BuzzDeals
//
//  Created by Lauren Williams on 7/17/18.
//  Copyright © 2018 Make School. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate {
    
    //Mark: - Properties
    
    @IBOutlet weak var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
     
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        //dispose of any resources that can be recreated
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 1
        return 10
    }
    
    private func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 2
        let cell = tableView.dequeueReusableCell(withIdentifier: "listNotesTableViewCell", for: indexPath)
        cell.textLabel?.text = "Cell Row: \(indexPath.row) Section: \(indexPath.section)"
        
        return cell
    }
}

