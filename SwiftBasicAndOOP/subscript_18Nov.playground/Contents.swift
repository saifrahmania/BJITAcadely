import UIKit
/*
class DaysofWeek {
    private var days : [String:String] = [
                                       "0":"sunday",
                                       "1": "monday",
                                       "2":"tuesday",
                                       "3":"wednesday",
                                       "4":"thirsday",
                                       "5":"fruday",
                                       "6":"saturday"
                                    ]
    subscript(index:String)->String{
        get{
            return days[index]!
        }
        set (newValue){
            self.days[index] = newValue
        }
    }
}

var day = DaysofWeek()
print(day["0"])
 */

//MARK: Code from Abser
/*
class Days {
    private var s = ["Sun", "Mon", "Tue"]
    private var time = ["morning","evening","afternoon"]
    
    
    subscript(index: Int) -> String {
        get {
            return s[index]
        }
        set(newValue) {
            self.s[index] = newValue
        }
    }
    
    
    /*subscript(index: String) -> String {
        if let idx = Int(index) {
            return time[idx]
        } else {
            return ""
        }
    }*/
    subscript(index: String)->() {
        if let idx = Int(index) {
            print(time[idx])
        } else {
            print("Blank")
        }
    }
}
/**
        get  and let er khetre return type thaka mendatory
            other wise it will not work
            
 **/

var x = Days()
//print(x[0])
//print(x["1"])
x["1"]
*/
/*
class DaysofWeek {
    
    private var days1: [String: Any] = ["Name": "Kazi", "Age": "24", "Org": "BJIT"]
    private var days2: [String: Any] = ["Name": "Absar", "Age": "24", "Org": "BJIT"]

    
    subscript(days1 idx1: String)->Any{
        get{
            return days1[idx1]
        }
    }
    
    subscript(days2 idx1: String)->Any{
        get{
            return days2[idx1]
        }
    }


}
var days = DaysofWeek()
print(days[days1: "Name"])
print(days[days2: "Name"])*/
/*
enum DivisionError:Error{
    case dividedByZero
}

func dibision(numerator:Int, denominator:Int){
    if (denominator == 0){
        //throw
    }
    else{
        let result = numerator/denominator
        print(result)
    }
}

do{
    //optional
}
 */

enum EntryPass:Error{
    case perfect
    case idError
    case passError
    case invalid
}
    
class Student{
    var studentID:[Int:Int] = [
        112:2211,
        323:1254,
        125:9944
    ]
    
    func idCheck(sid:Int,spass:Int) throws
    {
        for (id,pass) in studentID{
            print("id:  \(id)--> pass:  \(pass)")
            if(id==sid && pass == spass){
                throw EntryPass.perfect
            }
            else if(id != sid && pass == spass){
                throw EntryPass.idError
            }
            else if(id == sid && pass != spass){
                throw EntryPass.passError
            }
            else{
                throw EntryPass.invalid
        }
    }
}
}

var stud = Student()
var dict[Int:Int] =

[
    112:2211,
    32:1254,
    125:994,
    
]
for (id, pass) in dict{
    
    do {
        try stud.idCheck(sid: id, spass: pass)
    }
    catch EntryPass.perfect {
        print("Logged in")
    }
    catch EntryPass.idError{
        print("invalid id")
    }
    catch EntryPass.passError{
        print("wrong pass")
        
    }
    catch EntryPass.invalid{
        print("enter valid input")
    }

}


