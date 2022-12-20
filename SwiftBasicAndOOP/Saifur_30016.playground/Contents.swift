import UIKit

import Foundation
print("solve 1:")
var point = (x:2,y:0)
if(point.x==0 && point.y==0){
    print("The point is located on the Origin")
}
else if(point.x==0 ){
    print("The point is located on the X-axis")
}
else if(point.y==0){
    print("The point is located on the Y-axis")
}
else if(point.x>0 && point.y>0)
{
    print("The point is located on the First coordinate")
}
else if(point.x<0 && point.y>0){
    print("The point is located on the 2nd Coordinate")
}
else if(point.x<0 && point.y<0){
    print("The point is located on the 3rd Coordinate")
}
else{
    print("The point is located on the 4th Coordinate")
}


print("\nsolve 2")

var marks : Int = 75

switch marks{
case 90...100:
    print("A")
case 83..<90:
    print("B+")
case 80..<83:
    print("B")
case 73..<80:
    print("B-")
case 67..<73:
    print("C")
case 60..<67:
    print("D")
default:
    print("F")
}
print("\nSolve 3(i)")

var flag:Bool = false
let num: Int = 1
if(num==1){
    flag = true
}
var i = 2
while(i<num){
    
    
    if(num % i==0){
        flag = true
        break
    }
    i+=1
}

flag == true ? print("\(num) is not a prime ") : print("\(num) is a prime ")
    
print("\nsolve 3(ii)")
var arr : [Int] = [1,2,3,4,5]
var sum  = 0;

for i in arr{
    sum+=i
}

print(sum);

print("\nsolve 3(iii)")

let greens : [String:Int] = [ "Rhaenyra": 32, "Daemon": 48, "Jacaerys": 15, "Lucerys": 14, "Joffrey": 12, "Aegon": 9, "Viserys": 7 ]

var mini = Int.max
var maxi = Int.min
var youngestPerson = ""
var oldestPerson = ""
for(name, age) in greens{
    if(age<mini){
        mini = age
        youngestPerson = name
    }
    if(age>maxi){
        maxi = age
        oldestPerson = name
    }
}

print("Youngest person is \(youngestPerson) and Oldest person \(oldestPerson)")

print("\nSolution 3(iv)")

let cse475:Set = [10001,10002,10003, 10004, 10005, 10006, 10007]

let cse488:Set = [10001,10005, 10006, 10009, 10015, 10005]

var bothCourse = cse475.intersection(cse488)
var notCSE475 = cse475.subtracting(cse488)
var notCSE488 = cse488.subtracting(cse475)

print("Both course has been taken by : \(bothCourse)")
print("Only CSE475 has been taken by \(notCSE475)")
print("Only CSE488 has been taken by \(notCSE488)")


