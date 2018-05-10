//
//  DogCeoAPIService.swift
//  BreedPic
//
//  Created by Eduard Moya on 4/22/18.
//  Copyright © 2018 Eduard Moya. All rights reserved.
//

import Foundation
import Moya

enum DogCeoAPIService {
    case getSimpleBreedList //List all master breed names.
    case getRandomBreedImage //Random image from any breed.
    case getAllBreedImages(breed: String) //Get all breed images.
    case getRandomBreedImageFull(breed: String) //Get random image from a breed (and all its sub-breeds).
    case getMultipleRandomImages(amount: UInt)
}

extension DogCeoAPIService: TargetType {
    var baseURL: URL {
        guard let url = URL(string: "https://dog.ceo/api") else { fatalError("Could not set base url") }
        return url
    }

    var method: Moya.Method {
        return .get
    }

    var path: String {
        switch self {
            case .getSimpleBreedList:
                return "/breeds/list"
            case .getRandomBreedImage:
                return "/breeds/image/random"
            case .getAllBreedImages(let breed):
                return "/breed/\(breed)/images"
            case .getRandomBreedImageFull(let breed):
                return "/breed/\(breed)/images/random"
            case .getMultipleRandomImages(let amount):
                return "/breeds/image/random/\(amount)"
        }
    }

    var sampleData: Data {
        return Data()
    }

    var task: Task {
        return .requestPlain
    }

    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
}
