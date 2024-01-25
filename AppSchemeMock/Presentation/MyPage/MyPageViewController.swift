//
//  MyPageViewController.swift
//  AppSchemeMock
//
//  Created by JunHyeok Lee on 1/25/24.
//

import UIKit

final class MyPageViewController: UIViewController {
    
    private let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "MyPage"
        label.textColor = .label
        return label
    }()
    
    // MARK: - Life Cycle
    
    static func create() -> MyPageViewController {
        return MyPageViewController()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addSubviews()
        setupLayoutConstraints()
    }
}

// MARK: - Layout
extension MyPageViewController {
    private func addSubviews() {
        view.addSubview(label)
    }
    
    private func setupLayoutConstraints() {
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
}
