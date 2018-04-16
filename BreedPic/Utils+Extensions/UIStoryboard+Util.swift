//
//  UIStoryboard+Util.swift
//  BreedPic
//
//  Created by Eduard Moya on 4/16/18.
//  Copyright © 2018 Eduard Moya. All rights reserved.
//

import UIKit

extension UIStoryboard {
    private static func main() -> UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }

    static func mainNavigationController() -> UINavigationController {
        guard let navigation = main().instantiateViewController(withIdentifier: "MainNavigation") as? UINavigationController else {
            fatalError("Could not instantiate navigation controller")
        }
        return navigation
    }
}
