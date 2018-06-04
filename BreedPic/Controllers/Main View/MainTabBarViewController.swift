//
//  MainTabBarViewController.swift
//  BreedPic
//
//  Created by Eduard Moya on 6/3/18.
//  Copyright © 2018 Eduard Moya. All rights reserved.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabItems()
    }

    func setupTabItems() -> Void {
        //create tab bar items/ViewControllers
        let vcFavoriteCategories: BreedFeedTableViewController = BreedFeedTableViewController.loadFromNib()
        let vcFavoritePictures: FavoritesCollectionViewController = FavoritesCollectionViewController.loadFromNib()
        let vcSettings: SettingsVC = SettingsVC.loadFromNib()

        //set tab items' name, icon and tag
        vcFavoriteCategories.tabBarItem = UITabBarItem(title: .feedItem, image: #imageLiteral(resourceName: "search"), tag: 0)
        vcFavoritePictures.tabBarItem = UITabBarItem(title: .favoritesItem, image: #imageLiteral(resourceName: "tickBox"), tag: 1)
        vcSettings.tabBarItem = UITabBarItem(title: .settingsItem, image: #imageLiteral(resourceName: "settings"), tag: 2)

        //set items to tab bar controller and select default tab
        viewControllers = [vcFavoriteCategories, vcFavoritePictures, vcSettings]
        selectedViewController = viewControllers?.first
    }
}
