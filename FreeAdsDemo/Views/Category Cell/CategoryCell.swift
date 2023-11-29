//
//  CategoryCell.swift
//  FreeAdsDemo
//
//  Created by Mark Thabit on 29/11/2023.
//

import UIKit

class CategoryCell: UICollectionViewCell, NibReusable {
    
    // MARK: - IBOutlets
    
    @IBOutlet var titleLbl: UILabel!
    
    // MARK: - Add side-effects
    
    override var isSelected: Bool {
        didSet {
            titleLbl.textColor = isSelected ? .appYellow : .white
        }
    }
}
