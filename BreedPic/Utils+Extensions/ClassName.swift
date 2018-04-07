//
//  ClassName.swift
//  BreedPic
//
//  Created by Eduard Moya on 4/6/18.
//  Copyright © 2018 Eduard Moya. All rights reserved.
//

import Foundation

func className(target: AnyObject) -> String {
    let nameSpaceClassName = NSStringFromClass(type(of: target))
    if let className = nameSpaceClassName.components(separatedBy: ".").last {
        return className
    }
    return ""
}
