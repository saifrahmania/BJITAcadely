import UIKit

struct Student{
    var id : String
    var department:String
    var courses:[Course] = []
    
    
    init(id:String){
        self.id = id
        department = "CSE"
    }
    
    init(id:String,dept:String){
        self.id = id
        department = dept
    }
     
    
    mutating func addCourses(newCourses:Course){
         courses.append(newCourses)
        
    }
    var earnedCredit:Double {
        var total:Double = 0.0
        for i in courses{
            total += i.totalCredit
            
        }
        return total
    }
    var cgpa:Double{
        var total:Double = 0
        for i in courses{
            total  += (i.gpa * i.totalCredit)
        }
        return total/earnedCredit
    }
    
    
    
}



struct Course{
    var courseCode:String
    var totalCredit:Double
    var gpa:Double
    
}

var s1 = Student(id: "1")
 
s1.addCourses(newCourses: Course(courseCode: "CSE105", totalCredit: 4, gpa: 3.7))
s1.addCourses(newCourses: Course(courseCode: "CSE107", totalCredit: 4, gpa: 3.5))
s1.addCourses(newCourses: Course(courseCode: "CSE205", totalCredit: 3, gpa: 3.7))
s1.addCourses(newCourses: Course(courseCode: "CSE207", totalCredit: 4, gpa: 3.5))
s1.addCourses(newCourses: Course(courseCode: "CSE225", totalCredit: 4, gpa: 4.0))
s1.addCourses(newCourses: Course(courseCode: "CSE245", totalCredit: 4, gpa: 3.3))
print(s1.earnedCredit)
print(s1.cgpa)






