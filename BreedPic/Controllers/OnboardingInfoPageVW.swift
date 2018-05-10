//
//  OnboardingInfoPageVW.swift
//  BreedPic
//
//  Created by Eduard Moya on 4/12/18.
//  Copyright © 2018 Eduard Moya. All rights reserved.
//

import UIKit

fileprivate let heightAverageOffsetPerCell: CGFloat = 8.0

class OnboardingInfoPageVW: UIView {
    
    @IBOutlet var view: UIView!
    @IBOutlet weak private var lblTitle: UILabel!
    @IBOutlet weak private var tblFeatures: UITableView!
    @IBOutlet weak private var lcTableHeight: NSLayoutConstraint!
    @IBOutlet var viewModel: OnboardingInfoPageVWViewModel!

    var pageType: PageType? {
        didSet {
            guard let pageType = pageType else { return }
            viewModel.loadItems(type: pageType) { (success) in
                if success {
                    DispatchQueue.main.async {
                        self.lblTitle.text = self.viewModel.title
                        self.tblFeatures.reloadData()
                    }
                }
            }
        }
    }

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
        let nib = UINib(nibName: String.className(target: self), bundle: bundle)
        guard let view = nib.instantiate(withOwner: self, options: nil).first as? UIView else { return }
        view.frame = bounds
        self.addSubview(view)

        self.tblFeatures.delegate = self
        self.tblFeatures.dataSource = self
        //TODO: Improve register cell
        self.tblFeatures.register(UINib(nibName: viewModel.cellNibName, bundle: nil), forCellReuseIdentifier: viewModel.cellReuseIdentifier)
    }
}

extension OnboardingInfoPageVW: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: viewModel.cellReuseIdentifier, for: indexPath) as! OnboardingInfoPageTVC
        cell.viewModel = viewModel.viewModelForCell(at: indexPath.row)
        return cell
    }
}

extension OnboardingInfoPageVW: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let lastIndexPath = tableView.indexPathsForVisibleRows?.last, indexPath.row == lastIndexPath.row {
            let newHeight = cell.frame.origin.y + cell.frame.size.height
            updateTableHeight(to: newHeight)
        }
    }

    func updateTableHeight(to height: CGFloat) -> Void {
        DispatchQueue.main.async {
            self.lcTableHeight.constant = height
            self.view.layoutIfNeeded()
        }
    }
}
