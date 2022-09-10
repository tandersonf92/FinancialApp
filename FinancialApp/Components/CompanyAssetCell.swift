//
//  CompanyAssetCell.swift
//  FinancialApp
//
//  Created by Anderson Oliveira on 08/09/22.
//

import UIKit

final class CompanyAssetCell: UITableViewCell, ViewConfiguration {
    
    static let identifier = "CompanyAssetCell"
    
    private lazy var contentHorizontalStackView: UIStackView = makeStackView(withOrientation: .horizontal, withSpacing: 16)
    
    private lazy var symbolAndTypeStackView: UIStackView = makeStackView(withOrientation: .vertical, withSpacing: 16)

    private lazy var assetSymbolLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AvenirNext", size: 18)
        return label
    }()
    
    private lazy var assetTypeLabel: UILabel = makeLabel(withText: "", withFont: UIFont(name: "AvenirNext", size: 12), textColor: .lightGray)
    
    private lazy var contentCompanyNameVerticalStackView: UIStackView = makeStackView(withOrientation: .vertical)

    private lazy var assetNameLabel: UILabel = makeLabel(withText: "", textAlignment: .right)
    
    //MARK: Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }
    
//        override func prepareForReuse() {
//
//        }
    
    func configure(with searchResult: SearchResult) {
        assetNameLabel.text = searchResult.name
        assetSymbolLabel.text = searchResult.symbol
        assetTypeLabel.text = searchResult.type
            .appending(" ")
            .appending(searchResult.currency)
    }
    
    //MARK: ViewConfiguration
    func configViews() {}
    
    func buildViews() {
        addSubview(contentHorizontalStackView)
        [symbolAndTypeStackView, contentCompanyNameVerticalStackView].forEach(contentHorizontalStackView.addArrangedSubview)
        [assetSymbolLabel, assetTypeLabel,].forEach(symbolAndTypeStackView.addArrangedSubview)
        contentCompanyNameVerticalStackView.addArrangedSubview(assetNameLabel)
    }
    
    func setupConstraints() {
        contentHorizontalStackView.setAnchorsEqual(to: self, .init(top: 8, left: 16, bottom: 8, right: 16))
        assetSymbolLabel.size(height: 18)
        contentCompanyNameVerticalStackView.size(width: 160)
    }
}
