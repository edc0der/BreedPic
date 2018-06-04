//
//  BreedFeedTableViewController.swift
//  BreedPic
//
//  Created by Eduard Moya on 6/3/18.
//  Copyright © 2018 Eduard Moya. All rights reserved.
//

import UIKit
import PreviewTransition

class BreedFeedTableViewController: PTTableViewController {

    var viewModel = FeedTableViewControllerViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib.init(nibName: "BreedFeedTableViewCell", bundle: nil), forCellReuseIdentifier: "ParallaxCell")
        viewModel.fetchImages { (success) in
            if success {
                self.tableView.reloadData()
            }
        }
    }
}

//MARK:- Table view data source
extension BreedFeedTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ParallaxCell", for: indexPath) as! BreedFeedTableViewCell
        return cell
    }
}

//MARK:- Table view delegate
extension BreedFeedTableViewController {
    //hack to remove lines on empty table
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }

    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let cell = cell as? BreedFeedTableViewCell else { return }
        cell.configure(withViewModel: viewModel.viewModel(atRow: indexPath.row))
    }

    override func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let cellViewModel = viewModel.viewModel(atRow: indexPath.row)
        cellViewModel.cancelImageLoad()
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController: BreedPictureViewController = BreedPictureViewController.loadFromNib()
        UIView.animate(withDuration: 0.3) {
            self.pushViewController(viewController)
        }

    }
}
