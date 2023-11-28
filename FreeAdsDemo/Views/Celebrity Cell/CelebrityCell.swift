//
//  CelebrityCell.swift
//  FreeAdsDemo
//
//  Created by Mark Thabit on 28/11/2023.
//

import UIKit

class CelebrityCell: UICollectionViewCell, NibReusable {
    
    // MARK: - IBOutlets

    @IBOutlet var stackView: UIStackView!
    @IBOutlet var profileImageView: UIImageView!
    @IBOutlet var nameLbl: UILabel!
    @IBOutlet var jobTypeLbl: UILabel!
    @IBOutlet var followButton: UIButton!
    
    // MARK: - iVars
    
    private var isFollowed = true {
        didSet {
            followButton.setTitle(isFollowed ? "unfollow" : "Follow", for: .normal)
            followButton.backgroundColor = isFollowed ? .clear: .appYellow
            followButton.layer.shadowOpacity = isFollowed ? 0 : 1
            followButton.setTitleColor(isFollowed ? .appYellow : .white, for: .normal)
        }
    }
    
    var celebrity: Celebrity! {
        didSet { configureCell() }
    }
    
    // MARK: - View life cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
     
        setupUI()
    }
    
    // MARK: - Helper Methods
    
    private func setupUI() {
        stackView.setCustomSpacing(10, after: jobTypeLbl)
        
        configureFollowButtonStyle()
    }
    
    private func configureFollowButtonStyle() {
        followButton.layer.borderColor = UIColor.appYellow.cgColor
        followButton.layer.borderWidth = 2
        followButton.layer.shadowColor = UIColor(red: 1, green: 0.745, blue: 0.169, alpha: 0.11).cgColor
        followButton.layer.shadowOpacity = 1
        followButton.layer.shadowRadius = 10
        followButton.layer.shadowOffset = CGSize(width: 0, height: 10)
    }
    
    private func configureCell() {
        profileImageView.image = celebrity.image
        nameLbl.text = celebrity.name
        jobTypeLbl.text = celebrity.jobTitle
        isFollowed = celebrity.isFollowed
    }
    
    // MARK: - Target Actions
    
    @IBAction func followButtonTapped(_ sender: UIButton) {
        isFollowed.toggle()
    }
}
