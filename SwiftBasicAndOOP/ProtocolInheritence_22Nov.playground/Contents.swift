import UIKit
import Foundation
/*
class MediaItem{
    var name:String
    init(name:String){
        self.name = name
    }
}

class Movie:MediaItem{
    var director:String
    init(name: String,director:String) {
        self.director = director
        super.init(name: name)
    }
}

class Song:MediaItem{
    var artist:String
    init(name:String, artist:String){
        self.artist = artist
        super.init(name: name)
        
    }
}

let library = [
    Movie(name: "Casa", director: "Blanka"),
    Song(name: "Blue", artist: "Sude")
]
 */
/*
struct IntStack {
    var item :[Int] = []
    mutating func push(_ item:Int){
        self.item.insert(item, at: 0)
        
    }
    mutating func pop()->Int {
        self.item.removeFirst()
    }
}
 */
/*
struct Stack <Element>{
    var items :[Element] = []
    mutating func push( _ item: Element){
        items.insert(item, at: 0)
    }
    mutating func pull()->Element{
        items.removeLast()    }
    
}

var newStack = Stack<String>()
newStack.push("new item")
newStack.push("item 2")
newStack.push("item 3")
newStack.items
newStack.pull()
newStack.items


struct Queue <E2>{
    var items:[E2] = []
    mutating func enqueue(_ item : E2){
        items.append(item)
    }
    mutating func dequeue()->E2{
        items.removeFirst()
    }
}

var newQueue = Queue<Int>()
newQueue.enqueue(1)
newQueue.enqueue(2)
newQueue.enqueue(3)
newQueue.enqueue(4)
newQueue.items
newQueue.dequeue()
newQueue.dequeue()
newQueue.items

*/

// MARK: Type Casting
/*
class MediaItem{
    var name:String
    init(name:String){
        self.name = name
        
    }
}

class Movie:MediaItem{
    var director:String
    init(name:String,director:String){
        self.director = director
        super.init(name: name)
    }
}

class Song:MediaItem{
    var artist:String
    init(name:String,artist:String){
        self.artist = artist
        super.init(name: name)
    }
}

let library = [Movie(name: "Casa", director: "Blanka"),
Song(name: "Blue", artist: "Suede")]

for i in library{
    if let m = i as? Movie{
        print(m.director)
    }
    else if i is Song{
        print((i as! Song).artist)
    }
}
 
 */

/**
        *NESTED TYPE*
 

struct Band{
    enum MusicianType {
        case singer
        case guitar
        case keyboard
        case bass
        case drums
        
    }
    private var members: [MusicianType]
    private (set) var name: String
    init(name:String,member:[MusicianType]){
        self.name = name
        self.members = member
    }
    var description :String{
        "\(name) are made by \(members.count) members"
    }
}

let band01 = Band(name: "Dream Theater", member: [.singer,.bass,.drums,.guitar,.keyboard])
let band02 = Band(name: "IronMaide", member: [.singer,.bass,.drums,.guitar,.guitar,.drums])
 */

/**
    *Extension*
 
 */
/*
struct Size{
    var width = 0.0, height = 0.0
    
}

struct Point{
    var x = 0.0, y = 0.0
}

struct Rect{
    var origin  = Point()
    var size = Size()
}

let defaultReact = Rect()
let memberwiseRect = Rect(origin: Point(x: 2.0, y: 2.0), size: Size(width: 5.0, height: 5.0))

extension Rect {
    init(center:Point, size:Size){
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}

let centerRect = Rect(center: Point(x: 4.0, y: 4.0), size: Size(width: 3.0, height: 2.0))

extension Int{
    func repetitation(task: ()->Void){
        for  _ in 0..<self{
            task()
        }
    }
}

3.repetitation {
    print("Hello")
}

/**
    *Mutating instance Method*
 */

extension Int{
    mutating func square(){
        self = self * self
    }
}

var someInt = 3
someInt.square()

/*
        *Subscript*
 */


struct TimseTable{
    let multiplier:Int
    subscript(index:Int) ->Int
    {
        return multiplier * index
    }
}

let threeTimesTable = TimseTable(multiplier: 3)

var numberOfLegs = [
    "Spider": 8,
    "ant":2,
    "cat":4
]

numberOfLegs["cat"]
*/

/*
 
 */
/*
protocol RandomNumberGenerator{
    func random() -> Double
}

class LinerGhruentialGenerator: RandomNumberGenerator{
    var lastRandom = 42.0
    let m = 139968.4
    let a = 3877.0
    let c = 29537.0
    func random() -> Double {
        lastRandom = ((lastRandom * a+c).truncatingRemainder(dividingBy: m))
        return lastRandom / m
    }
    
}

let generator = LinerGhruentialGenerator()
print("A random number \(generator.random())")

class Dice{
    let sides: Int
    let generator:RandomNumberGenerator
    init(sides:Int,generator:RandomNumberGenerator){
        self.sides = sides
        self.generator = generator
    }
    
    func roll()->Int{
        return Int(generator.random() * Double(sides)) + 1
    }
}
var d6 = Dice(sides: 6, generator: LinerGhruentialGenerator())
for _ in 1...5{
    print("Random dice roll : \(d6.roll())")
}*/
/*
enum Planet: Int{
    case marcury = 1, venus,earth, mars, jupiter, saturn, naptune
    static subscript (n: Int) -> Planet{
        return Planet(rawValue: n)!
    }
}

let mars = Planet[4]
print(mars)
 */
