//
//  UIImage+Download.swift
//  BreedPic
//
//  Created by Eduard Moya on 5/10/18.
//  Copyright © 2018 Eduard Moya. All rights reserved.
//

import UIKit

extension UIImage {
    static func downloadImageFromUrl(_ url: String, completionHandler: @escaping (UIImage?) -> Void) {
        guard let url = URL(string: url) else {
            completionHandler(nil)
            return
        }
        let task: URLSessionDataTask = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) -> Void in
            guard let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data) else {
                    completionHandler(nil)
                    return
            }
            completionHandler(image)
        })
        task.resume()
    }
}
