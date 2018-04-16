//
//  UserRouter.swift
//  BreedPic
//
//  Created by Eduard Moya on 4/11/18.
//  Copyright © 2018 Eduard Moya. All rights reserved.
//

import Foundation
import Alamofire

enum UserRouter: URLRequestConvertible {
    //MARK: - Endpoint cases
    case getUser(number: Int) //Get random user(s).

    //MARK: - API base URL
    private static let baseURLString = "https://randomuser.me/api"

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
        case .getUser(let number):
            return number > 0 ? "/?results=\(number)" : "/"
        }
    }

    //MARK: - URL Request
    func asURLRequest() throws -> URLRequest {
        let url = (UserRouter.baseURLString + path).addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
        let requestURL = try url.asURL()
        let urlRequest = try URLRequest(url: requestURL, method: method)
        return urlRequest
    }
}
