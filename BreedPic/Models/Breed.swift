//
//  Breed.swift
//  BreedPic
//
//  Created by Eduard Moya on 4/4/18.
//  Copyright © 2018 Eduard Moya. All rights reserved.
//

import Foundation

struct BaseBreedResult<T : Codable>: Codable {
    let status: String?
    let message: T? //can be array, dictionary and/or string
}

class Breed {
    public private(set) var id: String? //self generated
    public private(set) var name: String = "" {
        didSet {
            if let data = name.data(using: .utf8) {
                id = data.base64EncodedString(options: Data.Base64EncodingOptions(rawValue: 0))
            }
        }
    }
    public var imagesURLs = [String]()

    init(name: String) {
        setName(newName: name)
    }

    //hack to call didSet on init
    private func setName(newName: String) -> Void {
        self.name = newName
    }
}
