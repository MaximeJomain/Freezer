//
//  HomeViewController.swift
//  Freezer
//
//  Created by Johanna Tarento on 29/04/2022.
//

import UIKit

class HomeViewController: UIViewController , UICollectionViewDelegate, UICollectionViewDataSource{

     
    @IBAction func ProfilButton(_ sender: Any) {
        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "Profil") as? ProfilViewController {
            self.present(vc, animated: true)
        }
    }
   
    
    @IBOutlet weak var imageScrollHori: UICollectionView!
    @IBOutlet weak var imageScrollVerti: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    var imageArray = [UIImage(named: "hoshi"), UIImage(named: "lanadelrey"), UIImage(named: "soprano"), UIImage(named: "thegates"), UIImage(named: "amanipicci")]
    var imageArray2 = [UIImage(named: "soprano"), UIImage(named: "thegates"), UIImage(named: "amanipicci")]
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(collectionView == imageScrollVerti){
            return imageArray2.count
        }
        return imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = imageScrollHori.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as! HomeCollectionViewCell
        cell.imageScrollHori.image = imageArray[indexPath.row]
        
        if(collectionView == imageScrollVerti){
            let cell2 = imageScrollVerti.dequeueReusableCell(withReuseIdentifier: "Home2CollectionViewCell", for: indexPath) as! Home2CollectionViewCell
            cell2.imageScroll.image = imageArray2[indexPath.row]
            return cell2
        }
        
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
