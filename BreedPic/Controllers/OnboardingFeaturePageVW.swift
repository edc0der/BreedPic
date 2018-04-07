//
//  OnboardingFeaturePageVW.swift
//  BreedPic
//
//  Created by Eduard Moya on 4/5/18.
//  Copyright © 2018 Eduard Moya. All rights reserved.
//

import UIKit

class OnboardingFeaturePageVW: UIView {
    @IBOutlet var vwContent: UIView!
    @IBOutlet weak var lblTitle: UILabel!

    @IBOutlet weak var imgFirst: UIImageView!
    @IBOutlet weak var lblFirstTitle: UILabel!
    @IBOutlet weak var lblFirstDescription: UILabel!

    @IBOutlet weak var imgSecond: UIImageView!
    @IBOutlet weak var lblSecondTitle: UILabel!
    @IBOutlet weak var lblSecondDescription: UILabel!

    @IBOutlet weak var imgThird: UIImageView!
    @IBOutlet weak var lblThirdTitle: UILabel!
    @IBOutlet weak var lblThirdDescription: UILabel!

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    func commonInit() -> Void {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: className(target: self), bundle: bundle)
        guard let view = nib.instantiate(withOwner: self, options: nil).first as? UIView else { return }
        view.frame = bounds
        self.addSubview(view)
    }

    func prepare(type: PageType) -> Void {
        switch type {
            case .sections:
                lblTitle.text = .howItWorks

                imgFirst.image = #imageLiteral(resourceName: "search")
                lblFirstTitle.text = .feedTab
                lblFirstDescription.text = .feedDescription

                imgSecond.image = #imageLiteral(resourceName: "tickBox")
                lblSecondTitle.text = .favoritesTab
                lblSecondDescription.text = .favoritesDescription

                imgThird.image = #imageLiteral(resourceName: "settings")
                lblThirdTitle.text = .settingsTab
                lblThirdDescription.text = .settingsDescription
                break
            case .controls:
                lblTitle.text = .whatToDo

                imgFirst.image = #imageLiteral(resourceName: "tickBoxFilled")
                lblFirstTitle.text = .favIt
                lblFirstDescription.text = .favItDescription

                imgSecond.image = #imageLiteral(resourceName: "download")
                lblSecondTitle.text = .downloadIt
                lblSecondDescription.text = .downloadItDescription

                imgThird.image = #imageLiteral(resourceName: "share")
                lblThirdTitle.text = .shareIt
                lblThirdDescription.text = .shareItDescription
                break
            default:
                lblTitle.text = ""

                imgFirst.image = nil
                lblFirstTitle.text = ""
                lblFirstDescription.text = ""

                imgSecond.image = nil
                lblSecondTitle.text = ""
                lblSecondDescription.text = ""

                imgThird.image = nil
                lblThirdTitle.text = ""
                lblThirdDescription.text = ""
                break
        }
    }
}
