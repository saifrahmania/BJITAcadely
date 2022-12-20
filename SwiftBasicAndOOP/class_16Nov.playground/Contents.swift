import UIKit
/*
struct Singer{
    var name:String
    var genre:String

    init(str:String){
        self.name = str
        self.genre = "POP"
    }
    init(nm:String,str:String) {
        self.name = nm;
        self.genre = str
    }
}
var singer = Singer(str:  "Tailor Swift")
var singer2 = singer

singer2.name  = "Only Swift"
print(singer.name)


class Dog{
    var name:String
    var breed: String
    init(name:String, breed:String){
        self.name = name
        self.breed = breed
        
    }
    func printValye(){
        print(self.name)
        print(self.breed)
    }
}

//let poppy = Dog(name: "Poppy", breed: "Poodle")

//Inheritence
class Poodle : Dog  {
    init(name: String) {
        super.init(name: name, breed: "Poodle")
    }
}

let poppy = Poodle(name: "Poppy")
poppy.printValye()
 */


class Dog{
    var name:String
    var breed:String
    public static var newName:String = ""
    init(name:String,breed:String){
        self.name = name
        self.breed = breed
        
    }
    class func dogType(){
        print("We want to check the dogtype here ")
    }
    static func codeDog(name:String){
        newName = name
        print("Code dog has been called and the new name is \(name)")
    }
    func makeNoise()->String{
        return self.name
    }
    deinit{
        print("Dog has been deinitiated")
    }
}

class Poddle: Dog{
    var height:String
    var weight: String
    init(name: String, breed: String, height:String,weight:String) {
        self.height = height
        self.weight = weight
        super.init(name: name, breed: breed)
        
        
        

    }
    func makeNoise1()->String {
        //print("First time over written")
        let s1 = super.makeNoise()
        return s1
    }
    deinit{
        print("Poodle has been deinitiated")
    }
    
}

let poppy = Poddle(name: "Mike", breed: "Huscie", height: "14", weight: "thirteen")
Poddle.dogType()
poppy.makeNoise()
Poddle.codeDog(name: "Charlie")
//poppy.makeNoise(value: "Joy Bangla")

class Poddle2: Poddle{
    var color:String
    var fure: String
    init(name: String, breed: String,height:String,weight:String,fure:String) {
        self.color = name
        self.fure = breed
        super.init(name: name, breed: breed,height: height,weight: weight)
    }

   func makeNoise2() -> String {
       let s2 = super.makeNoise1()
        //print("Poddle2 is working")
        return s2
    }
    deinit{
        print("Poodle2 has been deinitiated")
    }
}



/**
 # How Deinit work in the for loop
 -->in the for loop same object is being called multiple time which is why after every iteration the variable in the loop looses the references and the dinit will be  called
 */
/*for _ in 1...3{
let poppy2 = Poddle2(name: "Mike", breed: "Huscie", height: "fourteen", weight: "thirteen", fure: "big")
print(poppy2.makeNoise2())
    
}
 */

/**
 # Deinit does not work outside of for loop
 --> because because it was not loosing references and the object was alive which was the reason  of deinit{} not working
 
 */

var poppy3 = Poddle2(name: "john", breed: "Huscie", height: "fourteen", weight: "thirteen", fure: "big")
poppy3 = Poddle2(name: "john", breed: "Huscie", height: "fourteen", weight: "thirteen", fure: "big")
//print(poppy3.makeNoise2())
//let poppy4 = Poddle2(name: "Chapple", breed: "Huscie", height: "fourteen", weight: "thirteen", fure: "big")
//print(poppy4.makeNoise2())

//print(poppy2.makeNoise(value: "Joy Bongo bondhu"))
//print(Poddle2.makeNoise2())




