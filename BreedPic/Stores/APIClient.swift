//
//  APIClient.swift
//  BreedPic
//
//  Created by Eduard Moya on 4/10/18.
//  Copyright © 2018 Eduard Moya. All rights reserved.
//

import Moya

class APIClient: NSObject {
    typealias BreedListCompletion = ([Breed]) -> Void
    typealias BreedImagesListCompletion = ([String]) -> Void

    let provider = MoyaProvider<DogCeoAPIService>(plugins: [NetworkLoggerPlugin(verbose: true)])

    func getBreedList(completion: @escaping BreedListCompletion) -> Void {
        provider.request(.getSimpleBreedList) { (result) in
            switch result {
            case .success(let moyaResponse):
                do {
                    let decoder = JSONDecoder()
                    let jsonObject: BaseBreedResult = try decoder.decode(BaseBreedResult<[String]>.self, from: moyaResponse.data)
                    guard let breedNameList = jsonObject.message else {
                        completion([])
                        return
                    }
                    var breedList = [Breed]()
                    for breedName in breedNameList {
                        breedList.append(Breed(name: breedName))
                    }
                    completion(breedList)
                } catch let error {
                    completion([])
                    print("\(error.localizedDescription)")
                }
            case .failure(let error):
                completion([])
                print("\(error.localizedDescription)")
            }
        }
    }

    func getPictureForBreed(_ breed: String, completion: @escaping BreedImagesListCompletion) -> Void {
        provider.request(.getAllBreedImages(breed: breed)) { (result) in
            switch result {
            case .success(let moyaResponse):
                do {
                    let decoder = JSONDecoder()
                    let imagesURLList = try decoder.decode([String].self, from: moyaResponse.data)
                    completion(imagesURLList)
                } catch let error {
                    completion([])
                    print("\(error.localizedDescription)")
                }
            case .failure(let error):
                completion([])
                print("\(error.localizedDescription)")
            }
        }
    }

    func getRandomImages(completion: @escaping BreedImagesListCompletion) -> Void {
        provider.request(.getMultipleRandomImages(amount: 10)) { (result) in
            switch result {
                case .success(let moyaResponse):
                    do {
                        let decoder = JSONDecoder()
                        let decodedObject = try decoder.decode(BaseBreedResult<[String]>.self, from: moyaResponse.data)
                        guard let list = decodedObject.message else {
                            completion([])
                            return
                        }
                        completion(list)
                    } catch let error {
                        completion([])
                        print("\(error.localizedDescription)")
                    }
                case .failure(let error):
                    completion([])
                    print("\(error.localizedDescription)")
            }
        }
    }
}
