//
//  testVC.swift
//  Saifur_30016_Mid1
//
//  Created by BJIT on 12/1/23.
//

import UIKit

class TestVC: UIViewController {
    //var isSelected = false
    var selectedIndex : IndexPath!
    var cellData = [Article]()
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        JSONHandler.shared.getPost()
        tableView.delegate = self
        tableView.dataSource = self
        collectionView.dataSource = self
        collectionView.delegate = self
        
    }
}



extension TestVC: UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("total cell: \(cellData.count)")
        return cellData.count
    
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! TestTVC
        cell.title.text = cellData[indexPath.row].title
        print(cellData[indexPath.row].title)
        cell.time.text = cellData[indexPath.row].publishedAt
        print(cellData[indexPath.row].publishedAt)
        cell.content.text   = cellData[indexPath.row].content
        print(cellData[indexPath.row].content)
        //cell.thumbnail.image =
        
       
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension TestVC: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Constant.category.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? TestCVC{
            cell.underLine.backgroundColor = .systemPink
            selectedIndex = indexPath
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? TestCVC{
            cell.underLine.backgroundColor = .black
        }
    }
    
    
    
   
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: "testCategory", for: indexPath) as! TestCVC
        cell.category.text = Constant.category[indexPath.row]
        cell.category.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        //cell.underLine.backgroundColor = .red
        //collectionView.reloadData()
        if indexPath == selectedIndex{
            cell.underLine.backgroundColor = .systemPink
        }
        return cell
        
        //return UICollectionViewCell()
    }
       
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    

    
    
}

extension TestVC: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 300, height: 70)
    }
}


extension TestVC{
    func retrieveAtricle(jsonRes:[Article]){
        print("JSON Response First Title: \(jsonRes[0].title)")
        cellData = jsonRes
    }
    
}