/*
protocol Named{
    var name:String{get}
}
protocol Aged{
    var age: Int{get}
}
struct Person: Named,Aged{
    var name: String
    var age: Int
    
}

func wishHappyBirthday( _ celebrator :Named & Aged){
    print("Happy Birthday, \(celebrator.name), you are \(celebrator.age) !")
}

let birthdayPerson = Person(name: "Saifur", age: 24)
wishHappyBirthday(birthdayPerson)

class Location {
    var latitide:Double
    var longitude: Double
    init(latitude:Double, longitude: Double){
        self.latitide = latitude
        self.longitude = longitude
    }
}
class City: Location, Named {
    var name: String
    init(name: String, latitude: Double, longitude: Double){
        self.name = name
        super.init(latitude: latitude, longitude: longitude)
    }
}

func beginConcert( _ location : Location & Named){
    print("Hello, \(location.name)")
}

let seattle = City(name: "Seattle", latitude: 47.6, longitude: -122.6)
beginConcert(seattle)

*/
/*
protocol HasArea {
    var area: Double { get }
}

class Circle: HasArea{
    let pi = 3.1415927
    var radius : Double
    var area :Double {return pi * radius * radius}
        init(radius:Double) {self.radius = radius}
}

class Country: HasArea{
    var area: Double
    init(area : Double) {self.area = area}
}


class Animal {
    var legs:Int
    init(legs: Int) {self.legs = legs}
    
}

let objects: [AnyObject] = [
    Circle(radius:2.0),
    Country(area: 243_610),
    Animal(legs: 4)
]

for object in objects {
    if let objectWithArea = object as? HasArea{
        print("Area is \(objectWithArea.area)")
    }
    else {
        print("Something that does not have any area ")
    }
}
*/
/*
protocol RandomNumberGenerator{
    func random() -> Double
}

extension RandomNumberGenerator{
    func randomBool() -> Bool {
        return random() > 0.5
        
    }
}

class LinerGhruentialGenerator: RandomNumberGenerator{
    var lastRandom = 42.0
    let m = 139968.4
    let a = 3877.0
    let c = 29537.0
    func random() -> Double {
        lastRandom = ((lastRandom * a+c).truncatingRemainder(dividingBy: m))
        return lastRandom / m
    }
    
}

let generator = LinerGhruentialGenerator()
print("Random number : \(generator.random())")
print("Random Bool : \(generator.randomBool())")
*/

/*
extension Collection where Element:Equatable{
    func allEqual() -> Bool {
        for element in self{
            if element != self.first{
                return false
            }
        }
        return true
    }
}

let equalNumber  = [100,100,100,100]
let differentNumber = [100,100,200,100,200]
print(equalNumber.allEqual())
print(differentNumber.allEqual())
*/

/**
 
        *Generics*
 
 */
/*
func swapTwoInts( _ a : inout Int, _ b: inout Int){
    let tempA = a
    a = b
    b = tempA
}

func swapTwoValues<T>( _ a : inout T, _ b: inout T){
    let tempA = a
    a = b
    b = tempA
}

var someInt = 3
var anotherInt = 104
swapTwoValues(&someInt, &anotherInt)

var someString = "Hello"
var anotherString = "World"
swapTwoValues(&someString, &anotherString)

struct IntStack{
    var items:[Int] = []
    mutating func push(_ item: Int){
        items.append(item)
    }
    mutating func pop()->Int{
        return items.removeLast()
    }
}

struct Stack <Element> {
    var items:[Element] = []
    mutating func push (_ item : Element){
        items.append(item)
    }
    mutating func pop() -> Element{
        return items.removeLast()
    }
}

var stackOfString  = Stack<String>()
stackOfString.push("ichi")
stackOfString.push("ni")
stackOfString.push("san")
stackOfString.pop()
extension Array: TextRepresentable where Element: TextRepresentable{
    var textualDescription:String { self.map{$0.textualDescription}
        return "[" + itemAsText.joined(separator: ", ") + "]"
    
    }
}

let myDice = [d6,d12]
print(myDice,textualDescription)
*/

protocol Printer {
    associatedtype T
    func printing()
}


extension Printer where T : Collection {
    func printing1() {
        print("Depending on collection")
    }
}

extension Printer {
    func printing() {
        print("Not depending on collection")
    }
}


struct Runner<T> : Printer {
    var items: [T] = []
    
    init(_ items: [T]) {
        self.items = items
    }
    
    func printValues() {
        for item in items {
            print(item)
        }
        printing()
    }
}

var listoo: Set<Int> = [1,2,34,56,7,8]
var l1 = [1,2,34,56,7,8]

var numR = Runner<Int>(l1)

var lR = Runner<Set>([listoo,listoo])
print("Runner with int")
numR.printValues()
print("Runner with Set")
lR.printing1()
