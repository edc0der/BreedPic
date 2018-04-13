//
//  OnboardingFeaturePageVW.swift
//  BreedPic
//
//  Created by Eduard Moya on 4/5/18.
//  Copyright © 2018 Eduard Moya. All rights reserved.
//

import UIKit

class OnboardingFeaturePageVWViewModel: NSObject {

    var title: String?
    var items = [OnboardingInfoPageTVCViewModel]()

    init(items: [[String : Any]]) {
        for item in items {
            self.items.append(OnboardingInfoPageTVCViewModel(item: item))
        }
    }

    //change this to request if backend setup
    func loadItems(type: PageType) -> Void {
        switch type {
        case .sections:
            title = .howItWorks
            items = [
                OnboardingInfoPageTVCViewModel.init(item: ["imageName" : #imageLiteral(resourceName: "search"),
                                                           "title" : String.feedTab,
                                                           "description" : String.feedDescription]),
                OnboardingInfoPageTVCViewModel.init(item: ["imageName" : #imageLiteral(resourceName: "tickBox"),
                                                           "title" : String.favoritesTab,
                                                           "description" : String.favoritesDescription]),
                OnboardingInfoPageTVCViewModel.init(item: ["imageName" : #imageLiteral(resourceName: "settings"),
                                                           "title" : String.settingsTab,
                                                           "description" : String.settingsDescription])]
            break
        case .controls:
            title = .whatToDo
            items = [
                OnboardingInfoPageTVCViewModel.init(item: ["imageName" : #imageLiteral(resourceName: "tickBoxFilled"),
                                                           "title" : String.favIt,
                                                           "description" : String.favItDescription]),
                OnboardingInfoPageTVCViewModel.init(item: ["imageName" : #imageLiteral(resourceName: "download"),
                                                           "title" : String.downloadIt,
                                                           "description" : String.downloadItDescription]),
                OnboardingInfoPageTVCViewModel.init(item: ["imageName" : #imageLiteral(resourceName: "share"),
                                                           "title" : String.shareIt,
                                                           "description" : String.shareItDescription])]
            break
        default:
            title = nil
            items = [
                OnboardingInfoPageTVCViewModel.init(item: ["title" : "",
                                                           "description" : ""]),
                OnboardingInfoPageTVCViewModel.init(item: ["title" : "",
                                                           "description" : ""]),
                OnboardingInfoPageTVCViewModel.init(item: ["title" : "",
                                                           "description" : ""])]
            break
        }
    }
}

class OnboardingFeaturePageVW: UIView {
    @IBOutlet private var vwContent: UIView!
    @IBOutlet private weak var lblTitle: UILabel!

    @IBOutlet private weak var imgFirst: UIImageView!
    @IBOutlet private weak var lblFirstTitle: UILabel!
    @IBOutlet private weak var lblFirstDescription: UILabel!

    @IBOutlet private weak var imgSecond: UIImageView!
    @IBOutlet private weak var lblSecondTitle: UILabel!
    @IBOutlet private weak var lblSecondDescription: UILabel!

    @IBOutlet private weak var imgThird: UIImageView!
    @IBOutlet private weak var lblThirdTitle: UILabel!
    @IBOutlet private weak var lblThirdDescription: UILabel!

    var viewModel: OnboardingFeaturePageVWViewModel?

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

    }
}
