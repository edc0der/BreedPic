//
//  String+Localized.swift
//  BreedPic
//
//  Created by Eduard Moya on 4/6/18.
//  Copyright © 2018 Eduard Moya. All rights reserved.
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
    
    func localized(withComment comment:String) -> String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: comment)
    }
}

//MARK:- Main view
extension String {
    static let feedItem = "tabbar_item.feed".localized
    static let favoritesItem = "tabbar_item.favorites".localized
    static let settingsItem = "tabbar_item.settings".localized
}

//MARK:- Onboarding page 1
extension String {
    static let howItWorks = "label.how_it_works".localized
    static let feedTab = "label.feed_tab".localized
    static let feedDescription = "label.feed_description".localized
    static let favoritesTab = "label.favorites_tab".localized
    static let favoritesDescription = "label.favorites_description".localized
    static let settingsTab = "label.settings_tab".localized
    static let settingsDescription = "label.settings_description".localized
}

//MARK:- Onboarding page 2
extension String {
    static let whatToDo = "label.what_to_do".localized
    static let favIt = "label.fav_that_image".localized
    static let favItDescription = "label.fav_that_image_description".localized
    static let downloadIt = "label.download_image".localized
    static let downloadItDescription = "label.download_image_description".localized
    static let shareIt = "label.share_it".localized
    static let shareItDescription = "label.share_it_description".localized
}

//MARK:- Onboarding page 3
extension String {
    
}
