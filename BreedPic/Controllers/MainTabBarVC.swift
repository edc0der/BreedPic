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

        guard let user = SessionManager.shared.currentUser else {
            //should return to login?
            return
        }
        if !user.hasSeenOnboarding {
            let viewController = OnboardingPVC(nibName: className(target: OnboardingPVC.self), bundle: nil)
            viewController.modalPresentationStyle = .overFullScreen
            navigationController?.present(viewController, animated: true, completion: nil)
        }

        let vcFavoriteCategories = FavoriteCategoriesVC(nibName: className(target: FavoriteCategoriesVC.self), bundle: nil)
        let vcFavoritePictures = FavoritePicturesVC(nibName: className(target: FavoritePicturesVC.self), bundle: nil)
        let vcSettings = SettingsVC(nibName: className(target: SettingsVC.self), bundle: nil)

        vcFavoriteCategories.tabBarItem = UITabBarItem(title: .feedItem, image: #imageLiteral(resourceName: "search"), tag: 0)
        vcFavoritePictures.tabBarItem = UITabBarItem(title: .favoritesItem, image: #imageLiteral(resourceName: "tickBox"), tag: 1)
        vcSettings.tabBarItem = UITabBarItem(title: .settingsItem, image: #imageLiteral(resourceName: "settings"), tag: 2)

        viewControllers = [vcFavoriteCategories, vcFavoritePictures, vcSettings]

        if user.hasFavoriteBreeds() {
            selectedViewController = viewControllers?.first
        } else {
            selectedViewController = viewControllers?.last
            //disable other tabs
        }
    }
}
