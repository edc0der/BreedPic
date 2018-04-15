//
//  UIViewController+MakeRoot.swift
//  BreedPic
//
//  Created by Eduard Moya on 4/15/18.
//  Copyright © 2018 Eduard Moya. All rights reserved.
//

import UIKit

extension UIViewController {
    func setAsRoot() -> Void {
        let window = UIApplication.shared.keyWindow ?? UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = self
    }
}
