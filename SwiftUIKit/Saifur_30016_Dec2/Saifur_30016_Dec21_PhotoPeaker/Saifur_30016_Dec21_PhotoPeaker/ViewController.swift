//
//  ViewController.swift
//  Saifur_30016_Dec21_PhotoPeaker
//
//  Created by BJIT on 23/12/22.
//

import UIKit
import Photos
import PhotosUI



class ViewController: UIViewController {

    
    
    @IBOutlet weak var viewSwitchBtn: UIButton!
    
    
    @IBOutlet var collectionView: UICollectionView!
    
    var isGridView = true
    
    var imageArray = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        let galleyCellNib = UINib(nibName: "GalleryCVCell", bundle: nil)
        
        
        collectionView.register(galleyCellNib, forCellWithReuseIdentifier: "GalleryCVCell")
        
        
        collectionView.collectionViewLayout = singleItemViewLayout()
        
        
        
    }

    @IBAction func addImageAction(_ sender: Any) {
        let alertVC = UIAlertController(title: "Choose Photo Picker", message: "", preferredStyle: .actionSheet)
        
        let phpicker = UIAlertAction(title: "PHPicker", style: .default){_ in
            self.showPHPicker()
        }
        
        let uiImagePicker = UIAlertAction(title: "UIImagePicker", style: .default){_ in
            self.showImagePicker()
        }
        
        let cancelAlert = UIAlertAction(title: "Cancel", style: .default){_ in
            alertVC.dismiss(animated: true)
        }
        
        
        
 
        alertVC.addAction(phpicker)
        alertVC.addAction(uiImagePicker)
        alertVC.addAction(cancelAlert)

        present(alertVC, animated: true)
       
    }
    
    
    
    @IBAction func switchGalleryView(_ sender: Any) {
        if(isGridView == false){
            self.viewSwitchBtn.isUserInteractionEnabled = false
            self.viewSwitchBtn.setImage(UIImage(systemName: Constants.singleGridbtnIcon), for: .normal)
            
            collectionView.startInteractiveTransition(to: gridViewLayout()){
                [weak self] _,_ in
                guard let self = self else {return}
                
                self.viewSwitchBtn.isUserInteractionEnabled = true
            }
            collectionView.finishInteractiveTransition()
            isGridView = true
        }
        else
        {
            self.viewSwitchBtn.isUserInteractionEnabled = false
            self.viewSwitchBtn.setImage(UIImage(systemName: Constants.gridbtnIcon), for: .normal)
            
            collectionView.startInteractiveTransition(to: singleItemViewLayout()){
                [weak self] _,_ in
                guard let self = self else {return}
                self.viewSwitchBtn.isUserInteractionEnabled = true
            }
            collectionView.finishInteractiveTransition()
            isGridView = false
            
        }
    }
    
    func showImagePicker() {
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        present(pickerController, animated: true)
        
    }
    
    
    
    func showPHPicker() {
        var phPickerConfig = PHPickerConfiguration()
        phPickerConfig.selectionLimit = 5
        phPickerConfig.filter = .images
        
        let phPicker = PHPickerViewController(configuration: phPickerConfig)
        phPicker.delegate = self
        present(phPicker, animated: true)
    }
    
    func saveImageToPhone(image: UIImage)
    {
        let fileManager = FileManager.default
        
        guard let documentDirURL = fileManager.urls(
                for: .documentDirectory,
                in: .userDomainMask).first else {
                return
        }
        
        
        let imgfolderURL = documentDirURL.appendingPathComponent("Gallery").appendingPathComponent("Image")
            
        
        do {
            try fileManager.createDirectory(at: imgfolderURL, withIntermediateDirectories: true)
            print(documentDirURL.path)
        } catch {
            print(error)
        }
        
        let currentDateTime = Date()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let currentDateTimeStr = formatter.string(from: currentDateTime)
        
        print(currentDateTimeStr)

       let imgURL = imgfolderURL.appendingPathComponent("Img_"+currentDateTimeStr+".JPEG")
        print(imgURL)
    
        let img = image.jpegData(compressionQuality: 1)

        fileManager.createFile(atPath: imgURL.path , contents: img)
        
        showConfirmation(controller: self, message: "Image saved to the directory.", seconds: 0.75)
        

    }
    
    func showConfirmation(controller: UIViewController, message : String, seconds: Double)
    {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .actionSheet)
        
        alert.view.layer.cornerRadius = 15
        present(alert, animated: true)

        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + seconds) {
            alert.dismiss(animated: true)
        }
        
    }
    
    func gridViewLayout() -> UICollectionViewCompositionalLayout {
        
        /**/
        let insets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
        
        
        
        let largeItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1/3))
        
        let largeItem = NSCollectionLayoutItem(layoutSize: largeItemSize)
        
        largeItem.contentInsets = insets
        
        let leftSmallItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1/2))
        

        let leftSmallItem = NSCollectionLayoutItem(layoutSize: leftSmallItemSize)
        
        leftSmallItem.contentInsets = insets
       
        let vertGroup1Size = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/2), heightDimension: .fractionalHeight(1))
        
        let verticalGroup1 = NSCollectionLayoutGroup.vertical(layoutSize: vertGroup1Size, subitems: [leftSmallItem])
        
       
        
        
        let rightSmallItem1Size = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1/3))
        
        let rightSmallItem1 = NSCollectionLayoutItem(layoutSize: rightSmallItem1Size)
        
        rightSmallItem1.contentInsets = insets
        
        
        let rightSmallItem2Size = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(2/3))
        

        let rightSmallItem2 = NSCollectionLayoutItem(layoutSize: rightSmallItem2Size)
        
        rightSmallItem2.contentInsets = insets
       
        let vertGroup2Size = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/2), heightDimension: .fractionalHeight(1))
        
        let verticalGroup2 = NSCollectionLayoutGroup.vertical(layoutSize: vertGroup2Size, subitems: [rightSmallItem1, rightSmallItem2])
        
        
        
        let horiGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(2/3))
        
        let horiGroup = NSCollectionLayoutGroup.horizontal(layoutSize: horiGroupSize, subitems: [verticalGroup1, verticalGroup2])
        
        
        
        
        let outerGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(1.5))
        let outerGroup = NSCollectionLayoutGroup.vertical(layoutSize: outerGroupSize, subitems: [horiGroup, largeItem])
