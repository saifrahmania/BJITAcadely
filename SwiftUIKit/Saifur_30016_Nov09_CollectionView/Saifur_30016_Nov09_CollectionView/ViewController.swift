//
//  ViewController.swift
//  Saifur_30016_Nov09_CollectionView
//
//  Created by BJIT on 12/12/22.
//

import UIKit
struct Car{
    var name:String
    var imgId:String
}
//Toyota, Lamborghini,Tesla,Nissan,Mercedes

extension Car{
    static var car  = [
        Car(name: "Toyota", imgId: "Toyota"),
        Car(name: "Lamborghini", imgId: "Lamborghini"),
        Car(name: "Tesla", imgId: "Tesla"),
        Car(name: "Nissan", imgId: "Nissan"),
        Car(name: "Mercedes", imgId: "Mercedes"),
        Car(name: "Toyota", imgId: "Toyota"),
        Car(name: "Lamborghini", imgId: "Lamborghini"),
        Car(name: "Tesla", imgId: "Tesla"),
        Car(name: "Nissan", imgId: "Nissan"),
        Car(name: "Mercedes", imgId: "Mercedes"),
        Car(name: "Toyota", imgId: "Toyota"),
        Car(name: "Lamborghini", imgId: "Lamborghini"),
        Car(name: "Tesla", imgId: "Tesla"),
        Car(name: "Nissan", imgId: "Nissan"),
        Car(name: "Mercedes", imgId: "Mercedes"),
        Car(name: "Toyota", imgId: "Toyota"),
        Car(name: "Lamborghini", imgId: "Lamborghini"),
        Car(name: "Tesla", imgId: "Tesla"),
        Car(name: "Nissan", imgId: "Nissan"),
        Car(name: "Mercedes", imgId: "Mercedes"),
        Car(name: "Toyota", imgId: "Toyota"),
        Car(name: "Lamborghini", imgId: "Lamborghini"),
        Car(name: "Tesla", imgId: "Tesla"),
        Car(name: "Nissan", imgId: "Nissan"),
        Car(name: "Mercedes", imgId: "Mercedes"),
        Car(name: "Toyota", imgId: "Toyota"),
        Car(name: "Lamborghini", imgId: "Lamborghini"),
        Car(name: "Tesla", imgId: "Tesla"),
        Car(name: "Nissan", imgId: "Nissan"),
        Car(name: "Mercedes", imgId: "Mercedes"),
    ]
    
}

class ViewController: UIViewController {
    
    let sectionLeftAndRightPadding = 10.0
    let interItemSpacing = 20.0

    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 75, height: 75)
        layout.scrollDirection = .vertical
        collectionView.collectionViewLayout = layout
        layout.sectionFootersPinToVisibleBounds = true
        layout.sectionHeadersPinToVisibleBounds = true
        
        let nib = UINib(nibName: "CollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "collectionView")
        let headerNib = UINib(nibName: "CustomHeaderFooterView", bundle: nil)
        collectionView.register(headerNib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "customHeaderNib")
        collectionView.register(headerNib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "customHeaderNib")
    }
    


}

extension ViewController: UICollectionViewDelegate{
    
}

extension ViewController: UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("\(indexPath)")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Car.car.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionView", for: indexPath) as! CollectionViewCell
        cell.imgView.image = UIImage(named: Car.car[indexPath.row].imgId)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader{
            let header  = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "customHeaderNib", for: indexPath) as! CustomHeaderFooterView
            header.headerTitle.text = "Section \(indexPath.section) Header"
            header.headerView.backgroundColor  = .systemGray
            return header
        }
        else {
            let footer  = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "customHeaderNib", for: indexPath) as! CustomHeaderFooterView
            footer.headerTitle.text = "Section \(indexPath.section) Footer"
            footer.headerView.backgroundColor = .brown
            return footer
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: 200, height: 80)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: 200, height: 50)
    }
    
    
}

extension ViewController:UICollectionViewDelegateFlowLayout{
    public func collectionView(_ collectionView:UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) ->CGSize {
        let numberOfCellInSection = 3.0
        let availableWidth = collectionView.bounds.width - (sectionLeftAndRightPadding * 2) - (interItemSpacing * (numberOfCellInSection - 1.0))
        let cellDimension = availableWidth/numberOfCellInSection
        return CGSize(width: cellDimension , height: cellDimension)
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
         return interItemSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: sectionLeftAndRightPadding, bottom: 20, right: sectionLeftAndRightPadding)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
         return 1
    }
}

