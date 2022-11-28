//
//  Cells.swift
//  CollectionView
//
//  Created by Nikola Veljic on 21.11.22..
//

import Foundation
import UIKit


struct Section {
    let cells: [CellController]
    let layoutSection: NSCollectionLayoutSection
}

protocol CellController {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
}

extension CellController {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) { }
}


class MyCell: CellController {

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MyCollectionViewCell
        cell.titleLabel.isHidden = true
        cell.backgroundColor = .secondarySystemFill
        return cell
    }
}

class MyCell2: CellController {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MyCollectionViewCell
        cell.titleLabel.isHidden = true
        cell.backgroundColor = .secondarySystemGroupedBackground
        return cell
    }
    
}

///
///
//        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(200.0))
//        let item = NSCollectionLayoutItem(layoutSize: itemSize)
//
//
//        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(200.0))
//        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [ item ])
//
//        // Create Section
//        let section = NSCollectionLayoutSection(group: group)
//        section.interGroupSpacing = 10
//
//        return  UICollectionViewCompositionalLayout(section: section)
//
//        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5),
//                                              heightDimension: .fractionalHeight(1))
//        let item = NSCollectionLayoutItem(layoutSize: itemSize)
//        item.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8)
//
//
//
//        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
//                                               heightDimension: .fractionalWidth(0.5))
//        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
//
//        let section = NSCollectionLayoutSection(group: group)
//        section.interGroupSpacing = 10
//
//        let layout = UICollectionViewCompositionalLayout(section: section)
//        return layout
// Large item on top
//        let inset: CGFloat = 8
//
//         let topItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(9/16))
//         let topItem = NSCollectionLayoutItem(layoutSize: topItemSize)
//         topItem.contentInsets = NSDirectionalEdgeInsets(top: inset, leading: inset, bottom: inset, trailing: inset)
//
//         // Bottom item
//         let bottomItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1.0))
//         let bottomItem = NSCollectionLayoutItem(layoutSize: bottomItemSize)
//         bottomItem.contentInsets = NSDirectionalEdgeInsets(top: inset, leading: inset, bottom: inset, trailing: inset)
//
//         // Group for bottom item, it repeats the bottom item twice
//         let bottomGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(0.5))
////         let bottomGroup = NSCollectionLayoutGroup.horizontal(layoutSize: bottomGroupSize, subitem: bottomItem)
//        let bottomGroup = NSCollectionLayoutGroup.horizontal(layoutSize: bottomGroupSize, subitems: [bottomItem])
//
//         // Combine the top item and bottom group
//         let fullGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(9/16 + 0.5))
//         let nestedGroup = NSCollectionLayoutGroup.vertical(layoutSize: fullGroupSize, subitems: [topItem, bottomGroup])
//
//         let section = NSCollectionLayoutSection(group: nestedGroup)
//        UICollectionViewCompositionalLayout(sectionProvider: <#T##UICollectionViewCompositionalLayoutSectionProvider##UICollectionViewCompositionalLayoutSectionProvider##(Int, NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection?#>)
//
//        UICollectionViewCompositionalLayout
