//
//  UIView.swift
//  currencyConvertor
//
//  Created by Darshan Jain on 2022-10-17.
//

import Foundation
import UIKit

@IBDesignable extension UIView {
	@IBInspectable var borderColor: UIColor? {
		set {
			layer.borderColor = newValue?.cgColor
		}
		get {
			guard let color = layer.borderColor else {
				return nil
			}
			return UIColor(cgColor: color)
		}
	}
	@IBInspectable var borderWidth: CGFloat {
		set {
			layer.borderWidth = newValue
		}
		get {
			return layer.borderWidth
		}
	}
	@IBInspectable var cornerRadius: CGFloat {
		set {
			layer.cornerRadius = newValue
			clipsToBounds = newValue > 0
		}
		get {
			return layer.cornerRadius
		}
	}
}
