import UIKit

class Class{
    func isTaken(){
        print("Class is being taken")
    }
    func isAttended(class:String){
        print("Has attended class")
    }
    func salaryPayment(id:String,department:String){
        print("payment has been updated")
    }
}

class Student: Class{
    override func isTaken() {
        print("student's HW is not being taken ")
    }
    override func isAttended(class: String) {
        print("student has not attended the class")
    }
    override func salaryPayment(id:String,department:String){
        print("payment has not been completed ")
    }
    
}
let student = Student()
student.isTaken()
student.isAttended(class: "class")
student.salaryPayment(id: "er251", department: "EEE")

class Teacher: Class{
    override func isTaken() {
        print("Faculty did not give any HW")
    }
    override func isAttended(class: String) {
        print("Faculty was not able to attend the class due to his sickness")
    }
    override func salaryPayment(id:String,department:String){
        print("payment has been done")
    }
}
let teacher = Teacher()
teacher.isTaken()
teacher.isAttended(class: "has not attended")
teacher.salaryPayment(id: "cc12", department: "CSE")

