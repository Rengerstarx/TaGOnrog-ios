//
//  ViewsFactory.swift
//  TaGOnrog
//
//  Created by Сергей Бекезин on 31.01.2024.
//

import TinyConstraints
import UIKit

class ViewsFactory {
    
    class func defaultButton(
        type: UIButton.ButtonType = .system,
        height: CGFloat? = nil,
        color: UIColor,
        radius: CGFloat = 0,
        font: UIFont,
        titleColor: UIColor = .appWhite
    ) -> UIButton {
        let button = UIButton(type: type)
        if let height = height {
            button.height(height)
        }
        button.backgroundColor = color
        button.layer.cornerRadius = radius
        button.titleLabel?.font = font
        button.setTitleColor(titleColor, for: .normal)
        return button
    }
    
    class func defaultLabel(
        lines: Int = 1,
        textColor: UIColor = .appBlack,
        font: UIFont = .sFProText(ofSize: 17),
        alignment: NSTextAlignment = .natural,
        adjustFont: Bool = false
    ) -> UILabel {
        let label = UILabel()
        label.numberOfLines = lines
        label.textColor = textColor
        label.font = font
        label.textAlignment = alignment
        if adjustFont {
            label.adjustsFontSizeToFitWidth = true
            label.minimumScaleFactor = 0.5
        }
        return label
    }
    
    class func defaultImageView(
        contentMode: UIView.ContentMode = .scaleAspectFit,
        image: UIImage? = nil
    ) -> UIImageView {
        let imageView = UIImageView(image: image)
        imageView.contentMode = contentMode
        return imageView
    }
    
    class func defaultScrollView() -> UIScrollView {
        let scrollView = UIScrollView()
        return scrollView
    }
    
    class func defaultStackView(
        axis: NSLayoutConstraint.Axis = .horizontal,
        spacing: CGFloat = 0,
        distribution: UIStackView.Distribution = .fill,
        alignment: UIStackView.Alignment = .fill,
        margins: TinyEdgeInsets? = nil
    ) -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = axis
        stackView.spacing = spacing
        stackView.distribution = distribution
        stackView.alignment = alignment
        if let margins = margins {
            stackView.isLayoutMarginsRelativeArrangement = true
            stackView.layoutMargins = margins
        }
        return stackView
    }
    
    class func separatorLine(color: UIColor = .appBlack, vertical: Bool = true, thickness: CGFloat = 1) -> UIView {
        let line = UIView()
        line.backgroundColor = color
        if vertical {
            line.width(thickness)
        } else {
            line.height(thickness)
        }
        return line
    }
    
    class func defaultActivityIndicator(style: UIActivityIndicatorView.Style = .medium, color: UIColor = .appSystemGray) -> UIActivityIndicatorView {
        let indicator = UIActivityIndicatorView(style: style)
        indicator.color = color
        return indicator
    }
    
    class func defaultBarButton(font: UIFont = .sFProText(ofSize: 17), image: AppImage? = nil, color: UIColor = .appSystemBlue) -> UIBarButtonItem {
        let button = UIBarButtonItem()
        [.normal, .highlighted].forEach { state in
            button.setTitleTextAttributes([.font: font, .foregroundColor: color], for: state)
        }
        button.setTitleTextAttributes([.font: font, .foregroundColor: color.withAlphaComponent(0.2)], for: .disabled)
        button.image = image?.uiImageWith(font: font, tint: color)
        return button
    }
    
    class func defaultSwitch(tintColor: UIColor = .appSystemBlue) -> UISwitch {
        let switchView = UISwitch()
        switchView.onTintColor = tintColor
        return switchView
    }
    
    class func defaultStepper(tintColor: UIColor = .white) -> UIStepper {
        let stepperView = UIStepper()
        stepperView.tintColor = tintColor
        return stepperView
    }
    
}
