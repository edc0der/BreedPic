//
//  String+ClassName.swift
//  BreedPic
//
//  Created by Eduard Moya on 4/16/18.
//  Copyright © 2018 Eduard Moya. All rights reserved.
//

import Foundation

extension String {
    //TODO: Remove the need for this func -- Apply generics instances
    static func className(target: AnyObject) -> String {
        let nameSpaceClassName = NSStringFromClass(type(of: target))
        guard let className = nameSpaceClassName.components(separatedBy: ".").last else {
            return ""
        }
        return className
    }
}
