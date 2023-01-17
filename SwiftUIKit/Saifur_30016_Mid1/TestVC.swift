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
    var categoryName:String = ""
    @IBOutlet weak var searchBar: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
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
       // searchBar.addTarget(self, action: #selector(newsFinder), for: .editingChanged)
        
        syncTable("all") { [weak self] in
            CoreDataShare.coreShare.getAllRecord()
            guard let self = self else { return }
            let records = News.newsArray
            self.cellData.removeAll()
            for record in records{
                var source = Source(id: nil, name: nil)
                var news = Article(source: source, author: record.author, title: record.title, description: record.descript, url: record.url, urlToImage: record.urlToImage, publishedAt: record.publishedAt, content: record.content)
                self.cellData.append(news)
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
/*    @objc func newsFinder(){
        if let keywords = searchBar.text{
            if keywords == "" {
                CoreDataShare.coreShare.getAllRecord()
                refreshNews()
            } else{
                CoreDataShare.coreShare.getRecord(category: categoryName, searchText: searchBar.text!)
                refreshNews()
            }
        }
    } */
}



extension TestVC: UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("total cell: \(cellData.count)")
        return cellData.count
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constant.homeSegueId{
            if let extendedDetails = segue.destination as? ExtendedDetails{
                
                extendedDetails.loadViewIfNeeded()
                extendedDetails.newsCompany.text = cellData[selectedIndex.row].source.name
                extendedDetails.newsTitle.text = cellData[selectedIndex.row].title
                extendedDetails.newsAuthor.text = cellData[selectedIndex.row].author
                extendedDetails.newsDate.text = cellData[selectedIndex.row].publishedAt
                extendedDetails.newsDescription.text = cellData[selectedIndex.row].description
                extendedDetails.storeURL = cellData[selectedIndex.row].url!
                extendedDetails.storeImageURL = cellData[selectedIndex.row].urlToImage!
                
            }
        }
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
            categoryName = Constant.category[selectedIndex.row]
            
            collectionView.reloadData()
            print("\(categoryName): from did select")
            syncTable(categoryName) {
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } //Table is synced when it is tapped
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? TestCVC{
            cell.underLine.backgroundColor = .black
        }
        
    }
    
    
    
    func refreshNews(){
        tableView.reloadData()
    }
     
    // MARK: - FUNCTION TO SYNC TABLE
    func syncTable(_ category:String, completion: @escaping () ->  Void){
        APICaller.jsonShare.getPost(category , { result in
            completion()
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

     
    


