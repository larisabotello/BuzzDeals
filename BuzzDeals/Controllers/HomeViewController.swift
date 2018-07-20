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
    var names = ["Asia SF", "Catch", "Mel's Drive In San Francisco"]
    var images = [UIImage(named: "Asia SF.jpg "), UIImage(named: "Catch.jpg"), UIImage(named: "Mel's Drive In San Francisco.jpg ")]
    

    override func viewDidLoad() {
        super.viewDidLoad()
     
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        //dispose of any resources that can be recreated
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath as IndexPath) as UICollectionViewCell
        return cell
    }
}


