//
//  ConnectionViewController.swift
//  Freezer
//
//  Created by OBAMA YANN KEVIN on 27/04/2022.
//

import UIKit

class ConnectionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Page de connexion"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func registerButton(_ sender: Any) {
        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "registerview") as? RegisterViewController {
            //show a modal named second after conditions
//                self.present(vc, animated: true, completion: nil)
            self.navigationController?.pushViewController(vc, animated: true)
//            }
        }
        
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