/**/
        
        let section = NSCollectionLayoutSection(group: outerGroup)
        
        let compositionalLayout = UICollectionViewCompositionalLayout(section: section)
        return compositionalLayout
    }
    
    func singleItemViewLayout() -> UICollectionViewCompositionalLayout {
        let insets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
        
        let leftItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        
        let leftItem = NSCollectionLayoutItem(layoutSize: leftItemSize)
        
        leftItem.contentInsets = insets
        
        let rightItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        
        let rightItem = NSCollectionLayoutItem(layoutSize: rightItemSize)
        
        rightItem.contentInsets = insets
        
        let outerGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(0.5))
        let outerGroup = NSCollectionLayoutGroup.vertical(layoutSize: outerGroupSize, subitems: [leftItem, rightItem])
        
        let section = NSCollectionLayoutSection(group: outerGroup)
        
        let compositionalLayout = UICollectionViewCompositionalLayout(section: section)
        return compositionalLayout
    }
    
}

extension ViewController: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        
        picker.dismiss(animated: true)
        
        for result in results {
            result.itemProvider.loadObject(ofClass: UIImage.self, completionHandler: { [weak self] (image, error) in
                
                guard let self = self else { return }
                
                if let image = image as? UIImage {
                    self.imageArray.append(image)
                    DispatchQueue.main.async {
                        self.collectionView.reloadData()
                    }

                }
            })
        }
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let galleryCell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.galleryCVCellId, for: indexPath) as! GalleryCVCell
        
        galleryCell.galleryImage.layer.cornerRadius = 20
        
        galleryCell.galleryImage.image = imageArray[indexPath.row]
        return galleryCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let alertVC = UIAlertController(title: "Choose a option", message: "", preferredStyle: .actionSheet)
        
        let saveImage = UIAlertAction(title: "Save", style: .default){_ in
            self.saveImageToPhone(image: self.imageArray[indexPath.row])
        }
        
        let cancelAlert = UIAlertAction(title: "Cancel", style: .default){_ in
            alertVC.dismiss(animated: true)
        }
 
        alertVC.addAction(saveImage)
        alertVC.addAction(cancelAlert)

        present(alertVC, animated: true)
    }
    
}





extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageArray.append(originalImage)
            collectionView.reloadData()
        }
        
        picker.dismiss(animated: true)
        
    }
    
}












