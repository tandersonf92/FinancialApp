//
//  CalculatorCell.swift
//  FinancialApp
//
//  Created by Anderson Oliveira on 10/09/22.
//
import UIKit

final class CalculatorCell: UIView, ViewConfiguration {

    static let identifier = "CalculatorCell"

    private lazy var mainContentVerticalStackView: UIStackView = makeStackView(withOrientation: .vertical, withSpacing: 4)

    private lazy var contentHorizontalStackView1: UIStackView = makeStackView(withOrientation: .horizontal, withSpacing: 4)

    private lazy var textLabel11: UILabel = makeLabel(withText: "SPY", withFont: UIFont(name: "AvenirNext-DemiBold", size: 18))

    private lazy var textLabel12: UILabel = makeLabel(withText: "S&P 500 ETF", withFont: UIFont(name: "AvenirNext-Bold", size: 14), textColor: .lightGray)

    private lazy var verticalStackView1: UIStackView = makeStackView(withOrientation: .vertical)

    private lazy var contentHorizontalStackView2: UIStackView = makeStackView(withOrientation: .horizontal, withSpacing: 4)

    private lazy var textLabel21: UILabel = makeLabel(withText: "Current Value", withFont: UIFont(name: "AvenirNext", size: 12), textColor: .black)

    private lazy var textLabel22: UILabel = makeLabel(withText: "(USD)", withFont: UIFont(name: "AvenirNext", size: 12), textColor: .black)

    private lazy var textLabelBetweenTwoStacks: UILabel = makeLabel(withText: "5000", withFont: UIFont(name: "AvenirNext-DemiBold", size: 24), textColor: .black)

    private lazy var verticalStackView2: UIStackView = makeStackView(withOrientation: .vertical)

    private lazy var contentHorizontalStackView3: UIStackView = makeStackView(withOrientation: .horizontal, withSpacing: 4)

    private lazy var textLabel31: UILabel = makeLabel(withText: "Investment amount", withFont: UIFont(name: "AvenirNext-Regular", size: 10))

    private lazy var voidView: UIView = {
       let view = UIView()
        return view
    }()

    private lazy var textLabel32: UILabel = makeLabel(withText: "USD", withFont: UIFont(name: "AvenirNext-DemiBold", size: 10))
    
    private lazy var textLabel33: UILabel = makeLabel(withText: "100", withFont: UIFont(name: "AvenirNext-DemiBold", size: 10))

    private lazy var verticalStackView3: UIStackView = makeStackView(withOrientation: .vertical)

    private lazy var contentHorizontalStackView4: UIStackView = makeStackView(withOrientation: .horizontal, withSpacing: 4)

    private lazy var textLabel41: UILabel = makeLabel(withText: "Gain", withFont: UIFont(name: "AvenirNext-Regular", size: 10))
    
    private lazy var voidView2: UIView = .init()

    private lazy var textLabel42: UILabel = makeLabel(withText: "+100.25", withFont: UIFont(name: "AvenirNext-DemiBold", size: 10))
    
    private lazy var textLabel43: UILabel = makeLabel(withText: "[10.25%]", withFont: UIFont(name: "AvenirNext-DemiBold", size: 10), textColor: .systemGreen)

    private lazy var verticalStackView4: UIStackView = makeStackView(withOrientation: .vertical)

    private lazy var contentHorizontalStackView5: UIStackView = makeStackView(withOrientation: .horizontal)
    
    private lazy var textLabel51: UILabel = makeLabel(withText: "Anual Return", withFont: UIFont(name: "AvenirNext-Regular", size: 10))

    private lazy var voidView3: UIView = .init()

    private lazy var textLabel52: UILabel = makeLabel(withText: "10.5%", withFont: UIFont(name: "AvenirNext-DemiBold", size: 10), textColor: .systemGreen)
    
    //MARK: Init
    init() {
        super.init(frame: .zero)
        setupViews()
    }
    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }

    //MARK: ViewConfiguration
    func configViews() {
        textLabel11.setContentHuggingPriority(.init(rawValue: 951), for: .horizontal) // ok
        textLabel21.setContentHuggingPriority(.init(rawValue: 951), for: .horizontal) // ok
        
        textLabel32.setContentHuggingPriority(.init(rawValue: 951), for: .horizontal) // ok
        textLabel33.setContentHuggingPriority(.init(rawValue: 951), for: .horizontal) // ok
        
        textLabel42.setContentHuggingPriority(.init(rawValue: 951), for: .horizontal) // ok
        textLabel43.setContentHuggingPriority(.init(rawValue: 951), for: .horizontal) // ok
        
        textLabel52.setContentHuggingPriority(.init(rawValue: 951), for: .horizontal) // ok
    }

    func buildViews() {
        addSubview(mainContentVerticalStackView)
        [contentHorizontalStackView1, verticalStackView1, textLabelBetweenTwoStacks,  verticalStackView2, verticalStackView3,verticalStackView4].forEach(mainContentVerticalStackView.addArrangedSubview)

        [textLabel11, textLabel12].forEach(contentHorizontalStackView1.addArrangedSubview)

        verticalStackView1.addArrangedSubview(contentHorizontalStackView2)
        [textLabel21, textLabel22].forEach(contentHorizontalStackView2.addArrangedSubview)

        verticalStackView2.addArrangedSubview(contentHorizontalStackView3)
        [textLabel31, textLabel32, textLabel33].forEach(contentHorizontalStackView3.addArrangedSubview)

        verticalStackView3.addArrangedSubview(contentHorizontalStackView4)
        [textLabel41, voidView, textLabel42, textLabel43].forEach(contentHorizontalStackView4.addArrangedSubview)

        verticalStackView4.addArrangedSubview(contentHorizontalStackView5)
        [textLabel51, textLabel52].forEach(contentHorizontalStackView5.addArrangedSubview)
    }

    func setupConstraints() {
        mainContentVerticalStackView.anchor(top: safeAreaLayoutGuide.topAnchor, leading: leadingAnchor, bottom: safeAreaLayoutGuide.bottomAnchor, trailing: trailingAnchor, paddingTop: 16, paddingBottom: 16, paddingLeft: 16, paddingRight: 16)
    }
}
 // 263 LINHAS!!!
// ja diminui 60 so em stacks. agora fazer com as views.... 203 linhas ate o momento
// contanto com as labels, caiu pra 110 linhas sem o identifier!!!
