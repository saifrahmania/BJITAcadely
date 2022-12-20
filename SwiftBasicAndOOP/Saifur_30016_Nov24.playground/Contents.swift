//Ans 1

import Foundation
enum NameCheck:Error{
    case fullName(String)
    case id(Int)
    case dept(Int)
}

class Employee{
    var completeName:String
    var uniID:Int
    var dept:String
    init(name:String,uniID:Int, dept:String){
        self.completeName = name
        self.uniID = uniID
        self.dept = dept
    }
    func printDetails(){
        print("Name: \(self.completeName)")
        print("UniID: \(self.uniID)")
        print("Dept: \(self.dept)")
    }
    
    
    
}

class Student: Employee{
    var semester: Int
    var cgpa:Double
    init(name:String,uniID:Int, dept:String,semester:Int, cgpa:Double){
        self.semester = semester
        self.cgpa = cgpa
        super.init(name: name, uniID: uniID
                   , dept: dept)
    }
    override func printDetails() {
        printDetails()
        print("Semester: \(self.semester)")
        print("CGPA\(self.cgpa)")
    }
}
//print("\()")
class Teacher: Employee{
    var desig:String
    var salary:Double
    init(name:String,uniID:Int, dept:String,desig:String,salary:Double){
        
        self.salary = salary
        self.desig = desig
        super.init(name: name, uniID: uniID, dept: dept)
    }
    override func printDetails() {
        printDetails()
        print("Desig: \(self.desig)")
        print("Salaru: \(self.salary)")
        
    }
}

var s1 = Student(name: "Asif", uniID: 1211, dept: "CSE", semester: 6, cgpa: 3.32)
s1.printDetails()
var f1 = Teacher(name: "Amin", uniID: 3632, dept: "EEE", desig: "AssociateProfessor", salary: 90_000)
f1.printDetails()

//Ans 2
extension String{
    func isPallindrome()->Bool {
        let reverseS = self.reversed()
        var newS = ""
        for i in reverseS{
            newS.append(i)
            
        }
        return newS == self
        
    }
}

let str1 = "civic"
print(str1.isPallindrome())
 
let str2 = "swift"
print(str2.isPallindrome())
 
print("radar".isPallindrome())


//Ans 3

protocol QueueProtocol{
    associatedtype T


var items: [T] {get }
func isEmpty()->Bool

mutating func enqueue(_ item :T)
mutating func dqueue()->T
func peek()->T
func isHead (_ item: T)->Bool
}
struct Queue<T>:QueueProtocol{
    
    
    var items: [T] = []
    
    func isEmpty() -> Bool {
        if items.count == 0{
            return true
        }
        else{
            return false
        }
    }
    
    mutating func enqueue(_ item: T) {
        items.append(item)
    }
    
   mutating func dqueue() -> T {
        items.removeFirst()
    }
    
     func peek() -> T {
        return items as! T
        
    }
    
    func isHead(_ item: T) -> Bool {
        let head:Bool = isHead(item)
        return head
    }
    
    
    
}

var queue1 = Queue<Double>()
queue1.enqueue(4.2)
queue1.enqueue(5.1)
//print(queue1.dequeue()!)
queue1.enqueue(1.2)
print(queue1.items)
print(queue1.isEmpty())
//print(queue1.peek()!)

