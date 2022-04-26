//
//  Dog.swift
//  Freezer
//
//  Created by OBAMA YANN KEVIN on 26/04/2022.
//

import Foundation

struct Dog {
    let message: String
    let status: String
 
    var url: URL { URL(string: message)! }
}

extension Dog {
    init?(json: [String: Any]) {
        guard let message = json["message"] as? String,
            let status = json["status"] as? String
        else {
            return nil
        }

        self.message = message
        self.status = status
    }
}
