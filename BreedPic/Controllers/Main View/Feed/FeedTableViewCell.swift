//
//  FeedTableViewCell.swift
//  BreedPic
//
//  Created by Eduard Moya on 5/10/18.
//  Copyright © 2018 Eduard Moya. All rights reserved.
//

import UIKit

class FeedTableViewCell: UITableViewCell, ReusableView, NibLoadableView {

    var viewModel: FeedTableViewCellViewModel?

    @IBOutlet weak var imgDog: UIImageView!
    @IBOutlet weak var btnFavorite: UIButton!
    @IBOutlet weak var btnDownload: UIButton!
    @IBOutlet weak var btnShare: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        imgDog.backgroundColor = UIColor.lightGray
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        imgDog.image = nil
    }

    func configure(withViewModel: FeedTableViewCellViewModel) -> Void {
        viewModel = withViewModel
        viewModel?.loadImage(completion: { [weak self](image) in
            if let strongSelf = self {
                DispatchQueue.main.async {
                    strongSelf.imgDog.image = image
                }
            }
        })
    }
}
