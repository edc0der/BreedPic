//
//  OnboardingInfoPageTVC.swift
//  BreedPic
//
//  Created by Eduard Moya on 4/12/18.
//  Copyright © 2018 Eduard Moya. All rights reserved.
//

import UIKit

class OnboardingInfoPageTVC: UITableViewCell {

    @IBOutlet weak private var imgIcon: UIImageView!
    @IBOutlet weak private var lblTitle: UILabel!
    @IBOutlet weak private var lblDescription: UILabel!

    var viewModel: OnboardingInfoPageTVCViewModel? {
        didSet {
            self.imgIcon.image = viewModel?.vmIcon
            self.lblTitle.text = viewModel?.vmTitle
            self.lblDescription.text = viewModel?.vmDescription
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
