//
//  Generics+Utilities.swift
//  BreedPic
//
//  Created by Eduard Moya on 4/6/18.
//  Copyright © 2018 Eduard Moya. All rights reserved.
//

import Foundation

func randomizeArray<T>(_ arr: inout Array<T>) -> Void {
    let maxIndex = arr.count - 1

    for i in 0...maxIndex {
        arr.swapAt(i, Int(arc4random_uniform(UInt32(arr.count))))
    }
}
