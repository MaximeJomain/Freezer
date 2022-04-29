//
//  RegisterViewController.swift
//  Freezer
//
//  Created by Maxime on 27/04/2022.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class RegisterViewController: UIViewController {
    
    var user:User?
    @IBOutlet weak var userLabel: UILabel!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let user = Auth.auth().currentUser{
            // user connected
        userLabel.text = user.email
        }else{
            fatalError(" Erreur : aucun utilisateur n'est conecté")
        }
    }
    
    @IBAction func deconnectionPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
        
        
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
