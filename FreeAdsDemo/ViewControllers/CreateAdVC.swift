//
//  CreateAdVC.swift
//  FreeAdsDemo
//
//  Created by Mark Thabit on 29/11/2023.
//

import UIKit

class CreateAdVC: UIViewController {

    // MARK: - IBOutlets
    
    @IBOutlet var selectCategoryContainerView: UIView!
    @IBOutlet var uploadButton: UIButton!
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    // MARK: - Helper Methods
    
    private func setupUI() {
        selectCategoryContainerView.addGradientLayer(with: [
            UIColor(red: 0.02, green: 0.031, blue: 0.102, alpha: 1),
            UIColor(red: 0.127, green: 0.099, blue: 0.259, alpha: 1)
        ])
        
        uploadButton.addDashedBorder(with: .appYellow, 
                                     fillColor: UIColor(red: 0.919, green: 0.919, blue: 0.919, alpha: 0.1),
                                     cornerRadius: 24)
    }
    
    // MARK: - Target Actions
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
