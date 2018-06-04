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

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

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
