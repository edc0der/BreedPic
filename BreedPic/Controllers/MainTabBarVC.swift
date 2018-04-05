//
//  MainTabBarVC.swift
//  BreedPic
//
//  Created by Eduard Moya on 4/4/18.
//  Copyright © 2018 Eduard Moya. All rights reserved.
//

import UIKit

class MainTabBarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let vcFavoriteCategories = FavoriteCategoriesVC(nibName: "FavoriteCategoriesVC", bundle: nil)
        let vcFavoritePictures = FavoritePicturesVC(nibName: "FavoritePicturesVC", bundle: nil)
        let vcSettings = SettingsVC(nibName: "SettingsVC", bundle: nil)

        vcFavoriteCategories.tabBarItem = UITabBarItem(title: "Feed", image: #imageLiteral(resourceName: "search"), tag: 0)
        vcFavoritePictures.tabBarItem = UITabBarItem(title: "Favorites", image: #imageLiteral(resourceName: "tickBox"), tag: 1)
        vcSettings.tabBarItem = UITabBarItem(title: "Settings", image: #imageLiteral(resourceName: "settings"), tag: 2)

        viewControllers = [vcFavoriteCategories, vcFavoritePictures, vcSettings]
    }
}
