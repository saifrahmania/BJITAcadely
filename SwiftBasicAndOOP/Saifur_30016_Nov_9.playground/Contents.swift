import UIKit
//Suppose the cases in this enum represent arithmetic operations, namely, summation, subtraction, multiplication and division. Write a function called chooseMathFunc that takes a parameter of type Operation and returns a function that can perform the appropriate arithmetic operation. You must define all four arithmetic functions as nested functions within chooseMathFunc. Write another function called performOperation that takes 3 parameters: two Doubles and one Operation. Within the performOperation function, make use of chooseMathFunc to get the correct arithmetic function. Finally, call the appropriate arithmetic function (to perform summation, multiplication, etc) and return the result from performOperation.
//var greeting = "Hello, playground"
enum Operation {
    case sum
    case sub
    case mul
    case div }



func chooseMathFunc(_ op:Operation)->((Double,Double)->Double){
    func sum (_ x:Double,_ y:Double)->Double{
        return x + y
    }
    func sub(_ x:Double,_ y:Double)->Double{
        return x - y
    }
    func mul (_ x:Double,_ y:Double)->Double{
        return x * y
    }
    func div(_ x:Double,_ y:Double)->Double{
        return x / y
    }
    switch op{
    case .sum:
        return sum
    case .sub:
        return sub
    case .mul:
        return mul
    case .div:
        return div
    }
}
func performOperation(_ x:Double,_ y:Double, _ doMath:(Double,Double)->Double)->Double{
    return doMath(x,y)
}
let result = performOperation(2.3, 3.1, chooseMathFunc(Operation.mul))
print(result)

//func longRunningTask(_ x:Int,completion: (Int) -> ()) { var count = 0
//    for i in 0..<100000{ count += 1 }
//    completion(x)
//
//}

//var notify  : (Int)->Void  =  {
//    (x:Int)->Void in
//    print("task completed \(x) times")
//
//}

func longRunningTask(completion: () -> Void) { var count = 0
    for _ in 0..<100000{ count += 1 }
    completion()
    
}


for i in (1...5) {
    longRunningTask{
        print("task completed \(i) times")
    }
    
}
