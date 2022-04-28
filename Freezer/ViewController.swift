//
//  ViewController.swift
//  Freezer
//
//  Created by Maxime on 26/04/2022.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    @IBOutlet weak var collectionViewHori: UICollectionView!
    @IBOutlet weak var collectScrollVerti: UICollectionView!
    
    @IBOutlet weak var UserNameLabel: UILabel!
    
    
    var imageArray = [UIImage(named: "hoshi"), UIImage(named: "lanadelrey"), UIImage(named: "soprano"), UIImage(named: "thegates"), UIImage(named: "amanipicci")]
    var imageArray2 = [UIImage(named: "soprano"), UIImage(named: "thegates"), UIImage(named: "amanipicci")]

    @IBAction func LoginButton(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "second")
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    @IBOutlet weak var ImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(collectionView == collectScrollVerti){
            return imageArray2.count
        }
        return imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionViewHori.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as! HomeCollectionViewCell
        cell.imageScrollHori.image = imageArray[indexPath.row]
        
        if(collectionView == collectScrollVerti){
            let cell2 = collectScrollVerti.dequeueReusableCell(withReuseIdentifier: "Home2CollectionViewCell", for: indexPath) as! Home2CollectionViewCell
            cell2.imageScroll.image = imageArray2[indexPath.row]
            return cell2
        }
        
        return cell
    }
    
    
}

