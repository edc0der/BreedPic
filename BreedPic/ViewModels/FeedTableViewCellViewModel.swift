//
//  FeedTableViewCellViewModel.swift
//  BreedPic
//
//  Created by Eduard Moya on 5/11/18.
//  Copyright © 2018 Eduard Moya. All rights reserved.
//

import UIKit

protocol FeedTableViewCellViewModelDataSource {
    var name: String { get }
    var imageURL: String { get }
    var image: UIImage? { get }
}

protocol FeedTableViewCellViewModelDelegate {
    func loadImage(completion: @escaping () -> Void) -> Void
    func cancelImageLoad() -> Void
}

class FeedTableViewCellViewModel: NSObject {
    //Properties
    private let breed: Breed!
    private var _image: UIImage?
    private var imageDownloadTask: URLSessionDataTask?

    init(withBreed breed: Breed) {
        self.breed = breed
    }
}

extension FeedTableViewCellViewModel: FeedTableViewCellViewModelDataSource {

    var name: String {
        return breed.name
    }

    var imageURL: String {
        return breed.imageURL
    }

    var image: UIImage? {
        return _image
    }
}

extension FeedTableViewCellViewModel: FeedTableViewCellViewModelDelegate {

    func loadImage(completion: @escaping () -> Void) {
        if let _ = _image {
            completion()
        } else {
            imageDownloadTask = UIImage.downloadImageFromUrl(breed.imageURL) { (image) in
                guard let image = image else {
                    completion()
                    return
                }
                self._image = image
                completion()
            }
        }
    }

    func cancelImageLoad() {
        imageDownloadTask?.cancel()
    }
}
