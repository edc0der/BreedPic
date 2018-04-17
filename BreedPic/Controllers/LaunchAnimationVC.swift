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

        var breedList: [Breed]?
        var userList: [UserProfile]?
        let client = APIClient()

        client.getBreedList { (list) in
            breedList = list
            client.getUser(amount: 50, completion: { (dict) in
                userList = dict
                SessionManager.shared.presentLoginScreen()
            })
        }

    }
}
