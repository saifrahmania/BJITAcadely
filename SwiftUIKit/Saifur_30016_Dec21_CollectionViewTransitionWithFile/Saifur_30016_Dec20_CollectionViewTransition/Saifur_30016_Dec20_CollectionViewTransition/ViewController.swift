//
//  ViewController.swift
//  Saifur_30016_Dec20_CollectionViewTransition
//
//  Created by BJIT on 20/12/22.
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
                       Pet(name: "hamster", id: 20),
                       Pet(name: "hamster", id: 21),
                       Pet(name: "hamster", id: 22)
                    ]
}


class ViewController: UIViewController {
    
    let pets = Pet.pets
    
    

    @IBOutlet weak var collectionView: UICollectionView!
    
   
    @IBOutlet weak var lst: UIButton!
    
    @IBOutlet weak var grd: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        collectionView.collectionViewLayout = createLayout1()
    }
    
    @IBAction func griedView(_ sender: Any) {
        grd.isUserInteractionEnabled = false
        lst.isUserInteractionEnabled  = false
        collectionView.startInteractiveTransition(to: createLayout1()){[weak self] _,_ in
             guard let self = self else{
                return
            }
            self.grd.isUserInteractionEnabled = true
            self.lst.isUserInteractionEnabled = true
        }
        collectionView.finishInteractiveTransition()


    }
    
    @IBAction func listView(_ sender: Any) {
        grd.isUserInteractionEnabled = false
        lst.isUserInteractionEnabled  = false
        collectionView.startInteractiveTransition(to: createLayout2()){[weak self] _,_ in
             guard let self = self else{
                return
            }
            self.grd.isUserInteractionEnabled = true
            self.lst.isUserInteractionEnabled = true
        }
        collectionView.finishInteractiveTransition()
    }
    
    
    
    private func createLayout1() -> UICollectionViewCompositionalLayout{
        let item = CompositionalLayout.createItem(width: .fractionalWidth(1/2), height: .fractionalHeight(1), spacing: 1)
        let horizontalGroup = CompositionalLayout.createGroup(alignment: .horizontal, width: .fractionalWidth(1), height: .fractionalHeight(1/4), item: item, count: 2)
        let section = NSCollectionLayoutSection(group: horizontalGroup)
        return UICollectionViewCompositionalLayout(section: section)
        
    }
    private func createLayout2() -> UICollectionViewCompositionalLayout{
        let item = CompositionalLayout.createItem(width: .fractionalWidth(1), height: .fractionalWidth(1/3), spacing: 1)
        let horizontalGroup = CompositionalLayout.createGroup(alignment: .vertical, width: .fractionalWidth(1), height: .fractionalHeight(1), item: item, count: 3)
        let section = NSCollectionLayoutSection(group: horizontalGroup)
        return UICollectionViewCompositionalLayout(section: section)

    }


}

extension ViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
    }
}

extension ViewController: UICollectionViewDataSource{
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        pets.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        let pet = pets[indexPath.row]
        cell.cellImageView.image = UIImage(named: pet.name)
        return cell
    }
    
    
}

class CollectionViewCell:UICollectionViewCell{
    
    @IBOutlet weak var cellImageView: UIImageView!
    
    
}

