//
//  BreedFeedTableViewCell.swift
//  BreedPic
//
//  Created by Eduard Moya on 6/3/18.
//  Copyright © 2018 Eduard Moya. All rights reserved.
//

import UIKit
import PreviewTransition

class BreedFeedTableViewCell: ParallaxCell, NibLoadableView, ReusableView {

    var viewModel: FeedTableViewCellViewModel?

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func prepareForReuse() {
        super.prepareForReuse()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func configure(withViewModel: FeedTableViewCellViewModel) -> Void {
        //set viewModel
        viewModel = withViewModel
        //fill cell with viewModel data
        configureCell()
    }

    func configureCell() -> Void {
        viewModel?.loadImage(completion: { [weak self] in
            if let image = self?.viewModel?.image, let name = self?.viewModel?.name {
                DispatchQueue.main.async {
                    self?.setImage(image, title: name)
                }
            }
        })
    }
}
