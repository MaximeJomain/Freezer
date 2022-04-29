//
//  DataViewController.swift
//  Freezer
//
//  Created by OBAMA YANN KEVIN on 29/04/2022.
//

import UIKit

class DataViewController: UIViewController {
    @IBOutlet var appsTableView : UITableView!
    var tableData : [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        appsTableView.delegate = self
        appsTableView.dataSource = self
        
    }
    
    func fetchSound(completion: @escaping (Sound) -> Void) {

        //URL De l'API
        let soundURL = URL(string: "http://api.deezer.com/search/artist?q=f")!
        
        // Lancement de la requete
        let task = URLSession.shared.dataTask(with: soundURL) { data, response, error in
    
            if let data = data,
                let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                
                    //Création de l'objet Dog à partir du dictionnaire contenu dans le call api
                    if let sound = Sound(json: json) {
                        completion(sound)
                    }
                }
        }
        task.resume()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "MaCelluleDeTest")
         
        if let rowData: NSDictionary = self.tableData[indexPath.row] as? NSDictionary,
            // Prenez la clé artworkUrl60 pour obtenir l'URL d'une image pour la miniature de l'application
           let urlString = rowData["artworkUrl60"] as? String,
            // Créez une instance de NSURL à partir de l'URL sous forme de chaîne que nous recevons de l'API
           let imgURL = NSURL(string: urlString),
            // Téléchargez une représentation NSData de l'image à cette URL
           let imgData = NSData(contentsOfURL: imgURL),
            // Obtenez le titre du morceau
            nomMorceau = rowData["trackName"] as? String {
                // Affichez le prix formaté dans le sous-titre
                cell.detailTextLabel?.text = prixFormate
                // Mettez à jour la cellule imageWiew pour afficher l'image téléchargée
                cell.imageView?.image = UIImage(data: imgData)
                // Mettez à jour le texte de textLabel pour afficher le nom du morceau obtenu de l'API
                cell.textLabel?.text = nomMorceau
        }
        return cell
    }
    
}
extension DataViewController
