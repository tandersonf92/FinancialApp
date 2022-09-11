//
//  InvestmentTextFieldAndAmountComponent.swift
//  FinancialApp
//
//  Created by Anderson Oliveira on 10/09/22.
//

import UIKit

final class InvestmentTextFieldAndAmountComponent: UIView, ViewConfiguration {
    
    private lazy var contentStackView: UIStackView = makeStackView(withOrientation: .vertical, withSpacing: -4)
    
    private lazy var inputAmountField: UITextField = makeTextField(placeholder: "", withFont: UIFont(name: "AvenirNext-Medium", size: 18))
    
    private lazy var labelHorizontalStackView: UIStackView = makeStackView(
        withOrientation: .horizontal,
        withSpacing: 4)
    
    private lazy var descriptionLabel: UILabel = makeLabel(
        withText: "",
        withFont: UIFont(name: "AvenirNext-Regular", size: 12),
        numberOfLines: 1,
        textColor: .darkGray)
    
    private lazy var acronymCurrency: UILabel = makeLabel(
        withText: "",
        withFont: UIFont(name: "AvenirNext-Regular", size: 12),
        textColor: .darkGray)
    
    //MARK: Init
    init(inputAmountField: String, descriptionLabel: String, acronymCurrency: String = "", textFieldBorderStyle: UITextField.BorderStyle = .none, textFieldHeight: CGFloat = 36){
        super.init(frame: .zero)
        setupViews()
        self.inputAmountField.placeholder = inputAmountField
        self.descriptionLabel.text = descriptionLabel
        self.acronymCurrency.text = acronymCurrency
        self.inputAmountField.borderStyle = textFieldBorderStyle
        self.inputAmountField.size(height: textFieldHeight)
    }
    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }
    
    
    func updateAcronymCurrency(currency: String) {
        acronymCurrency.text = currency
    }
    
    //MARK: ViewConfiguration
    func configViews() {
        descriptionLabel.setContentHuggingPriority(.init(rawValue: 951), for: .horizontal)
    }
    
    func buildViews() {
        addSubview(contentStackView)
        [inputAmountField, labelHorizontalStackView].forEach(contentStackView.addArrangedSubview)
        [descriptionLabel, acronymCurrency].forEach(labelHorizontalStackView.addArrangedSubview)
    }
    
    func setupConstraints() {
        contentStackView.setAnchorsEqual(to: self)
    }
}
