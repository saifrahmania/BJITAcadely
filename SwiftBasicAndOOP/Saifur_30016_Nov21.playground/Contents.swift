import UIKit
import Foundation



protocol Media{
    var name: String {get set}
    func playMedia()
}


extension Media{
    func playMedia(){
        print("\(name) is being played in the media player")
    }
}

//class Media{
//    var name:String
//    init(name:String){
//        self.name = name
//    }
//    func playMedia(){
//        print("\(name) is being played in the media player")
//    }
//}
 

class Movie: Media{
    var name: String
    
    var director: String
    init(name:String,director:String){
        self.director = director
        self.name = name
    }
     func playMedia() {
        print("\(name) by \(director) is being playeed in the media player!!")
    }
}

class Song : Media{
    var name: String
    
    var artist:String
    init(name:String, artist:String){
        self.artist = artist
        self.name = name
    }
     func playMedia() {
        print("\(name)by\(artist)is being playedin the mediaplayer!")

    }
}
var movie1 = Movie(name: "IronMan1", director: "D1")
var movie2 = Movie(name: "IronMan2", director: "D2")
var movie3 = Movie(name: "IronMan3", director: "D3")

var song1 = Song(name: "Franxx1", artist: "F1")
var song2 = Song(name: "Franxx2", artist: "F2")
var song3 = Song(name: "Franxx3", artist: "F3")

var mediaLib:[Media] = []
mediaLib.append(movie1)
mediaLib.append(movie2)
mediaLib.append(movie3)
mediaLib.append(song1)
mediaLib.append(song2)
mediaLib.append(song3)

for am in mediaLib{
    if let am  = am as? Movie{
        print(am.director)
    }
    if am is Movie{
        print((am as! Movie).director)
    }
    else if am is Song{
        print((am as! Song).artist)
    }
}



/*
extension Collection {
    func summarize(){
        var idx = 1
        for value in self{
            print("\(idx). \(value)")
            idx += 1
        }
    }
}

let beatles=Set(["John","Paul","George","Ringo"])
beatles.summarize()


let scores = [23,25,21,46,21,18]
scores.summarize()
*/
/*
protocol Personel {
    var id:String {get set}
    var name:String {get set}
    func details(id:String, name:String)
}


extension Personel{
    func details(id:String, name:String){
        print("Details:\nid: \(self.id)\nName: \(self.name)")
    }
}

class Student: Personel{
    var id: String = ""
    var name: String = ""
    var dept: String = ""
    
    func completeDetails(id: String, name: String, dept:String) {
        self.id = id
        self.name = name
        self.dept = dept
        details(id: self.id, name: self.name)
        print("dept:  \(self.dept)\n")
    }
    
}

class Faculty: Personel{
    var id: String = ""
    var name: String = ""
    var desig: String = ""
    
    
    
    func AllDetails(id: String, name: String, desig:String) {
        self.id = id
        self.name = name
        self.desig = desig
        details(id: self.id, name: self.name)
        print("designation:  \(self.desig)\n")
    }
    
}
var f1 = Faculty()
f1.AllDetails(id: "2121", name: "Pol", desig: "Adjunck")
var s1 = Student()
s1.completeDetails(id: "1199", name: "Mike", dept: "EEE")
var people:[Personel] = []
people.append(f1)
people.append(s1)

for person in people{
    if person is Faculty{
        print((person as! Faculty).desig)
    }
    else if person is Student{
        print((person as! Student).dept)
    }
}*/
/*
if  f1  is Faculty {
    print(f1 .name)
    print(f1 .id)
    print(f1 .desig)
}

if  s1  is Student {
    print(s1.name)
    print(s1.id)
    print(s1.dept)
}
 */
