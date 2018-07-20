//
//  HomeViewController.swift
//  BuzzDeals
//
//  Created by Lauren Williams on 7/17/18.
//  Copyright © 2018 Make School. All rights reserved.
//

import UIKit

class CollectionViewController: UICollectionViewController {
   
    //Mark: - Properties
    var names = ["Asia SF1", "Catch", "Mel's Drive In San Francisco"]
    var images = [UIImage(named: "AsiaSF1.jpg "), UIImage(named: "Catch.jpg"), UIImage(named: "Mel'sDriveInSanFrancisco.jpg ")]
    

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
        
        var cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath as IndexPath) as UICollectionViewCell
        
        var image = cell.viewWithTag(1) as! UIImageView
        
        image.image = images[indexPath.row]
        
        var name = cell.viewWithTag(2) as! UILabel
        
        name.text = names[indexPath.row]
        return cell
    }
}


