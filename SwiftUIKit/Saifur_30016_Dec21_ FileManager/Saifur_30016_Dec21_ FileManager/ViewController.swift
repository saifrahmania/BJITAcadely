//
//  ViewController.swift
//  Saifur_30016_Dec21_ FileManager
//
//  Created by BJIT on 21/12/22.
//

import UIKit
import PhotosUI

class ViewController: UIViewController {

    @IBOutlet weak var addBtn: UIButton!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var noteItems:[String]?
    var imageItems:[String]?
    let fileManager = FileManager.default
    var folderURL:URL?
    var imgFolderURL:URL?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        getNoteItems()
        
        let noteCellNib = UINib(nibName: Constant.NodeCVCallerId, bundle: nil)
        collectionView.register(noteCellNib, forCellWithReuseIdentifier: Constant.NodeCVCallerId)
        
        collectionView.collectionViewLayout = gridViewLayout()
        
        NotificationCenter.default.addObserver(self, selector: #selector(refreshNoteList), name: Constant.refreshNoteListNotificationName, object: nil)
        
        
    }
    
    func getNoteItems(){
        guard let documentDirURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else{
            return
        }
        folderURL = documentDirURL.appendingPathComponent("NotepadApp/Notes")
        imgFolderURL = documentDirURL.appendingPathComponent("NotepadApp/img")
        
        do{
            noteItems = try fileManager.contentsOfDirectory(atPath: folderURL!.path)
            imageItems = try fileManager.contentsOfDirectory(atPath: imgFolderURL!.path)
            
            print("Notes: ", noteItems!)
            print("Images: ",imageItems!)
        }
        catch{
            
        }
    }
    
    func gridViewLayout() -> UICollectionViewCompositionalLayout{
        let leftItem = CompositionalLayout.createItem(width: .fractionalWidth(1/2), height: .fractionalHeight(1), spacing: 2)
        let rightItem = CompositionalLayout.createItem(width: .fractionalWidth(1/2), height: .fractionalHeight(1), spacing: 2)
        let outerGroup = CompositionalLayout.createGroup(alignment: .horizontal, width: .fractionalWidth(1), height: .fractionalWidth(1/2), items: [leftItem,rightItem])
        let section = NSCollectionLayoutSection(group: outerGroup)
        
        let compositionalLayout = UICollectionViewCompositionalLayout(section: section)
        return compositionalLayout
        
        
        
    }
    
    @objc func refreshNoteList() {
        getNoteItems()
        collectionView.reloadData()
    }
    
    


}


extension ViewController:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let noteItems = noteItems{
            print(noteItems.count)
            return(noteItems.count)
        }
        
        else {
            return 0
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let noteCell = collectionView.dequeueReusableCell(withReuseIdentifier: Constant.NodeCVCallerId, for: indexPath) as! NodeCVCell
        
        do{
            if let noteItems = noteItems {
                let fileURL = folderURL!.appendingPathComponent(noteItems[indexPath.row])
                let readData = try Data(contentsOf: fileURL)
                let readStr = String(data: readData, encoding: .utf8)
                noteCell.noteText.text = readStr
            }
            if let imgItems = imageItems{
                let imgURL = imgFolderURL!.appendingPathComponent(imgItems[indexPath.row])
                let readImgData = try Data(contentsOf: imgURL)
                let readImg = UIImage(data: readImgData)
                noteCell.noteImage.image = readImg
                
            }
        }
        catch{
                
        }
        
        return noteCell
        
    }
}

extension ViewController: UICollectionViewDelegate{
    
}


