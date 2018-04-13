//
//  APIClient.swift
//  BreedPic
//
//  Created by Eduard Moya on 4/10/18.
//  Copyright © 2018 Eduard Moya. All rights reserved.
//

import UIKit
import Alamofire

class APIClient: NSObject {
    var _breedList = [Breed]()

    public var breedList: [Breed] {
        return _breedList
    }

    typealias BreedListCompletion = ([Breed]?) -> Void

    func getBreedList(completion: @escaping BreedListCompletion) -> Void {
        Alamofire.request(BreedRouter.getSimpleBreedList).responseJSON { (response) in
            guard response.error == nil,
                let responseDictionary = response.result.value as? [String : Any],
                let breeds = responseDictionary["message"] as? [String]
            else {
                self._breedList = []
                return
            }
            DispatchQueue.main.async {
//                self._breedList = breeds
                completion(self.breedList)
            }
        }
    }

    func getUser(amount: Int? = 1) -> Void {
        Alamofire.request(UserRouter.getUser(number: amount!)).responseJSON { (jsonResponse) in
            guard jsonResponse.error == nil, let userList = jsonResponse.result.value as? [String: Any] else {
                return
            }
            for item in userList {
                print(item)
            }
            print(jsonResponse)
        }
    }
}
