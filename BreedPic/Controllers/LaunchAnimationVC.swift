//
//  LaunchAnimationVC.swift
//  BreedPic
//
//  Created by Eduard Moya on 4/4/18.
//  Copyright © 2018 Eduard Moya. All rights reserved.
//

import UIKit

class LaunchAnimationVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let vc = OnboardingPVC(nibName: className(target: OnboardingPVC.self), bundle: nil)
        let window = UIApplication.shared.keyWindow ?? UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = vc
    }
}
