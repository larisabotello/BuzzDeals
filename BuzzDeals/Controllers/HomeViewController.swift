//
//  HomeViewController.swift
//  BuzzDeals
//
//  Created by Lauren Williams on 7/17/18.
//  Copyright © 2018 Make School. All rights reserved.
//

import UIKit
import CoreLocation


class CollectionViewController: UICollectionViewController, CLLocationManagerDelegate {
   
    //Mark: - Properties
    var names = ["Asia SF", "Catch", "Mel's Drive In"]
    var images = [UIImage(named: "AsiaSF.jpg "), UIImage(named: "Catch.jpg"), UIImage(named: "Mel'sDriveIn.jpg ")]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        //dispose of any resources that can be recreated
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return names.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath as IndexPath) as UICollectionViewCell
        
        let image = cell.viewWithTag(1) as! UIImageView
        
        image.image = images[indexPath.row]
        
        let name = cell.viewWithTag(2) as! UILabel
    
        name.text = names[indexPath.row]
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // 1
        guard let identifier = segue.identifier else { return }
        
        // 2
        if identifier == "displayDescription" {
            print("Transitioning to the Home View Controller")
        }
    }
}


