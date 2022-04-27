//
//  ViewController.swift
//  Freezer
//
//  Created by Maxime on 26/04/2022.
//

import UIKit

class ViewController: UIViewController {
    var timer = Timer()
    @IBOutlet weak var imaeView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.ramdomizedImage()
        timer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
    }
    
    @objc func timerAction (){
        self.ramdomizedImage()

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

    func ramdomizedImage() {
        self.fetchDog { dog in
            
            DispatchQueue.main.async() { [weak self] in
                let data = try? Data(contentsOf: dog.url)
                self?.imaeView.image = UIImage(data: data!)
            }
        }
    }
    
    @IBAction func relancerAction(_ sender: Any) {
        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "second") as? ConnectionViewController {
            //show a modal named second after conditions
//                self.present(vc, animated: true, completion: nil)
            self.navigationController?.pushViewController(vc, animated: true)
//            }
        }
    }
}

