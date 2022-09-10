//
//  Factories.swift
//  FinancialApp
//
//  Created by Anderson Oliveira on 10/09/22.
//

import UIKit

func makeLabel(withText text: String, textAlignment: NSTextAlignment = .left, withFont font: UIFont? = .systemFont(ofSize: 17), numberOfLines: Int = 0, textColor: UIColor = .black) -> UILabel {
    let label = UILabel()
    label.text = text
    label.numberOfLines = numberOfLines
    label.textAlignment = textAlignment
    label.textColor = textColor
    if let font = font {
        label.font = font
    }
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
}

func makeStackView(withOrientation axis: NSLayoutConstraint.Axis, withSpacing spacing: CGFloat = 0, withDistribution: UIStackView.Distribution = .fill, withAlignment alignment: UIStackView.Alignment = .fill ) -> UIStackView {
    let stackView = UIStackView()
    stackView.axis = axis
    stackView.distribution = withDistribution
    stackView.alignment = alignment
    stackView.spacing = spacing
    stackView.translatesAutoresizingMaskIntoConstraints = false
    return stackView
}

func makeTextField(withBorderStyle borderStyle: UITextField.BorderStyle = .none, placeholder: String = "", withFont font: UIFont? = .systemFont(ofSize: 17), withSize: Int = 18) -> UITextField {
    let textField = UITextField()
    textField.borderStyle = borderStyle
    textField.placeholder = placeholder
    if let font = font {
        textField.font = font
    }
    textField.translatesAutoresizingMaskIntoConstraints = false
    return textField
}

func makeUIImageView(withImage image: UIImage?, contentMode: UIImageView.ContentMode = .scaleAspectFit) -> UIImageView {
    let imageView = UIImageView()
    if let image = image {
        imageView.image = image
    }
    imageView.contentMode = contentMode
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
}
