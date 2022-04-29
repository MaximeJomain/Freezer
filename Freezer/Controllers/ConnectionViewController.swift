//
//  ConnectionViewController.swift
//  Freezer
//
//  Created by OBAMA YANN KEVIN on 27/04/2022.
//

import UIKit
import FirebaseAuth

class ConnectionViewController: UIViewController {

    @IBOutlet weak var emailInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Page de connexion"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func registerButton(_ sender: Any) {
        Auth.auth().signIn(withEmail: emailInput.text!, password: passwordInput.text!) { (authResult, error) in
            if error != nil {
                print(error.debugDescription)
            } else {
                self.performSegue(withIdentifier: "goToHome3", sender: self)
            }
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
