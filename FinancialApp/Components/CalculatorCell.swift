//
//  CalculatorCell.swift
//  FinancialApp
//
//  Created by Anderson Oliveira on 10/09/22.
//
import UIKit

final class CalculatorCell: UITableViewCell, ViewConfiguration {
    
    static let identifier = "CalculatorCell"
    
    private lazy var mainContentVerticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var contentHorizontalStackView1: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 4
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var textLabel11: UILabel = {
       let label = UILabel()
        label.text = "SPY"
        label.font = UIFont(name: "AvenirNext-DemiBold", size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var textLabel12: UILabel = {
       let label = UILabel()
        label.text = "S&P 500 ETF"
        label.font = UIFont(name: "AvenirNext-Bold", size: 14)
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var verticalStackView1: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var contentHorizontalStackView2: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 4
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var textLabel21: UILabel = {
       let label = UILabel()
        label.text = "Current Value"
        label.font = UIFont(name: "AvenirNext", size: 12)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var textLabel22: UILabel = {
       let label = UILabel()
        label.text = "(USD)"
        label.font = UIFont(name: "AvenirNext", size: 12)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private lazy var textLabelBetweenTwoStacks: UILabel = {
       let label = UILabel()
        label.text = "5000"
        label.font = UIFont(name: "AvenirNext-DemiBold", size: 24)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var verticalStackView2: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var contentHorizontalStackView3: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var textLabel31: UILabel = {
       let label = UILabel()
        label.text = "Investment amount"
        label.font = UIFont(name: "AvenirNext-Regular", size: 10)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var voidView: UIView = {
       let view = UIView()
        return view
    }()
    
    private lazy var textLabel32: UILabel = {
       let label = UILabel()
        label.text = "USD 100"
        label.font = UIFont(name: "AvenirNext-DemiBold", size: 10)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var verticalStackView3: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var contentHorizontalStackView4: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 4
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var textLabel41: UILabel = {
       let label = UILabel()
        label.text = "Gain"
        label.font = UIFont(name: "AvenirNext-Regular", size: 10)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var voidView2: UIView = {
       let view = UIView()
        return view
    }()
    
    private lazy var textLabel42: UILabel = {
       let label = UILabel()
        label.text = "+100.25"
        label.font = UIFont(name: "AvenirNext-DemiBold", size: 10)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var textLabel43: UILabel = {
       let label = UILabel()
        label.text = "[10.25%]"
        label.font = UIFont(name: "AvenirNext-DemiBold", size: 10)
        label.textColor = .systemGreen
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var verticalStackView4: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var contentHorizontalStackView5: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var textLabel51: UILabel = {
       let label = UILabel()
        label.text = "Anual Return"
        label.font = UIFont(name: "AvenirNext-Regular", size: 10)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var voidView3: UIView = {
       let view = UIView()
        return view
    }()
    
    private lazy var textLabel52: UILabel = {
       let label = UILabel()
        label.text = "10.5%"
        label.font = UIFont(name: "AvenirNext-DemiBold", size: 10)
        label.textColor = .systemGreen
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }
    
    //MARK: ViewConfiguration
    func configViews() {
        textLabel12.setContentHuggingPriority(.init(rawValue: 252), for: .horizontal)
        textLabel21.setContentHuggingPriority(.init(rawValue: 252), for: .horizontal)
    }
    
    func buildViews() {
        addSubview(mainContentVerticalStackView)
        [contentHorizontalStackView1, verticalStackView1, textLabelBetweenTwoStacks,  verticalStackView2, verticalStackView3,verticalStackView4].forEach(mainContentVerticalStackView.addArrangedSubview)
        
        [textLabel11, textLabel12].forEach(contentHorizontalStackView1.addArrangedSubview)
        
        verticalStackView1.addArrangedSubview(contentHorizontalStackView2)
        [textLabel21, textLabel22].forEach(contentHorizontalStackView2.addArrangedSubview)
        
        verticalStackView2.addArrangedSubview(contentHorizontalStackView3)
        [textLabel31, textLabel32].forEach(contentHorizontalStackView3.addArrangedSubview)
        
        verticalStackView3.addArrangedSubview(contentHorizontalStackView4)
        [textLabel41, voidView, textLabel42, textLabel43].forEach(contentHorizontalStackView4.addArrangedSubview)
        
        verticalStackView4.addArrangedSubview(contentHorizontalStackView5)
        [textLabel51, textLabel52].forEach(contentHorizontalStackView5.addArrangedSubview)
    }
    
    func setupConstraints() {
        
        mainContentVerticalStackView.anchor(top: safeAreaLayoutGuide.topAnchor, leading: leadingAnchor, bottom: safeAreaLayoutGuide.bottomAnchor, trailing: trailingAnchor, paddingTop: 16, paddingBottom: 16, paddingLeft: 16, paddingRight: 16)
    }
}
