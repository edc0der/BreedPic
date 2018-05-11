//
//  FeedTableViewController.swift
//  BreedPic
//
//  Created by Eduard Moya on 5/10/18.
//  Copyright © 2018 Eduard Moya. All rights reserved.
//

import UIKit

class FeedTableViewController: UITableViewController {

    var viewModel = FeedTableViewControllerViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(FeedTableViewCell.self)
        viewModel.fetchImages { (success) in
            if success {
                self.tableView.reloadData()
            }
        }
    }
}

//MARK:- Table view data source
extension FeedTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.imagesCount()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: FeedTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        cell.configure(withViewModel: viewModel.viewModel(atRow: indexPath.row))
        return cell
    }

    //hack to remove lines on empty table
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.bounds.size.width + 60.0
    }
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.bounds.size.width + 60.0
    }
}

//MARK:- Table view delegate
extension FeedTableViewController {

}
