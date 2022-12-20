import UIKit
import Darwin
print("Solution 1")
//let a1:String = "124"
//let a2:String = "41"
//func summ(s1:String, s2:String)->Int?{
//    let first :Int? = Int(s1)
//    let second: Int? = Int(s2)
//
//    if let num1 = first, let num2 = second{
//        return num1 + num2
//    }
//    return nil
//
//}
// let result = summ(s1: a1, s2: a2)
//print(result ?? "NULL")

let a1:String? = "124"
let a2:String? = "41"
func summ(s1:String?, s2:String?)->Int?{
    if let x = s1, let y = s2 {
        let first  = Int(x)
        let second  = Int(y)
        let m = first!
        let n = second!
        return m + n
        
    }
    //let first  = Int(s1)!
    //let second = Int(s2)!
    
    

//   if let num1 = first, let num2 = second{
//       return num1 + num2
//    }
    return nil

}
let result = summ(s1: a1, s2: a2)
print(result ?? "NULL")



print("Solution 2")

let blacks = [
"Rhaenyra": 32,
"Daemon": 48,
"Jacaerys": 15,
"Lucerys": 14,
"Joffrey": 12,
"Aegon": 9,
"Viserys": 7 ]

func search(a1:String,blacks:Dictionary<String,Int>)->Int?{
    let age:Int? = blacks[a1]
    guard let age  = age else
        {return nil}
    return age
}

let ages  = search(a1: "Daemon", blacks: blacks)
print(ages ?? "Result Not foubnd")

print("Solution 3")

func require(email:String?,subjects:String?,message:String?)  {
    let sub = subjects ?? "General Inquiry"
    guard let mail = email, let message = message else  {
        
        return
    }
    
    print(sub)
    print(message)
    print(mail)
}
require(email: "Saif@g", subjects: nil, message: "hello")
    


print("Solution 4")
var name: String? = "Hello world"
//var age: Int = nil
print("here age is an integer value but in this statement we have tried to assign a nil value to an integer variable; which is not legal")
//var age = nil
print("in ordr to assign nil value to a variable the variable should have to a contextual type")
var middleName: String? = nil
let optStr: String? = name!


print("Solution 5")

var str1: String! = "Hello again"
print("here str1 is an implicite optional variable which means str1 cannot be used as an optional variable in the normal form ")
var str2: String = str1
print("but when we store the str1 into str2, the str2 can be used as a normal variable")
var str3 = str1!
print("As str1 by itself was an implicit variable, when we will implicit it again it will act like a normal variable ")
var str4 = str1
print("as swift by itself changes the variable type based on the value which is assigned to it. which is why str4 will be an optional")

print("Solution 6")
var age: Int? = nil
//var unwrapped = age!
print("in swift we cannot unwrap a  nil variable. and by forcefully unwrapping the variable the project will be crashed ")


print("Solution 7")


func solve(n:Int, d:Int)->Int?{
    var cont = 0
    var a = n
    var b = d
    
    while (a % b == 0){
            a = a/b
            cont+=1
                
    }
    if(cont==0){
    
    return nil
        
    }
    else {return cont}
    
}
print(solve(n: 16, d: 2) ?? "they cannot devide each other ")


