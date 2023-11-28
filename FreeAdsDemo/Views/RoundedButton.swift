//
//  RoundedButton.swift
//  FreeAdsDemo
//
//  Created by Mark Thabit on 28/11/2023.
//

import UIKit

class RoundedButton: UIButton {
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = frame.width / 2
        layer.masksToBounds = true
    }
}
