//
//  AppDIContainer.swift
//  AppSchemeMock
//
//  Created by JunHyeok Lee on 1/25/24.
//

import Foundation

final class AppDIContainer {
    func makeMainSceneDIContainer() -> MainSceneDIContainer {
        return MainSceneDIContainer()
    }
}
