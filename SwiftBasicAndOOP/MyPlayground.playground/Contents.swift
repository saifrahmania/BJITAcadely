//import UIKit
//
//var greeting = "Hello, playground"
//print(greeting)
//let animal  = "dog"
//for character in animal{
//    print(character)
//}
//
//let banglaesh  = "joy bangla "
//print(banglaesh)
//
//var welcome = "welcome ios team"
//let range  = welcome.index(welcome.startIndex,offsetBy: 7)..<welcome.index(welcome.endIndex,offsetBy: -5)
//welcome.removeSubrange(range)
//print(welcome)
//var myMessagea = "Hello iOS team!"
//let rangee  = myMessagea.index(myMessagea.startIndex,offsetBy: 5)..<myMessagea.index(myMessagea.endIndex,offsetBy: -6)
//myMessagea.removeSubrange(rangee)
//
//let new = myMessagea
//
//print(new)
//var greetings = "Hi"
//greetings.insert("!", at: greetings.endIndex)
//print(greetings)
//
//let romeoAndJuliet = [
//    "Act 1 Scene 1: Verona, A public place",
//    "Act 1 Scene 2: Capulet's mansion",
//    "Act 1 Scene 3: A room in Capulet's mansion",
//    "Act 1 Scene 4: A street outside Capulet's mansion",
//    "Act 1 Scene 5: The Great Hall in Capulet's mansion",
//    "Act 2 Scene 1: Outside Capulet's mansion",
//    "Act 2 Scene 2: Capulet's orchard",
//    "Act 2 Scene 3: Outside Friar Lawrence's cell",
//    "Act 2 Scene 4: A street in Verona",
//    "Act 2 Scene 5: Capulet's mansion",
//    "Act 2 Scene 6: Friar Lawrence's cell"
//    ]
//
//var act1SceneCount = 0
//for scene in romeoAndJuliet {
//    if scene.hasPrefix("Act 1 ") {
//        act1SceneCount += 1
//    }
//}
//print("There are \(act1SceneCount) scenes in Act 1")

import Foundation
// Prints "There are 5 scenes in Act 1"
//
//
//let num1 = 5
//let num2 = 10
//let sum:Double = num1 + num2
//var sum = 0
//let num1 = 10.5
//let num2 = 5
//sum = num1 + num2
//let sum = 10.5 + 5
//
//print(sum)
//var Message  = "Hello team!"
//
//Message.insert(contentsOf: " iOS", at: Message.index(Message.startIndex,offsetBy: 5))
//
//print(Message)
//let pi = 0.14
//let anotherPi = 3+pi
//
//print(anotherPi)
//let a = true


//a==true ? print(1) : print(0)
//var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
//if let remoivedValues = airports.removeValue(forKey: "DUB"){
//    print("the removed airport's name is \(remoivedValues).")
//
//}
//
//else{
//    print("this airport's directory doesn't contain DUB")
//}

var str = "Hellow I am Saifur Rahman I am here to Remove All vowEls"
//let capVowel = "AEIOU"
//let smVowel = "aeiou"
//
//
//
//for ch in str{
//    if(ch=="a"||ch=="e"||ch=="i"||ch=="o"||ch=="u"){
//        continue
//    }
//    else if   (ch=="A"||ch=="E"||ch=="I"||ch=="O"||ch=="U"){
//        continue
//    }
//    else{
//        print("\(ch)",terminator: "")
//    }
//}
//print("\n")
//for ch in str{
//    if (capVowel.contains(ch) || smVowel.contains(ch)){
//        continue
//    }
//    else{
//        print("\(ch)",terminator: "")
//    }
//}

//for ch in str{
//    switch ch{
//    case "a","A","e","E","i","I","o","O","u","U":
//        fallthrough
//
//
//    default: print("\(ch)",terminator: "")
//    }
//
//
//}
//let names = ["name1":"abc", "name2":"def"]
//let name2:String? = names["name2"]!//<-- is used for force unwrapping which might crash the project not the code in the playground
//print(name2 )

//let name3 = names["name3"]
//if let name2 = names["name2"],let name1 = names["name1"]{
 //   print(name2)
 //   print(name1)
    
//}
//let num1: Int? = Int(5.2)
//let num2: Int = Int("Five") ?? 12
////let sum = num1 + 5
//if let num1 = num1{
//    let sum = num1 + 5
//}



//func myfunc(num:Int?){
//    guard let num = num else {
//        return
//    }
//    print(num)
//}
//
//myfunc(num: 5)
//myfunc(num: nil)
//if let first = Int("4"),
//   let second = Int("42"),
//   first<second && second < 100
//{
//    print("\(first)<\(second)<100")
//}

//let someNumber:Int? = 5
//
//func unwrapWithGuard(value:Int?) -> Int {
//    guard let valueUnwrapped = value else {
//        return 0
//    }
//    return valueUnwrapped
//
//}
//by unwrapping optional (string, int) --> becomes (string, int)
//
//let result = unwrapWithGuard(value: someNumber)
//print(result)
//let num34: Int? = 45
//let result:Int = num34!
//let forcedStr:String? = "World"
//let str1:String = forcedStr!


