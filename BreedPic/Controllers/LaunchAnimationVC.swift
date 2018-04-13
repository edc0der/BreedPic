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

        let jsonStr = "{\"gender\":\"male\",\"name\":{\"title\":\"mr\",\"first\":\"samuel\",\"last\":\"simpson\"},\"location\":{\"street\":\"9562 pecan acres ln\",\"city\":\"san jose\",\"state\":\"connecticut\",\"postcode\":21449},\"email\":\"samuel.simpson@example.com\",\"login\":{\"username\":\"beautifulrabbit110\",\"password\":\"blow\",\"salt\":\"A2vtF0Uv\",\"md5\":\"a8b10fb2d7dcf6e70e0cc7e5a45fb87e\",\"sha1\":\"104f72bf15107f06e756e4488e2db948a8837947\",\"sha256\":\"38de6e79a91a7fe521b7fa6d2895e365980b7ccfa1e427b60e296a129ddd1bec\"},\"dob\":\"1982-06-03 11:33:50\",\"registered\":\"2009-02-10 15:28:15\",\"phone\":\"(825)-129-1989\",\"cell\":\"(880)-644-3075\",\"id\":{\"name\":\"SSN\",\"value\":\"482-36-1483\"},\"picture\":{\"large\":\"https://randomuser.me/api/portraits/men/58.jpg\",\"medium\":\"https://randomuser.me/api/portraits/med/men/58.jpg\",\"thumbnail\":\"https://randomuser.me/api/portraits/thumb/men/58.jpg\"},\"nat\":\"US\"}"
        if let jsonData = jsonStr.data(using: .utf8) {
            do {
                let user = try JSONDecoder().decode(User.self, from: jsonData)
                if let userName = user.name?.first {
                    print("userName: ", userName)
                }
            } catch {
                print("Error decoding")
            }
        }

        let vc = OnboardingPVC(nibName: className(target: OnboardingPVC.self), bundle: nil)
        let window = UIApplication.shared.keyWindow ?? UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = vc
    }
}
