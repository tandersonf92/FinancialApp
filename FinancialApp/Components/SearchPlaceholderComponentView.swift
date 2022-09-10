//
//  SearchPlaceholderComponentView.swift
//  FinancialApp
//
//  Created by Anderson Oliveira on 09/09/22.
//

import UIKit

final class SearchPlaceholderComponentView: UIView, ViewConfiguration {
    
    
    private lazy var placeholderImage: UIImageView = makeUIImageView(withImage: UIImage(named: "pigWithGraphic"))

    private lazy var titleLabel: UILabel = makeLabel(
        withText: "Search for companies to calculate potential returns via dollar cost avaraging.",
        textAlignment: .center,
        withFont: UIFont(name: "AvenirNext-Medium", size: 14))
    
    private lazy var contentStackView: UIStackView = makeStackView(withOrientation: .vertical, withSpacing: 24)
    
    //MARK: Init
    init(){
        super.init(frame: .zero)
        setupViews()
    }
    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }
    
    //MARK: ViewConfiguration
    func configViews() {}
    
    func buildViews() {
        addSubview(contentStackView)
        [placeholderImage, titleLabel].forEach(contentStackView.addArrangedSubview)
    }
    
    func setupConstraints() {
        let contentStackViewWidth = (UIScreen.main.bounds.width * 0.8)
        contentStackView.size(width: contentStackViewWidth)
        contentStackView.centerXYEqual(to: self)
        placeholderImage.size(height: 88)
    }
}
