//
//  FormCell.swift
//  FinancialApp
//
//  Created by Anderson Oliveira on 10/09/22.
//

import UIKit

final class FormCell: UIView, ViewConfiguration {
    
    private lazy var mainVerticalStackView: UIStackView = makeStackView(withOrientation: .vertical, withSpacing: 8)
    
    private lazy var initialInvestmentComponent = InvestmentTextFieldAndAmountComponent(
        inputAmountField: "Enter your initial investment amount",
        descriptionLabel: "Initial investment amount",
        acronymCurrency: "")
    
    private lazy var monthlyCostComponent = InvestmentTextFieldAndAmountComponent(
        inputAmountField: "Monthly dollar cost averaging amount",
        descriptionLabel: "Monthly dollar cost averaging amount",
        acronymCurrency: "")
    
    private lazy var initialDateOfInvestmentComponent = InvestmentTextFieldAndAmountComponent(
        inputAmountField: "Enter the initial date of investment",
        descriptionLabel: "Initial date of investment",
        acronymCurrency: "")
    
    private lazy var sliderControl: UISlider = {
        let slider = UISlider()
        return slider
    }()
    
    init() {
        super.init(frame: .zero)
        setupViews()
    }
    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }
    
    func updateCurrency (asset: Asset) {
        [initialInvestmentComponent, monthlyCostComponent].forEach { $0.updateAcronymCurrency(currency: asset.searchResult.currency.addBrackets())
        }
    }
    
    
    //MARK: ViewConfiguration
    func configViews() {
    }
    
    func buildViews() {
        addSubview(mainVerticalStackView)
        [initialInvestmentComponent, monthlyCostComponent, initialDateOfInvestmentComponent].forEach(mainVerticalStackView.addArrangedSubview)
    }
    
    func setupConstraints() {
        mainVerticalStackView.anchor(top: safeAreaLayoutGuide.topAnchor, leading: leadingAnchor, bottom: safeAreaLayoutGuide.bottomAnchor, trailing: trailingAnchor, paddingTop: 8, paddingBottom: 8, paddingLeft: 16, paddingRight: 16)
    }
}
