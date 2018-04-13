//
//  OnboardingInfoPageTVC.swift
//  BreedPic
//
//  Created by Eduard Moya on 4/12/18.
//  Copyright © 2018 Eduard Moya. All rights reserved.
//

import UIKit

class OnboardingInfoPageTVCViewModel: NSObject {
    var vmIcon: UIImage?
    var vmTitle: String?
    var vmDescription: String?

    init(item: [String : Any]) {
//        guard let icon = item["image"] as? UIImage, let title = item["title"] as? String, let desc = item["description"] as? String else { return }
//        vmIcon = icon
//        vmTitle = title
//        vmDescription = desc
        vmIcon = item["image"] as? UIImage ?? nil
        vmTitle = item["title"] as? String ?? ""
        vmDescription = item["description"] as? String ?? nil
    }
}

class OnboardingInfoPageTVC: UITableViewCell {

    @IBOutlet weak var imgIcon: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    var viewModel: OnboardingInfoPageTVCViewModel?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
