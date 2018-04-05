//
//  BreedRouter.swift
//  BreedPic
//
//  Created by Eduard Moya on 4/4/18.
//  Copyright © 2018 Eduard Moya. All rights reserved.
//

import Foundation
import Alamofire

//MARK: - Request status
enum RequestStatus {
    case success, error
    
    var description: String {
        switch self {
        case .success:
            return "success"
        default:
            return "error"
        }
    }
    
    static func requestStatusFromString(_ resultString: String?) -> RequestStatus {
        if let resultString = resultString, resultString == RequestStatus.success.description {
            return .success
        }
        return .error
    }
}

enum Router: URLRequestConvertible {
    //MARK: - Endpoint cases
    case getFullBreedList //List all breed names including sub breeds.
    case getSimpleBreedList //List all master breed names.
    case getSubBreeds(breed: String) //List sub breeds.
    case getRandomBreedImage //Random image from any breed.
    case getAllBreedImages(breed: String) //Get all breed images.
    case getRandomBreedImageFull(breed: String) //Get random image from a breed (and all its sub-breeds).
    case getAllSubBreedImages(breed: String, subbreed: String) //Get all images from sub breed.
    case getRandomSubBreedImage(breed: String, subbreed: String) //Get random image from sub breed.
    
    //MARK: - API base URL
    static let baseURLString = "https://dog.ceo/api"
    
    //MARK: - HTTP Methods per endpoints
    var method: HTTPMethod {
        switch self {
        default:
            return .get
        }
    }
    
    //MARK: - Endpoints
    var path: String {
        switch self {
        case .getFullBreedList:
            return "/breeds/list/all"
        case .getSimpleBreedList:
            return "/breeds/list"
        case .getSubBreeds(let breed):
            return "/breed/\(breed)/list"
        case .getRandomBreedImage:
            return "/breeds/image/random"
        case .getAllBreedImages(let breed):
            return "/breed/\(breed)/images"
        case .getRandomBreedImageFull(let breed):
            return "/breed/\(breed)/images/random"
        case .getAllSubBreedImages(let breed, let subbreed):
            return "/breed/\(breed)/\(subbreed)/images"
        case .getRandomSubBreedImage(let breed, let subbreed):
            return "/breed/\(breed)}/\(subbreed)/images/random"
        }
    }
    
    //MARK: - URL Request
    func asURLRequest() throws -> URLRequest {
        let url = try Router.baseURLString.asURL()
        let urlRequest = try URLRequest(url: url.appendingPathComponent(path), method: method)
        return urlRequest
    }
}
