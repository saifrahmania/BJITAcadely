//import UIKit
//
//let someString  = "Some string literal value"
////MultiString
//
//let quotation = """
// This is saifur rahman  here what i am doing is to check the multi line string
// """
//
//for a in "sentence"{
//    print(a)
//}
//let fruits = "kola, kathal, murgi"
//print("has \(fruits.count)")
//let greeting = "Guten Tag!"
//print(greeting[greeting.startIndex])
//print(greeting[greeting.index(after:  greeting.startIndex)])
//print(greeting[greeting.index(before: greeting.endIndex)])
//for index in greeting.indices{
//    print("\(greeting[index])",terminator: " ")
//}
//
//func addExclm(to  tex : String) -> () -> String{
//    var greeting = tex
//    func to() -> String{
//        greeting.insert("!", at: greeting.endIndex)
//        print(greeting)
//        return greeting
//    }
//    return to
//}
//
//let sayHi = addExclm(to: "hello")
//sayHi()
//sayHi()
//sayHi()

//let romeoAndJuliet = [
//   "Act 1 Scene 1: Verona, A public place",
//   "Act 1 Scene 2: Capulet's mansion",
//   "Act 1 Scene 3: A room in Capulet's mansion",
//   "Act 1 Scene 4: A street outside Capulet's mansion",
//   "Act 1 Scene 5: The Great Hall in Capulet's mansion",
//   "Act 2 Scene 1: Outside Capulet's mansion",
//   "Act 2 Scene 2: Capulet's orchard",
//   "Act 2 Scene 3: Outside Friar Lawrence's cell",
//   "Act 2 Scene 4: A street in Verona",
//   "Act 2 Scene 5: Capulet's mansion",
//   "Act 2 Scene 6: Friar Lawrence's cell"
//]
//
//
//var act1SceneCount = 0
//for scene in romeoAndJuliet {
//   if scene.hasPrefix("Act 1 ") {
//       act1SceneCount += 1
//   }
//}
//print("There are \(act1SceneCount) scenes in Act 1")
//// Prints "There are 5 scenes in Act 1"
//var mansionCount = 0
//var cellCount = 0
//for scene in romeoAndJuliet {
//   if scene.hasSuffix("Capulet's mansion") {
//       mansionCount += 1
//   } else if scene.hasSuffix("Friar Lawrence's cell") {
//       cellCount += 1
//   }
//}
//print("\(mansionCount) mansion scenes; \(cellCount) cell scenes")
//// Prints "6 mansion scenes; 2 cell scenes"


var operateOnNumber:(Int,Int)->Int = {
    $0 + $1
    
}

//print(operateOnNumber(2,3))

func sequence(first:(Int,Int)->Int,second: (Int,Int)->Int){
    first(2,3)
    second(3,4)
}
sequence {
    
        $0 + $1
    }
second: {
    $0 + $1
    }

let values:[Double] = [1, 2, 3, 4, 5, 6]
var sum:Double = 0
values.forEach {
//    print("\($0): \($0*$0)")
    sum += $0
}
//print(sum)
var prices = [1.5, 10, 4.99, 2.30, 8.19]
//let largePrices = prices.filter {
//  $0 > 5
//}
//
let largePrice = prices.first {
  $0 > 5
}
let unwrap = largePrice!
//print(unwrap)
let stock = [1.5: 5, 10: 2, 4.99: 20, 2.30: 5, 8.19: 30]
let stockSum = stock.reduce(0) {
  $0 + $1.key * Double($1.value)
}
//print(stockSum)
let removeLast = prices.dropLast()
let removeLastTwo = prices.dropLast(2)
let firstTwo = prices.prefix(2)
let lastTwo = prices.suffix(2)


