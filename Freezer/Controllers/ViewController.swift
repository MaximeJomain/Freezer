//
//  ViewController.swift
//  Freezer
//
//  Created by Maxime on 26/04/2022.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class ViewController: UIViewController {
    var timer = Timer()
    
    
    @IBOutlet weak var emailInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.ramdomizedImage()
//        timer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
    }
    
//    @objc func timerAction (){
//        self.ramdomizedImage()
//
//    }

    @IBAction func dismissKeyboard(_ sender: Any) {
        emailInput.resignFirstResponder()

        passwordInput.resignFirstResponder()
    }
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
                self.performSegue(withIdentifier: "goToHome2", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "segueToSuccess"{
            let successVC = segue.destination as? RegisterViewController
            let user = sender as? User
            
            successVC?.user = user
        }
        
    }
    
    private func presentAlert(with error: String) {


       let alert = UIAlertController(title: "Erreur", message: error, preferredStyle: .alert)


       let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
     

       alert.addAction(action)
     

       present(alert, animated: true, completion: nil)
     

    }
    
    @IBAction func forgetPasswordButtonPressed(_ sender: UIButton) {
        print("Boutton forget")
    }
    @IBAction func inscriptionButtonPressed(_ sender: UIButton) {
        if emailInput.text != "" && passwordInput.text != "" {
            print("inscription de \(emailInput.text ?? "no name")")
            Auth.auth().createUser(withEmail: emailInput.text!, password: passwordInput.text!) {
                (authResult, error) in
                    if error != nil{
                        self.presentAlert(with: error.debugDescription)
                    }else{
                        print("Inscription de \(self.emailInput.text ?? "no name")")
                        let user = self.createUserObject()
                        self.performSegue(withIdentifier: "segueTosuccess", sender: self)
                        
                    }
                }
            }

        else{
            print("Erreur les champs de sont pas complets")
        }

    }
    private func createUserObject()-> User{
        let email = emailInput.text
        let password = passwordInput.text

        return User(email: email!, password: password!)
    }
    
    
    func fetchDog(completion: @escaping (Dog) -> Void) {

        //URL De l'API
        let dogURL = URL(string: "https://dog.ceo/api/breeds/image/random")!
        
        // Lancement de la requete
        let task = URLSession.shared.dataTask(with: dogURL) { data, response, error in
    
            if let data = data,
                let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                
                    //Création de l'objet Dog à partir du dictionnaire contenu dans le call api
                    if let dog = Dog(json: json) {
                        completion(dog)
                    }
                }
        }
        task.resume()
    }

//    func ramdomizedImage() {
//        self.fetchDog { dog in
//
//            DispatchQueue.main.async() { [weak self] in
//                let data = try? Data(contentsOf: dog.url)
//                self?.imaeView.image = UIImage(data: data!)
//            }
//        }
//    }
    
//    @IBAction func relancerAction(_ sender: Any) {
//        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "connexionview") as? ConnectionViewController {
//            //show a modal named second after conditions
////                self.present(vc, animated: true, completion: nil)
//            self.navigationController?.pushViewController(vc, animated: true)
////            }
//        }
//    }
}

