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

        let vcFavoriteCategories = FavoriteCategoriesVC(nibName: className(target: FavoriteCategoriesVC.self), bundle: nil)
        let vcFavoritePictures = FavoritePicturesVC(nibName: className(target: FavoritePicturesVC.self), bundle: nil)
        let vcSettings = SettingsVC(nibName: className(target: SettingsVC.self), bundle: nil)

        vcFavoriteCategories.tabBarItem = UITabBarItem(title: .feedItem, image: #imageLiteral(resourceName: "search"), tag: 0)
        vcFavoritePictures.tabBarItem = UITabBarItem(title: .favoritesItem, image: #imageLiteral(resourceName: "tickBox"), tag: 1)
        vcSettings.tabBarItem = UITabBarItem(title: .settingsItem, image: #imageLiteral(resourceName: "settings"), tag: 2)

        viewControllers = [vcFavoriteCategories, vcFavoritePictures, vcSettings]

        selectedViewController = viewControllers?.last
    }
}
