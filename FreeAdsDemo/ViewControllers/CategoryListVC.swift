//
//  CategoryListVC.swift
//  FreeAdsDemo
//
//  Created by Mark Thabit on 28/11/2023.
//

import UIKit

enum Section: String, CaseIterable {
    case celebrity = "Discover People"
    case category = "Categories"
    case photos = ""
}

class CategoryListVC: UIViewController {
    
    typealias DataSource = UICollectionViewDiffableDataSource<Section, AnyHashable>
    
    // MARK: - IBOutlets

    @IBOutlet private var searchBar: UISearchBar!
    @IBOutlet private var collectionView: UICollectionView!
    
    // MARK: - iVars
    
    private var dataSource: DataSource? = nil
    private let celebrityList = Celebrity.devList
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    // MARK: - Helper Methods
    
    private func setupUI() {
        setupSearchBar()
        configureCollectionView()
    }
    
    private func setupSearchBar() {
        searchBar.setImage(UIImage(), for: .search, state: .normal)
        searchBar.backgroundColor = .clear
        searchBar.searchTextField.borderStyle = .none
        searchBar.tintColor = .appYellow
    }
    
    private func configureCollectionView() {
        collectionView.register(cellType: CelebrityCell.self)
        collectionView.register(supplementaryViewType: SectionHeaderView.self, 
                                ofKind: UICollectionView.elementKindSectionHeader)
        
        dataSource = DataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            let section = Section.allCases[indexPath.section]
            
            switch section {
                case .celebrity:
                    guard let item = itemIdentifier as? Celebrity else { return nil }
                    
                    let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: CelebrityCell.self)
                    cell.celebrity = item
                    return cell
                    
                default:
                    return nil
            }
        })
        
        dataSource?.supplementaryViewProvider = { collectionView, elementKind, indexPath in
            let section = Section.allCases[indexPath.section]
            
            switch section {
                case .celebrity, .category:
                    let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader,
                                                                                     for: indexPath,
                                                                                     viewType: SectionHeaderView.self)
                    headerView.titleLbl.text = section.rawValue
                    return headerView
                    
                case .photos:
                    return nil
            }
        }
        
        collectionView.setCollectionViewLayout(generateLayout(), animated: false)
        
        let snapshot = snapshotForCurrentState()
        dataSource?.apply(snapshot, animatingDifferences: false)
    }
    
    private func snapshotForCurrentState() -> NSDiffableDataSourceSnapshot<Section, AnyHashable> {
        var snapshot = NSDiffableDataSourceSnapshot<Section, AnyHashable>()
        snapshot.appendSections([Section.celebrity])
        snapshot.appendItems(celebrityList)
        return snapshot
    }
    
    private func generateLayout() -> UICollectionViewLayout {
        UICollectionViewCompositionalLayout { sectionIndex, layoutEnvironment in
            let section = Section.allCases[sectionIndex]
            
            return switch section {
                case .celebrity: self.generateCelebritySectionLayout()
                default: nil
            }
        }
    }
    
    private func generateCelebritySectionLayout() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/3),
                                                                             heightDimension: .fractionalHeight(1)))
        item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                                                          heightDimension: .fractionalWidth(0.48)),
                                                       repeatingSubitem: item,
                                                       count: 3)
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                                                                    heightDimension: .estimated(44)),
                                                                 elementKind: UICollectionView.elementKindSectionHeader,
                                                                 alignment: .top)
        let section = NSCollectionLayoutSection(group: group)
        section.boundarySupplementaryItems = [header]
        section.orthogonalScrollingBehavior = .continuous
        return section
    }
}
