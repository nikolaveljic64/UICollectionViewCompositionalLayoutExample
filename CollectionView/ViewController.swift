//
//  ViewController.swift
//  CollectionView
//
//  Created by Nikola Veljic on 18.11.22..
//

import UIKit

class ViewController: UIViewController {
    
    var array = [[CellController]]()
    
    
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
        
        
        array.append([MyCell(),MyCell()])
        array.append([MyCell2(),MyCell2(),MyCell2()])
        array.append([])
        
        collectionView.reloadData()
        
    }
    
    private func createCollectionViewLayout() -> UICollectionViewLayout {
      
        let layout = UICollectionViewCompositionalLayout{ (sectionNumber, env) -> NSCollectionLayoutSection?  in
            let data = self.array[sectionNumber].section()
            return data
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
        array[section].count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let controller = array[indexPath.section][indexPath.row]
        return controller.collectionView(collectionView, cellForItemAt: indexPath)
    }
    
    
}



