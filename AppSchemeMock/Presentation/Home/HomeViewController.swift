//
//  HomeViewController.swift
//  AppSchemeMock
//
//  Created by JunHyeok Lee on 1/25/24.
//

import UIKit

final class HomeViewController: UIViewController {
    
    private let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Home"
        label.textColor = .label
        return label
    }()
    
    // MARK: - Life Cycle
    
    static func create() -> HomeViewController {
        return HomeViewController()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        view.backgroundColor = .systemBackground
        addSubviews()
        setupLayoutConstraints()
    }
}

// MARK: - Layout
extension HomeViewController {
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
