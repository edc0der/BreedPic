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
            SessionManager.shared.pushLoginScreen()
            return
        }
        if !user.hasSeenOnboarding {
            let viewController = OnboardingPVC(nibName: String.className(target: OnboardingPVC.self), bundle: nil)
            viewController.modalPresentationStyle = .overFullScreen
            navigationController?.present(viewController, animated: true, completion: nil)
        }
        setupTabItems()
    }

    func setupTabItems() -> Void {
        let vcFavoriteCategories = FeedTableViewController(nibName: String.className(target: FeedTableViewController.self), bundle: nil)
        let vcFavoritePictures = FavoritesCollectionViewController(nibName: String.className(target: FavoritesCollectionViewController.self), bundle: nil)
        let vcSettings = SettingsVC(nibName: String.className(target: SettingsVC.self), bundle: nil)

        vcFavoriteCategories.tabBarItem = UITabBarItem(title: .feedItem, image: #imageLiteral(resourceName: "search"), tag: 0)
        vcFavoritePictures.tabBarItem = UITabBarItem(title: .favoritesItem, image: #imageLiteral(resourceName: "tickBox"), tag: 1)
        vcSettings.tabBarItem = UITabBarItem(title: .settingsItem, image: #imageLiteral(resourceName: "settings"), tag: 2)

        viewControllers = [vcFavoriteCategories, vcFavoritePictures, vcSettings]
        selectedViewController = viewControllers?.first
    }
}
