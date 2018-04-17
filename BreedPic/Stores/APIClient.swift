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
    typealias BreedListCompletion = ([Breed]?) -> Void
    typealias UserListCompletion = ([UserProfile]?) -> Void

    func getBreedList(completion: @escaping BreedListCompletion) -> Void {
        Alamofire.request(BreedRouter.getSimpleBreedList).responseData { (responseData) in
            if let error = responseData.error {
                print("something went wrong \(error.localizedDescription)")
                completion([])
                return
            }
            do {
                let decoder = JSONDecoder()
                let breedListDecoded = try decoder.decode(BaseBreedResult<[String]>.self, from: responseData.data!)

                guard let list = breedListDecoded.message else {
                    completion([])
                    return
                }
                var breedList = [Breed]()
                for breedName in list {
                    breedList.append(Breed(name: breedName))
                }
                completion(breedList)
            } catch let error {
                print("something went wrong \(error.localizedDescription)")
            }
        }
    }

    func getUser(amount: Int? = 1, completion: @escaping UserListCompletion) -> Void {
        Alamofire.request(UserRouter.getUser(number: amount!)).responseData { (responseData) in
            if let error = responseData.error {
                print("something went wrong \(error.localizedDescription)")
                completion([])
                return
            }
            do {
                let decoder = JSONDecoder()
                let userListDecoded = try decoder.decode(BaseUserResult.self, from: responseData.data!)

                completion(userListDecoded.results ?? [])
            } catch let error {
                print("something went wrong \(error.localizedDescription)")
            }
        }
    }
}
