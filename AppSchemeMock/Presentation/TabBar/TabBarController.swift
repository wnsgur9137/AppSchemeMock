//
//  TabBarController.swift
//  AppSchemeMock
//
//  Created by JunHyeok Lee on 1/25/24.
//

import UIKit

protocol TabBarDependencies {
    func makeHomeViewController() -> HomeViewController
    func makeSearchViewController() -> SearchViewController
    func makeSettingViewController() -> SettingViewController
    func makeMyPageViewController() -> MyPageViewController
}

final class TabBarController: UITabBarController {
    
    private let dependencies: TabBarDependencies
    
    init(dependencies: TabBarDependencies) {
        self.dependencies = dependencies
        super.init(nibName: nil, bundle: nil)
        
        tabBar.tintColor = .systemBackground
        tabBar.backgroundColor = .label
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func start() {
        let pages: [TabBarPage] = [.home, .search, .setting, .myPage]
            .sorted(by: { $0.pageOrderNumber() < $1.pageOrderNumber() })
        let controllers: [UINavigationController] = pages.map({ getTabController($0) })
        prepareTabBarController(with: controllers)
    }
    
    func selected(page: TabBarPage) {
        selectedIndex = page.pageOrderNumber()
    }
    
    private func getTabController(_ page: TabBarPage) -> UINavigationController {
        var navigationController: UINavigationController?
        switch page {
        case .home:
            let viewController = dependencies.makeHomeViewController()
            navigationController = UINavigationController(rootViewController: viewController)
        case .search:
            let viewController = dependencies.makeSearchViewController()
            navigationController = UINavigationController(rootViewController: viewController)
        case .setting:
            let viewController = dependencies.makeSettingViewController()
            navigationController = UINavigationController(rootViewController: viewController)
        case .myPage:
            let viewController = dependencies.makeMyPageViewController()
            navigationController = UINavigationController(rootViewController: viewController)
        }
        navigationController?.tabBarItem = UITabBarItem(title: page.pageTitle(),
                                                       image: page.pageImage(),
                                                       selectedImage: page.pageSelectedImage())
        return navigationController ?? UINavigationController()
    }
    
    private func prepareTabBarController(with controllers: [UINavigationController]) {
        setViewControllers(controllers, animated: true)
        selectedIndex = TabBarPage.home.pageOrderNumber()
        tabBar.isTranslucent = false
    }
}
