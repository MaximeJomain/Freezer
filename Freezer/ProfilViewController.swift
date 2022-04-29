//
//  ProfilViewController.swift
//  Freezer
//
//  Created by Johanna Tarento on 29/04/2022.
//

import UIKit

class ProfilViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var imageCollectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
    var imageArray = [UIImage(named: "hoshi"), UIImage(named: "lanadelrey"), UIImage(named: "soprano"), UIImage(named: "thegates"), UIImage(named: "amanipicci")]
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = imageCollectionView.dequeueReusableCell(withReuseIdentifier: "ProfilCollectionViewCell", for: indexPath) as! ProfilCollectionViewCell
        cell.imageCollect.image = imageArray[indexPath.row]

        return cell
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
