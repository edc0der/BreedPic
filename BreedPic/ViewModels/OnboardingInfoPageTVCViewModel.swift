//
//  OnboardingInfoPageTVCViewModel.swift
//  BreedPic
//
//  Created by Eduard Moya on 4/13/18.
//  Copyright © 2018 Eduard Moya. All rights reserved.
//

import Foundation
import UIKit

class OnboardingInfoPageTVCViewModel: NSObject {
    var vmIcon: UIImage?
    var vmTitle: String?
    var vmDescription: String?

    override init() {
        super.init()
    }

    init(item: [String : Any]) {
        if let iconName = item["imageName"] as? String {
            vmIcon = UIImage(named: iconName)
        }
        vmTitle = item["title"] as? String ?? ""
        vmDescription = item["description"] as? String ?? ""
    }
}
