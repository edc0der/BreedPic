//
//  FeedTableViewControllerViewModel.swift
//  BreedPic
//
//  Created by Eduard Moya on 5/11/18.
//  Copyright © 2018 Eduard Moya. All rights reserved.
//

import Foundation

protocol FeedTableViewControllerViewModelDataSource {
    var count: Int { get }
    func viewModel(atRow row: Int) -> FeedTableViewCellViewModel
}

class FeedTableViewControllerViewModel: NSObject {
    //Properties
    var imagesList = [FeedTableViewCellViewModel]()
    let client = APIClient()

    //Completion closure
    typealias FetchCompletion = (Bool) -> Void

    func fetchImages(completion: @escaping FetchCompletion) -> Void {
        client.getRandomImages { (list) in
            self.imagesList.append(contentsOf: list.map { FeedTableViewCellViewModel(withBreed: $0)})
            completion(true)//assert failure cases
        }
    }
}

extension FeedTableViewControllerViewModel: FeedTableViewControllerViewModelDataSource {
    var count: Int {
        return imagesList.count
    }

    func viewModel(atRow row: Int) -> FeedTableViewCellViewModel {
        return imagesList[row]
    }
}
