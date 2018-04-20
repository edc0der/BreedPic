//
//  FavoriteCategoriesVC.swift
//  BreedPic
//
//  Created by Eduard Moya on 4/4/18.
//  Copyright © 2018 Eduard Moya. All rights reserved.
//

import UIKit

class FavoriteCategoriesVC: UIViewController {

    @IBOutlet private weak var tvPictures: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension FavoriteCategoriesVC: UITableViewDelegate {
    
}

extension FavoriteCategoriesVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell(frame: .zero)
    }
}
