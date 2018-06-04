//
//  BreedPictureViewController.swift
//  BreedPic
//
//  Created by Eduard Moya on 6/3/18.
//  Copyright © 2018 Eduard Moya. All rights reserved.
//

import UIKit
import PreviewTransition

class BreedPictureViewController: PTDetailViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

//MARK:- Actions
extension BreedPictureViewController {
    @objc func backButtonHandler() {
        popViewController()
    }
}
