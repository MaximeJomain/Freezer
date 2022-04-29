//
//  ViewController.swift
//  Freezer
//
//  Created by Maxime on 26/04/2022.
//

import UIKit

class ViewController: UIViewController {
   
    @IBAction func LoginButton(_ sender: Any) {
        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "Home") as? HomeViewController {
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }

    @IBAction func SignUpButton(_ sender: Any) {
        if let vc2 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "SignUp") as? SignUpViewController {
            self.navigationController?.pushViewController(vc2, animated: true)
        }
    }
    @IBOutlet weak var ImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
}

