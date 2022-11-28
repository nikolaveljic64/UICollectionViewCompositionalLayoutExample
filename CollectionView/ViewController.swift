//
//  ViewController.swift
//  CollectionView
//
//  Created by Nikola Veljic on 18.11.22..
//

import UIKit

class ViewController: UIViewController {
    
    var data = [Section]()
    
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            // Configure Collection View
            collectionView.delegate = self
            collectionView.dataSource = self
            
            // Create Collection View Layout
            collectionView.collectionViewLayout = createCollectionViewLayout()
            collectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: "Categories", withReuseIdentifier: "headerID")
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        data.append(Section(cells: [MyCell(), MyCell(), MyCell()], layoutSection: getLayoutSectionOne()))
        
        data.append(Section(cells: [MyCell2(), MyCell2(), MyCell2()], layoutSection: getLayoutSectionTwo()))
        
        data.append(Section(cells: [MyCell(), MyCell(), MyCell()], layoutSection: getLayoutSectionOne()))
        
        
        collectionView.reloadData()
        
    }
    
    func getLayoutSectionOne() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
        item.contentInsets.trailing = 16
        item.contentInsets.bottom = 16
        item.contentInsets.top = 16
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(300)), subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        
        section.orthogonalScrollingBehavior = .paging
        
        return section
    }
    
    func getLayoutSectionTwo() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(0.25), heightDimension: .fractionalHeight(0.5)))
        item.contentInsets.trailing = 16
        item.contentInsets.top = 16
        
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(500)), subitems: [item])
        group.contentInsets.leading = 16
        group.contentInsets.bottom = 8
        
        
        let section = NSCollectionLayoutSection(group: group)
        
        section.boundarySupplementaryItems = [
            .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50)), elementKind: "Categories", alignment: .topLeading)
        ]
        
        return section
    }
    
    
    private func createCollectionViewLayout() -> UICollectionViewLayout {
        
        let layout = UICollectionViewCompositionalLayout{ (sectionNumber, env) -> NSCollectionLayoutSection?  in
            let layoutSection = self.data[sectionNumber].layoutSection
            return layoutSection
        }
        
        return layout
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: "Categories", withReuseIdentifier: "headerID", for: indexPath)
        header.backgroundColor = .darkGray
        
        return header
    }
}
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        data[section].cells.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let controller = data[indexPath.section].cells[indexPath.row]
        return controller.collectionView(collectionView, cellForItemAt: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        data[indexPath.section].cells[indexPath.row].collectionView(collectionView, didSelectItemAt: indexPath)
    }
    
}



