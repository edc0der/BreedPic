//
//  UIViewControlle+LoadNib.swift
//  BreedPic
//
//  Created by Eduard Moya on 6/3/18.
//  Copyright © 2018 Eduard Moya. All rights reserved.
//

import UIKit

extension UIViewController: NibLoadableView {
    static var nibName: String {
        return String(describing: self)
    }

    class func loadFromNib<T: UIViewController>() -> T {
        return T(nibName: nibName, bundle: nil)
    }
}
