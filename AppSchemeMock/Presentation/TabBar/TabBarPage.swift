//
//  TabBarPage.swift
//  AppSchemeMock
//
//  Created by JunHyeok Lee on 1/25/24.
//

import UIKit

enum TabBarPage {
    case home
    case search
    case setting
    case myPage
    
    init?(index: Int) {
        switch index {
        case 0: self = .home
        case 1: self = .search
        case 2: self = .setting
        case 3: self = .myPage
        default: return nil
        }
    }
    
    func pageTitle() -> String {
        switch self {
        case .home: return "Home"
        case .search: return "Search"
        case .setting: return "Setting"
        case .myPage: return "MyPage"
        }
    }
    
    func pageOrderNumber() -> Int {
        switch self {
        case .home: return 0
        case .search: return 1
        case .setting: return 2
        case .myPage: return 3
        }
    }
    
    func pageImage() -> UIImage {
        switch self {
        case .home: return UIImage()
        case .search: return UIImage()
        case .setting: return UIImage()
        case .myPage: return UIImage()
        }
    }
    
    func pageSelectedImage() -> UIImage {
        switch self {
        case .home: return UIImage()
        case .search: return UIImage()
        case .setting: return UIImage()
        case .myPage: return UIImage()
        }
    }
}
