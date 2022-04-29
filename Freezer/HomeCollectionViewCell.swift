//
//  HomeCollectionViewCell.swift
//  Freezer
//
//  Created by Johanna Tarento on 28/04/2022.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageScrollHori: UIImageView!

    func configure(with url: String) {
        imageScrollHori.loadFrom(URLAddress: url)
    }
    
    
}

extension UIImageView {
    func loadFrom(URLAddress: String) {
        guard let url = URL(string: URLAddress) else {
            return
        }

        DispatchQueue.main.async { [weak self] in
            if let imageData = try? Data(contentsOf: url) {
                if let loadedImage = UIImage(data: imageData) {
                        self?.image = loadedImage
                }
            }
        }
    }
}
