//
//  LoginViewController.swift
//  Freezer
//
//  Created by Maxime on 29/04/2022.
//

import UIKit

struct Artist{
    let id: Int
    let name: String
    let link: String
    let picture: String
}
extension Artist{
    init?(json: [String:Any]){
        guard let id = json["id"] as? Int,
              let name = json["name"] as? String,
              let link = json["link"] as? String,
              let picture = json["picture"] as? String
                
        else{
            return nil
        }
        self.id = id
        self.name = name
        self.link = link
        self.picture = picture
    }
}


class LoginViewController: UIViewController {
    
    var result: [Artist] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        let url = URL(string: "http://api.deezer.com/search/artist?q=a")!
        
        let task = session.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print(error!.localizedDescription)
            } else {
                if let json = try? JSONSerialization.jsonObject(with: data!, options: .mutableContainers) {
                    if let data = json as? [String: AnyObject] {
                        
                        if let items = data["data"] as? [[String: AnyObject]] {
                            for item in items {
                                if let artist = Artist(json: item) {
                                    self.result.append(artist)
                                }
                                
                                
                            }
                        }
                    }
                }
            }
            
        }
        task.resume()
    }
    
    @IBAction func loginButton(_ sender: Any) {
        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "second") as? ViewController{
            
            vc.artistResult = self.result
            self.navigationController?.pushViewController(vc, animated: true)
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
