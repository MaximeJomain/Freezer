//
//  CollectionView.swift
//  Freezer
//
//  Created by Johanna Tarento on 28/04/2022.
//

import UIKit

class CollectionView: UICollectionView {

    static func collectionViewOne() -> UICollectionView {
        
        let layout = UICollectionViewFlowLayout()
        
        let collectionViewOne = UICollectionView(frame: CGRect(x:0, y:20, width: 200, height: 100), collectionViewLayout: layout)
        
        return collectionViewOne
    }
    
    static func collectionViewTwo() -> UICollectionView {
        
        let layout = UICollectionViewFlowLayout()
        
        let collectionViewTwo = UICollectionView(frame: CGRect(x:0, y:20, width: 200, height: 100), collectionViewLayout: layout)
        
        return collectionViewTwo
    }
    
    class labels {
        
        static func labelArray() -> [UILabel] {
            
            let labelA = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))

            labelA.text = "i'm a"
            
            let labelB = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))

            labelB.text = "i'm b"
            
            let myArray = [labelA, labelB]
            
            return myArray
        }
    }

}
