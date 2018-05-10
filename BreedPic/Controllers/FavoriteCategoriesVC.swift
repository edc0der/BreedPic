//
//  FavoriteCategoriesVC.swift
//  BreedPic
//
//  Created by Eduard Moya on 4/4/18.
//  Copyright © 2018 Eduard Moya. All rights reserved.
//

import UIKit
import Foundation

class FavoriteCategoriesVCViewModel: NSObject {
    var imagesList: [String]?
    let client = APIClient()

    func fetchImages() -> Void {
        client.getRandomImages { (list) in
            self.imagesList = list
        }
    }
}

class FavoriteCategoriesVC: UIViewController {

    @IBOutlet private weak var cvPictures: UITableView!
    var viewModel = FavoriteCategoriesVCViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchImages()
    }
}

// MARK: Datasource
extension FavoriteCategoriesVC {
    
}

// MARK: Delegate
extension FavoriteCategoriesVC {

}

// MARK: Prefetch
extension FavoriteCategoriesVC {

}
