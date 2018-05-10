//
//  OnboardingInfoPageVWViewModel.swift
//  BreedPic
//
//  Created by Eduard Moya on 4/13/18.
//  Copyright © 2018 Eduard Moya. All rights reserved.
//

import Foundation

typealias DidCompleteTask = (Bool) -> ()

class OnboardingInfoPageVWViewModel: NSObject {
    var title: String?
    var items = [OnboardingInfoPageTVCViewModel]()
    var isUpdating = false

    //TODO: Remove from viewModel shouldn't be here
    let cellNibName = "OnboardingInfoPageTVC"
    let cellReuseIdentifier = "OnboardingInfoPageTVCIdentifier"

    override init() {
        super.init()
    }

    func viewModelForCell(at index: Int) -> OnboardingInfoPageTVCViewModel {
        return items[index]
    }

    func numberOfRows() -> Int {
        return items.count
    }

    func numberOfSections() -> Int {
        return 1
    }

    //change this to request if backend setup
    func loadItems(type: PageType, completion: DidCompleteTask) -> Void {
        var wasSuccessful = true
        defer {
            isUpdating = false
            completion(wasSuccessful)
        }
        isUpdating = true

        switch type {
        case .sections:
            title = .howItWorks
            items = [ OnboardingInfoPageTVCViewModel(item: ["imageName" : "search", "title" : String.feedTab, "description" : String.feedDescription]),
                      OnboardingInfoPageTVCViewModel(item: ["imageName" : "tickBox", "title" : String.favoritesTab, "description" : String.favoritesDescription]),
                      OnboardingInfoPageTVCViewModel(item: ["imageName" : "settings", "title" : String.settingsTab, "description" : String.settingsDescription])]
            break
        case .controls:
            title = .whatToDo
            items = [ OnboardingInfoPageTVCViewModel(item: ["imageName" : "tickBoxFilled", "title" : String.favIt, "description" : String.favItDescription]),
                      OnboardingInfoPageTVCViewModel(item: ["imageName" : "download", "title" : String.downloadIt, "description" : String.downloadItDescription]),
                      OnboardingInfoPageTVCViewModel(item: ["imageName" : "share", "title" : String.shareIt, "description" : String.shareItDescription])]
            break
        default:
            title = nil
            items = [ OnboardingInfoPageTVCViewModel(item: ["title" : "", "description" : ""]),
                      OnboardingInfoPageTVCViewModel(item: ["title" : "", "description" : ""]),
                      OnboardingInfoPageTVCViewModel(item: ["title" : "", "description" : ""])]
            wasSuccessful = false
            break
        }
    }
}
