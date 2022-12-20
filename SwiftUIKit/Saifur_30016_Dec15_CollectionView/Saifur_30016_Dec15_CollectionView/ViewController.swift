//
//  ViewController.swift
//  Saifur_30016_Dec15_CollectionView
//
//  Created by BJIT on 15/12/22.
//

import UIKit

struct Pet {
    let name: String
    let id: Int
}

extension Pet {
    static let pets = [Pet(name: "cat", id: 1),
                       Pet(name: "dog", id: 2),
                       Pet(name: "hamster", id: 3),
                       Pet(name: "cat", id: 4),
                       Pet(name: "dog", id: 5),
                       Pet(name: "hamster", id: 6),
                       Pet(name: "cat", id: 7),
                       Pet(name: "dog", id: 8),
                       Pet(name: "hamster", id: 9),
                       Pet(name: "cat", id: 10),
                       Pet(name: "dog", id: 11),
                       Pet(name: "hamster", id: 12),
                       Pet(name: "cat", id: 13),
                       Pet(name: "dog", id: 14),
                       Pet(name: "hamster", id: 15),
                       Pet(name: "dog", id: 16),
                       Pet(name: "hamster", id: 17),
                       Pet(name: "cat", id: 18),
                       Pet(name: "dog", id: 19),
                       Pet(name: "hamster", id: 20)
                       
                    ]
}
//,Pet(name: "hamster", id: 21),Pet(name: "hamster", id: 22)

class ViewController: UIViewController {
    
    let pets = Pet.pets
    
    let sectionLeftRightPadding: CGFloat = 40
    let interItemSpacing: CGFloat = 20

    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        // Do any additional setup after loading the view.
        
        let nib = UINib(nibName: "CollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "cell")
        /*
        let headerNib = UINib(nibName: "CollectionHeaderFooterView", bundle: nil)
        collectionView.register(headerNib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "headerFooter")
        
        collectionView.register(headerNib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "headerFooter")
        */
        let insets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
        
        
        let largeItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/2), heightDimension: .fractionalHeight(1.0))
        let largeItem = NSCollectionLayoutItem(layoutSize: largeItemSize)
        largeItem.contentInsets = insets
        let smallItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1/2))
        let smallItem = NSCollectionLayoutItem(layoutSize: smallItemSize)
        smallItem.contentInsets = insets
        
        let verticalGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/4), heightDimension: .fractionalHeight(1))
        let veticalGroup = NSCollectionLayoutGroup.vertical(layoutSize: verticalGroupSize, subitem: smallItem, count: 2)
        let firstOuterGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1/2))
        let firstOuterGroup = NSCollectionLayoutGroup.horizontal(layoutSize: firstOuterGroupSize, subitems: [largeItem,veticalGroup,veticalGroup])
        let secondOuterGroup = NSCollectionLayoutGroup.horizontal(layoutSize: firstOuterGroupSize, subitems: [veticalGroup,veticalGroup,largeItem])
        let outerGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let outerGroup = NSCollectionLayoutGroup.vertical(layoutSize: outerGroupSize, subitems: [firstOuterGroup,secondOuterGroup])
        let section = NSCollectionLayoutSection(group: outerGroup)
        let compositionalLayout = UICollectionViewCompositionalLayout(section: section)
        collectionView.collectionViewLayout = compositionalLayout
        
        
        
        
        /**
                                Pashapashi --> Horizontal Stack
         
                                 Lombalombi--> Vertical Stack
         
         */
    }


}

extension ViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
    }
}

extension ViewController: UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3  
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pets.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        let pet = pets[indexPath.row]
        
        cell.imgView.image = UIImage(named: pet.name)
        cell.label.text = String(pet.id)
        return cell
        
    }
    /*
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "headerFooter", for: indexPath) as! CollectionHeaderFooterView
            
            header.label.text = "section \(indexPath.section) header"
            header.bgView.backgroundColor = .systemIndigo
            
            return header
        } else {
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "headerFooter", for: indexPath) as! CollectionHeaderFooterView
            
            footer.label.text = "section \(indexPath.section) footer"
            footer.bgView.backgroundColor = .systemRed
            return footer
        }
    }
     */
    
    
}

extension ViewController: UICollectionViewDelegateFlowLayout{
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let numberOfCellsInSection: CGFloat = 3
//        let availableWidth = (collectionView.bounds.width) - (sectionLeftRightPadding * 2) - (interItemSpacing * (numberOfCellsInSection - 1))
//
//        let cellDimension = availableWidth/numberOfCellsInSection
//
//        return CGSize(width: cellDimension, height: cellDimension)
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return interItemSpacing
//    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return UIEdgeInsets(top: 10, left: sectionLeftRightPadding, bottom: 10, right: sectionLeftRightPadding)
//    }
//
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 20
//    }
    
}
