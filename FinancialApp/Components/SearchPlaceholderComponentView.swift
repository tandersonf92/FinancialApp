//
//  SearchPlaceholderComponentView.swift
//  FinancialApp
//
//  Created by Anderson Oliveira on 09/09/22.
//

import UIKit

final class SearchPlaceholderComponentView: UIView, ViewConfiguration {
    
    private lazy var placeholderImage: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "pigWithGraphic")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
       let title = UILabel()
        title.text = "Search for companies to calculate potential returns via dollar cost avaraging."
        title.numberOfLines = 0
        title.font = UIFont(name: "AvenirNext-Medium", size: 14)
        title.textAlignment = .center
        return title
    }()
    
    private lazy var contentStackView: UIStackView = makeStackView(withOrientation: .vertical, withSpacing: 24)
    
//    private lazy var contentStackView: UIStackView = {
//        let stackView = UIStackView()
//        stackView.axis = .vertical
//        stackView.spacing = 24
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        return stackView
//    }()
    
    
    //MARK: Init
    init(){
        super.init(frame: .zero)
        setupViews()
    }
    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }
    
    //MARK: ViewConfiguration
    func configViews() {
    }
    
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
