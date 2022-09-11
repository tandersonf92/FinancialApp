//
//  CalculatorCell.swift
//  FinancialApp
//
//  Created by Anderson Oliveira on 10/09/22.
//
import UIKit

final class CalculatorCell: UIView, ViewConfiguration {
    
    private lazy var mainContentVerticalStackView: UIStackView = makeStackView(
        withOrientation: .vertical,
        withSpacing: 4)
    
    private lazy var contentHorizontalStackView1: UIStackView = makeStackView(
        withOrientation: .horizontal,
        withSpacing: 4)
    
    private lazy var symbolLabel: UILabel = makeLabel(
        withText: "SPY",
        withFont: UIFont(name: "AvenirNext-DemiBold", size: 18))
    
    private lazy var nameLabel: UILabel = makeLabel(
        withText: "S&P 500 ETF",
        withFont: UIFont(name: "AvenirNext-Bold", size: 14),
        textColor: .lightGray)
    
    private lazy var verticalStackView1: UIStackView = makeStackView(
        withOrientation: .vertical)
    
    private lazy var contentHorizontalStackView2: UIStackView = makeStackView(
        withOrientation: .horizontal,
        withSpacing: 4)
    
    private lazy var textLabel21: UILabel = makeLabel(
        withText: "Current Value",
        withFont: UIFont(name: "AvenirNext", size: 12))
    
    private lazy var firstCurrencyAcronym: UILabel = makeLabel(
        withText: "(USD)",
        withFont: UIFont(name: "AvenirNext", size: 12))
    
    private lazy var textLabelBetweenTwoStacks: UILabel = makeLabel(
        withText: "5000",
        withFont: UIFont(name: "AvenirNext-DemiBold", size: 24))
    
    private lazy var verticalStackView2: UIStackView = makeStackView(
        withOrientation: .vertical)
    
    private lazy var contentHorizontalStackView3: UIStackView = makeStackView(
        withOrientation: .horizontal,
        withSpacing: 4)
    
    private lazy var textLabel31: UILabel = makeLabel(
        withText: "Investment amount",
        withFont: UIFont(name: "AvenirNext-Regular", size: 10))
    
    private lazy var voidView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var investmentAmountCurrencyLabel: UILabel = makeLabel(
        withText: "USD",
        withFont: UIFont(name: "AvenirNext-DemiBold", size: 10))
    
    private lazy var textLabel33: UILabel = makeLabel(
        withText: "100",
        withFont: UIFont(name: "AvenirNext-DemiBold", size: 10))
    
    private lazy var verticalStackView3: UIStackView = makeStackView(
        withOrientation: .vertical)
    
    private lazy var contentHorizontalStackView4: UIStackView = makeStackView(
        withOrientation: .horizontal,
        withSpacing: 4)
    
    private lazy var textLabel41: UILabel = makeLabel(
        withText: "Gain",
        withFont: UIFont(name: "AvenirNext-Regular", size: 10))
    
    private lazy var voidView2: UIView = .init()
    
    private lazy var textLabel42: UILabel = makeLabel(
        withText: "+100.25",
        withFont: UIFont(name: "AvenirNext-DemiBold", size: 10))
    
    private lazy var textLabel43: UILabel = makeLabel(
        withText: "[10.25%]",
        withFont: UIFont(name: "AvenirNext-DemiBold", size: 10),
        textColor: .systemGreen)
    
    private lazy var verticalStackView4: UIStackView = makeStackView(
        withOrientation: .vertical)
    
    private lazy var contentHorizontalStackView5: UIStackView = makeStackView(
        withOrientation: .horizontal)
    
    private lazy var textLabel51: UILabel = makeLabel(
        withText: "Anual Return",
        withFont: UIFont(name: "AvenirNext-Regular", size: 10))
    
    private lazy var textLabel52: UILabel = makeLabel(
        withText: "10.5%",
        withFont: UIFont(name: "AvenirNext-DemiBold", size: 10),
        textColor: .systemGreen)
    
    //MARK: Init
    init() {
        super.init(frame: .zero)
        setupViews()
    }
    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }
    
    func updateAssetSymbolAndAcronymCurrency(asset: Asset) {
        symbolLabel.text = asset.searchResult.symbol
        nameLabel.text = asset.searchResult.name
        firstCurrencyAcronym.text = asset.searchResult.currency
        investmentAmountCurrencyLabel.text = asset.searchResult.currency
    }
    
    //MARK: ViewConfiguration
    func configViews() {
        symbolLabel.setContentHuggingPriority(.init(rawValue: 951), for: .horizontal)
        textLabel21.setContentHuggingPriority(.init(rawValue: 951), for: .horizontal)
        
        investmentAmountCurrencyLabel.setContentHuggingPriority(.init(rawValue: 951), for: .horizontal)
        textLabel33.setContentHuggingPriority(.init(rawValue: 951), for: .horizontal)
        
        textLabel42.setContentHuggingPriority(.init(rawValue: 951), for: .horizontal)
        textLabel43.setContentHuggingPriority(.init(rawValue: 951), for: .horizontal)
        
        textLabel52.setContentHuggingPriority(.init(rawValue: 951), for: .horizontal)
    }
    
    func buildViews() {
        addSubview(mainContentVerticalStackView)
        [contentHorizontalStackView1, verticalStackView1, textLabelBetweenTwoStacks,  verticalStackView2, verticalStackView3,verticalStackView4].forEach(mainContentVerticalStackView.addArrangedSubview)
        
        [symbolLabel, nameLabel].forEach(contentHorizontalStackView1.addArrangedSubview)
        
        verticalStackView1.addArrangedSubview(contentHorizontalStackView2)
        [textLabel21, firstCurrencyAcronym].forEach(contentHorizontalStackView2.addArrangedSubview)
        
        verticalStackView2.addArrangedSubview(contentHorizontalStackView3)
        [textLabel31, investmentAmountCurrencyLabel, textLabel33].forEach(contentHorizontalStackView3.addArrangedSubview)
        
        verticalStackView3.addArrangedSubview(contentHorizontalStackView4)
        [textLabel41, voidView, textLabel42, textLabel43].forEach(contentHorizontalStackView4.addArrangedSubview)
        
        verticalStackView4.addArrangedSubview(contentHorizontalStackView5)
        [textLabel51, textLabel52].forEach(contentHorizontalStackView5.addArrangedSubview)
    }
    
    func setupConstraints() {
        mainContentVerticalStackView.anchor(top: safeAreaLayoutGuide.topAnchor, leading: leadingAnchor, bottom: safeAreaLayoutGuide.bottomAnchor, trailing: trailingAnchor, paddingTop: 16, paddingBottom: 16, paddingLeft: 16, paddingRight: 16)
    }
}
