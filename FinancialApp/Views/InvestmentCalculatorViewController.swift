//
//  InvestmentCalculatorViewController.swift
//  FinancialApp
//
//  Created by Anderson Oliveira on 10/09/22.
//

import UIKit

final class InvestmentCalculatorViewController: UIViewController, ViewConfiguration {
    
    private lazy var calculatorComponent = CalculatorCell()
    private lazy var formComponent = FormCell()
    private lazy var contentStackView: UIStackView = makeStackView(withOrientation: .vertical, withSpacing: 4)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    func configViews() {
        view.backgroundColor = .white
    }
    
    func buildViews() {
        view.addSubview(contentStackView)
        [calculatorComponent, formComponent].forEach(contentStackView.addArrangedSubview)
    }
    
    func setupConstraints() {
                contentStackView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor, paddingTop: 16, paddingLeft: 8, paddingRight: 8)
    }
}
