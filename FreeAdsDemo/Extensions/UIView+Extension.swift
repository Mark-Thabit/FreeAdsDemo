//
//  UIView+Extension.swift
//  FreeAdsDemo
//
//  Created by Mark Thabit on 29/11/2023.
//

import UIKit

extension UIView {
    func addGradientLayer(with colors: [UIColor]) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colors.map { $0.cgColor }
        layoutIfNeeded()
        gradientLayer.frame = bounds
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func addDashedBorder(with strokeColor: UIColor, fillColor: UIColor = .clear, cornerRadius: CGFloat) {
        let shapeLayer = CAShapeLayer()
        layoutIfNeeded()
        shapeLayer.frame = bounds
        shapeLayer.fillColor = fillColor.cgColor
        shapeLayer.strokeColor = strokeColor.cgColor
        shapeLayer.lineWidth = 2
        shapeLayer.lineJoin = CAShapeLayerLineJoin.round
        shapeLayer.lineDashPattern = [6, 6]
        shapeLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
        
        layer.addSublayer(shapeLayer)
    }
}
