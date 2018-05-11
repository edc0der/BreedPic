//
//  FeedTableViewCellViewModel.swift
//  BreedPic
//
//  Created by Eduard Moya on 5/11/18.
//  Copyright © 2018 Eduard Moya. All rights reserved.
//

import UIKit

class FeedTableViewCellViewModel: NSObject {
    //Properties
    let urlString: String

    //Completion closure
    typealias LoadImageCompletion = (UIImage?) -> Void

    init(url: String) {
        urlString = url
    }

    func loadImage(completion: @escaping LoadImageCompletion) -> Void {
        UIImage.downloadImageFromUrl(urlString) { (image) in
            guard let image = image else {
                completion(nil)
                return
            }
            completion(image)
        }
    }
}
