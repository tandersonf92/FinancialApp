//
//  SearchTableViewController.swift
//  FinancialApp
//
//  Created by Anderson Oliveira on 08/09/22.
//

protocol ViewConfiguration {
    func configViews()
    func buildViews()
    func setupConstraints()
    func setupViews()
}

extension ViewConfiguration {
    func setupViews() {
        configViews()
        buildViews()
        setupConstraints()
    }
}
