//
//  Factories.swift
//  FinancialApp
//
//  Created by Anderson Oliveira on 10/09/22.
//

import UIKit

func makeLabel(withText text: String, textAlignment: NSTextAlignment = .left, withFont: UIFont? = .systemFont(ofSize: 17), numberOfLines: Int = 0, textColor: UIColor = .black) -> UILabel {
    let label = UILabel()
    label.text = text
    label.numberOfLines = numberOfLines
    label.textAlignment = textAlignment
    label.textColor = textColor
    if let withFont = withFont {
        label.font = withFont
    }
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
}

func makeStackView(withOrientation axis: NSLayoutConstraint.Axis, withSpacing: CGFloat = 0, withDistribution: UIStackView.Distribution = .fill, withAlignment: UIStackView.Alignment = .fill ) -> UIStackView {
    let stackView = UIStackView()
    stackView.axis = axis
    stackView.distribution = withDistribution
    stackView.alignment = withAlignment
    stackView.spacing = withSpacing
    stackView.translatesAutoresizingMaskIntoConstraints = false
    return stackView
}

func makeTextField(withBorderStyle: UITextField.BorderStyle = .none, placeholder: String = "", withFont: UIFont? = .systemFont(ofSize: 17), withSize: Int = 18) -> UITextField {
    let textField = UITextField()
    textField.borderStyle = withBorderStyle
    textField.placeholder = placeholder
    if let withFont = withFont {
        textField.font = withFont
    }
    textField.translatesAutoresizingMaskIntoConstraints = false
    return textField
}
