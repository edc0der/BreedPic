//
//  OnboardingPVC.swift
//  BreedPic
//
//  Created by Eduard Moya on 4/4/18.
//  Copyright © 2018 Eduard Moya. All rights reserved.
//

import UIKit

class OnboardingPVC: UIViewController {

    var pageController: UIPageViewController!
    let pagesCount = 2

    override func viewDidLoad() {
        super.viewDidLoad()

        pageController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        pageController.delegate = self
        pageController.dataSource = self
        pageController.view.frame = view.bounds

        let vcInitialPage = viewControllerAtIndex(0)
        pageController.setViewControllers([vcInitialPage], direction: .forward, animated: false, completion: nil)
        addChildViewController(pageController)
        view.addSubview(pageController.view)
        pageController.didMove(toParentViewController: self)

        //TODO: Improve page control -- page indicator and dismissal
        let pageControl = UIPageControl.appearance(whenContainedInInstancesOf: [UIPageViewController.self])
        pageControl.currentPageIndicatorTintColor = UIColor.black
        pageControl.pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.2)
        pageControl.numberOfPages = pagesCount - 1
    }

    func viewControllerAtIndex(_ index: Int8) -> OnboardingPageChildVC {
        let childVC = OnboardingPageChildVC(nibName: String.className(target: OnboardingPageChildVC.self), bundle: nil)
        childVC.index = index
        return childVC
    }
}

extension OnboardingPVC: UIPageViewControllerDelegate {

    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return pagesCount
    }

    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
}

extension OnboardingPVC: UIPageViewControllerDataSource {

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewController = viewController as? OnboardingPageChildVC, viewController.index > 0 else { return nil }
        return viewControllerAtIndex(viewController.index - 1)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewController = viewController as? OnboardingPageChildVC else { return nil }

        if viewController.index == pagesCount {
            return nil
        }
        return viewControllerAtIndex(viewController.index + 1)
    }

    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        guard let viewController = pendingViewControllers.first as? OnboardingPageChildVC else {
            return
        }
        if viewController.index == pagesCount {
            if let user = SessionManager.shared.currentUser {
                user.hasSeenOnboarding = true
            }
            dismiss(animated: true, completion: nil)
        }
    }
}
