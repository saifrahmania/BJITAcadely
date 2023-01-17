//
//  testVC.swift
//  Saifur_30016_Mid1
//
//  Created by BJIT on 12/1/23.
//

import UIKit
import SDWebImage

class TestVC: UIViewController {
    //var isSelected = false
    var selectedIndex  = IndexPath(row: 0, section: 0)
    var cellData = [Article]()
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        syncTable("all")
        /*
        JSONHandler.shared.getPost("all" , { result in
            self.cellData  = result.articles
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        })
         */
        tableView.delegate = self
        tableView.dataSource = self
        collectionView.dataSource = self
        collectionView.delegate = self
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionView.collectionViewLayout = layout
        
        
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
        cell.time.text = cellData[indexPath.row].publishedAt
        cell.content.text   = cellData[indexPath.row].content
        cell.thumbnail.sd_setImage(with: URL(string: cellData[indexPath.row].urlToImage ?? "https://cdn.abcotvs.com/dip/images/12685608_meag-millions.jpg?w=1600"), placeholderImage: UIImage(systemName: "pencil") )
        cell.source.text = cellData[indexPath.row].source.name
        
       
        
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
            collectionView.reloadData()
            print("\(Constant.category[selectedIndex.row]): from did select")
            syncTable(Constant.category[selectedIndex.row]) //Table is synced when it is tapped
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? TestCVC{
            cell.underLine.backgroundColor = .black
        }
        
    }
     
    // MARK: - FUNCTION TO SYNC TABLE
    func syncTable(_ category:String){
        APICaller.jsonShare.getPost(category , { result in
            self.cellData  = result.articles
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        })
    }
    
   
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: "testCategory", for: indexPath) as! TestCVC
        cell.category.text = Constant.category[indexPath.row]
        cell.category.font = UIFont.systemFont(ofSize: 16, weight: .bold)        
        if indexPath == selectedIndex{
            cell.underLine.backgroundColor = .systemPink
        }
        return cell
    }
       
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    
    
}
// MARK: - DEFINE COLLECTIONVIEW SIZE
extension TestVC: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 280, height: 70)
    }
}

     
    


