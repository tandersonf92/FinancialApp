//
//  CompanyAssetCell.swift
//  FinancialApp
//
//  Created by Anderson Oliveira on 08/09/22.
//

import UIKit

final class CompanyAssetCell: UITableViewCell, ViewConfiguration {
    
    static let identifier = "CompanyAssetCell"
    
    private lazy var contentHorizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var symbolAndTypeStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 16
        return stackView
    }()
    private lazy var assetSymbolLabel: UILabel = {
        let label = UILabel()
        label.text = "BA"
        label.font = UIFont(name: "Avenir Next", size: 18)
        return label
    }()
    
    private lazy var assetTypeLabel: UILabel = {
        let label = UILabel()
        label.text = "USD"
        label.textColor = .lightGray
        label.font = UIFont(name: "Avenir Next", size: 12)
        return label
    }()
    
    private lazy var contentCompanyNameVerticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        return stackView
    }()
    
    
    private lazy var assetNameLabel: UILabel = {
        let label = UILabel()
        label.text = "The Boing Company"
        return label
    }()
    
    
    //MARK: Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }
    
//    override func prepareForReuse() {
//        
//    }
    
    //MARK: ViewConfiguration
    func configViews() {
    }
    
    func buildViews() {
        addSubview(contentHorizontalStackView)
        [symbolAndTypeStackView, contentCompanyNameVerticalStackView].forEach(contentHorizontalStackView.addArrangedSubview)
        [assetSymbolLabel, assetTypeLabel,].forEach(symbolAndTypeStackView.addArrangedSubview)
        contentCompanyNameVerticalStackView.addArrangedSubview(assetNameLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            contentHorizontalStackView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            contentHorizontalStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            contentHorizontalStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            contentHorizontalStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            
            assetSymbolLabel.heightAnchor.constraint(equalToConstant: 18),
            
            contentCompanyNameVerticalStackView.widthAnchor.constraint(equalToConstant: 160)
        ])
    }
}
