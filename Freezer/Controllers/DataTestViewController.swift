//
//  DataTestViewController.swift
//  Freezer
//
//  Created by OBAMA YANN KEVIN on 29/04/2022.
//

import UIKit

class DataTestViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    func fetchSounds(completion: @escaping (Sound) -> Void) {

        let config = URLSessionConfiguration.default
                let session = URLSession(configuration: config)
                
                let url = URL(string: "http://api.deezer.com/search?q=a")!
                
                let task = session.dataTask(with: url) { (data, response, error) in
                    if error != nil {
                        print(error!.localizedDescription)
                    } else {
                        if let json = try? JSONSerialization.jsonObject(with: data!, options: .mutableContainers) {
                            if let data = json as? [String: AnyObject] {
                                
                                if let items = data["data"] as? [[String: AnyObject]] {
                                    for item in items {
                                        print(item["link"]!)
                                        self.browsers.append(item["link"]! as! String)
                                        /*if let artist = Artist(json: item) {
                                            self.browsers.append(artist)
                                        }*/
                                        
                                    }
                                }
                            }
                        }
                    }
                    
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                    
                }
                task.resume()
    }

}
