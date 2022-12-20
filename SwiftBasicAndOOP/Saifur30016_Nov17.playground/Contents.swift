import UIKit

class Employee{
    var employeeName:String
    var employeeID: String
    public static var count = 0
    init(name:String,id:String){
        self.employeeName = name
        self.employeeID = id
    }
    
    public static func employeeCount(){
        count+=1
        print(count)
    }
    func employeeAdd()
    {
        print("New Employee has been added")
    }
    deinit{
        print("deinit has been initiated")
    }
}

//var optional:Employee? = Employee(name: "Kirey", id: "2354")

var employee1 = Employee(name: "Akash", id: "121")
employee1.employeeAdd()
Employee.employeeCount()
//employee1 = Employee(name: "Akeash", id: "12w1")
//employee1.employeeAdd()
//Employee.employeeCount()
//employee1 = Employee(name: "Akasqqqh", id: "12r1")
//employee1.employeeAdd()
//Employee.employeeCount()
//employee1 = Employee(name: "Akaseh", id: "12c1")
//employee1.employeeAdd()
//Employee.employeeCount()
print("forloop")
for _ in 1...3{
    employee1 = Employee(name: "Akash", id: "121")
   Employee.employeeCount()
}
print("end of for")


