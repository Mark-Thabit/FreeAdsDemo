//
//  CategoryListVC.swift
//  FreeAdsDemo
//
//  Created by Mark Thabit on 28/11/2023.
//

import UIKit

class CategoryListVC: UIViewController {
    
    // MARK: - IBOutlets

    @IBOutlet var searchBar: UISearchBar!
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    // MARK: - Helper Methods
    
    private func setupUI() {
        setupSearchBar()
    }
    
    private func setupSearchBar() {
        searchBar.setImage(UIImage(), for: .search, state: .normal)
        searchBar.backgroundColor = .clear
        searchBar.searchTextField.borderStyle = .none
        searchBar.tintColor = .appYellow
    }
}
