//
//  AddNoteVC.swift
//  Saifur_30016_Dec21_ FileManager
//
//  Created by BJIT on 21/12/22.
//

import UIKit

class AddNoteVC: UIViewController {
    
    
    @IBOutlet weak var inputNote: UITextView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
        
    }
    

    @IBAction func addNoteAction(_ sender: Any) {
        addNote(note: inputNote.text)
        
    }
    func addNote(note:String){
        let fileManager = FileManager.default
        guard let documentDirURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else{
            return
        }
        let folderURL = documentDirURL.appendingPathComponent("NotepadApp/Notes")
        let imgFolderURL = documentDirURL.appendingPathComponent("NotepadApp/img")
        do{
            try fileManager.createDirectory(atPath: folderURL.path  , withIntermediateDirectories:true)
            try fileManager.createDirectory(atPath: imgFolderURL.path, withIntermediateDirectories: true)
            print(documentDirURL.path)
        }
        catch{
            print(error)
        }
        let currentDateAndTime = Date()
        let formatter  = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy HH:mm:ss"
        let currentDateAndTimeStr = formatter.string(from: currentDateAndTime)
        print(currentDateAndTimeStr)
        
        let fileURL = folderURL.appendingPathComponent("Notepad_"+currentDateAndTimeStr+".txt")
        let imgURL = imgFolderURL.appendingPathComponent("Notepad_"+currentDateAndTimeStr+".png")
        print("fileURL:->\(fileURL)")
        print("imgURL:->\(imgURL)")
        
        let data = note.data(using: .utf8)
        let img = UIImage(named: "griedList")?.pngData()
        
        fileManager.createFile(atPath: fileURL.path, contents: data)
        fileManager.createFile(atPath: imgURL.path, contents: img)
        
        NotificationCenter.default.post(name: Constant.refreshNoteListNotificationName, object: nil)
        dismiss(animated: true)
        
        
    }

}
