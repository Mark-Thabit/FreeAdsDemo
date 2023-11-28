//
//  BorderedView.swift
//  FreeAdsDemo
//
//  Created by Mark Thabit on 28/11/2023.
//

import UIKit

protocol BorderedView {
    var borderColor: UIColor { get set }
    var borderWidth: CGFloat { get set }
    var cornerRadius: CGFloat { get set }
}

@IBDesignable
extension UIView: BorderedView {
    @IBInspectable var borderColor: UIColor {
        get { UIColor(cgColor: layer.borderColor ?? UIColor.clear.cgColor) }
        set { layer.borderColor = newValue.cgColor }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get { layer.borderWidth }
        set { layer.borderWidth = newValue }
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        get { layer.cornerRadius }
        set { 
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
}
