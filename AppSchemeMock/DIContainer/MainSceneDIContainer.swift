//
//  MainSceneDIContainer.swift
//  AppSchemeMock
//
//  Created by JunHyeok Lee on 1/25/24.
//

import UIKit

final class MainSceneDIContainer {
    func makeTabBarController() -> TabBarController {
        return TabBarController(dependencies: self)
    }
}

extension MainSceneDIContainer: TabBarDependencies {
    func makeHomeViewController() -> HomeViewController {
        return HomeViewController.create()
    }
    
    func makeSearchViewController() -> SearchViewController {
        return SearchViewController.create()
    }
    
    func makeSettingViewController() -> SettingViewController {
        return SettingViewController.create()
    }
    
    func makeMyPageViewController() -> MyPageViewController {
        return MyPageViewController.create()
    }
}
