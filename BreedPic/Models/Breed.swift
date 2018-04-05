//
//  Breed.swift
//  BreedPic
//
//  Created by Eduard Moya on 4/4/18.
//  Copyright © 2018 Eduard Moya. All rights reserved.
//

import Foundation

class Breed {
    var id: String? //self generated
    var name: String {
        didSet {
            if let data = name.data(using: .utf8) {
                id = data.base64EncodedString(options: Data.Base64EncodingOptions(rawValue: 0))
            }
        }
    }
    var imagesURLs = [String]()
    var subBreeds: [Breed]?

    init(name: String) {
        self.name = name
    }
}
