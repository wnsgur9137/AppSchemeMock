//
//  SearchViewController.swift
//  AppSchemeMock
//
//  Created by JunHyeok Lee on 1/25/24.
//

import UIKit

final class SearchViewController: UIViewController {
    
    private let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Search"
        label.textColor = .label
        return label
    }()
    
    // MARK: - Life Cycle
    
    static func create() -> SearchViewController {
        return SearchViewController()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addSubviews()
        setupLayoutConstraints()
    }
}

// MARK: - Layout
extension SearchViewController {
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
