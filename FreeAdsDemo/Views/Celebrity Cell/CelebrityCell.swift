//
//  CelebrityCell.swift
//  FreeAdsDemo
//
//  Created by Mark Thabit on 28/11/2023.
//

import UIKit

class CelebrityCell: UICollectionViewCell {
    
    // MARK: - IBOutlets

    @IBOutlet var stackView: UIStackView!
    @IBOutlet var profileImageView: UIImageView!
    @IBOutlet var nameLbl: UILabel!
    @IBOutlet var jobTypeLbl: UILabel!
    @IBOutlet var followButton: UIButton!
    
    // MARK: - iVars
    
    private var isFollowed = true {
        didSet {
            
        }
    }
    
    // MARK: - View life cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
     
        setupUI()
    }
    
    // MARK: - Helper Methods
    
    private func setupUI() {
        configureStackView()
        
    }
    
    private func configureStackView() {
        stackView.setCustomSpacing(10, after: profileImageView)
        stackView.setCustomSpacing(10, after: jobTypeLbl)
    }
    
    // MARK: - Target Actions
    
    @IBAction func followButtonTapped(_ sender: UIButton) {
        
    }
}
