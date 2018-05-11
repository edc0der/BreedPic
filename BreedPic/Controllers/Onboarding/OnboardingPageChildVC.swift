//
//  OnboardingPageChildVC.swift
//  BreedPic
//
//  Created by Eduard Moya on 4/4/18.
//  Copyright © 2018 Eduard Moya. All rights reserved.
//

import UIKit

enum PageType: Int8 {
    case sections = 0, controls, breedSelection
}

class OnboardingPageChildVC: UIViewController {

    var index: Int8 = -1

    @IBOutlet private weak var vwContent: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        prepareSubView(type: PageType(rawValue: index)!)
    }

    func prepareSubView(type: PageType) -> Void {
        var viewForType: UIView?

        switch type {
        case .sections, .controls:
            let vwFeature = OnboardingInfoPageVW()
            vwFeature.pageType = type
            viewForType = vwFeature
        default:
            break
        }

        if let subView = viewForType {
            subView.translatesAutoresizingMaskIntoConstraints = false
            vwContent.addSubview(subView)
            
            let lcLeft = NSLayoutConstraint(item: subView, attribute: .left, relatedBy: .equal, toItem: vwContent, attribute: .left, multiplier: 1.0, constant: 0.0)
            let lcRight = NSLayoutConstraint(item: subView, attribute: .right, relatedBy: .equal, toItem: vwContent, attribute: .right, multiplier: 1.0, constant: 0.0)
            let lcVertical = NSLayoutConstraint(item: subView, attribute: .centerY, relatedBy: .equal, toItem: vwContent, attribute: .centerY, multiplier: 1.0, constant: 0.0)
            vwContent.addConstraints([lcLeft, lcRight, lcVertical])
        }
    }
}
