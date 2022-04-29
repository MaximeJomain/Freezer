//
//  File.swift
//  Freezer
//
//  Created by OBAMA YANN KEVIN on 29/04/2022.
//

import Foundation

struct Sound {
    let name: String
    let link: String
 
    var url: URL { URL(string: link)! }
}

extension Sound {
    init?(json: [String: Any]) {
        guard let link = json["link"] as? String,
            let name = json["status"] as? String
        else {
            return nil
        }

        self.link = link
        self.name = name
    }
}
