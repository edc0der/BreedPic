//
//  OnboardingPageOneVW.swift
//  BreedPic
//
//  Created by Eduard Moya on 4/5/18.
//  Copyright © 2018 Eduard Moya. All rights reserved.
//

import UIKit

class OnboardingPageOneVW: UIView {

    @IBOutlet var vwContent: UIView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblFeedTitle: UILabel!
    @IBOutlet weak var lblFeedDescription: UILabel!
    @IBOutlet weak var lblFavoritesTitle: UILabel!
    @IBOutlet weak var lblFavoritesDescription: UILabel!
    @IBOutlet weak var lblSettingsTitle: UILabel!
    @IBOutlet weak var lblSettingsDescription: UILabel!

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
        let nib = UINib(nibName: "OnboardingPageOneVW", bundle: bundle)
        guard let view = nib.instantiate(withOwner: self, options: nil).first as? UIView else { return }
        view.frame = bounds
        self.addSubview(view)
    }
}
