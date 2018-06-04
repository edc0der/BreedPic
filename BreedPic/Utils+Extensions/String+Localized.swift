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
}
