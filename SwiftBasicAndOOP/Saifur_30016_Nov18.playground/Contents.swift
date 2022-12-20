import UIKit
/*

enum ErrorHandeling:Error{
   case perfect
    case invalidID
   case incorrectPass
   case invalidInput
    
}


class StudentPortal{
    var studentID:[Int:Int] = [:]
   init(){
   studentID = [
         
        112:212,
       323:311,
       221:141,
        4345:954,
         3323:775,
        4554:854,
       5555:754
    ]
    }
    
      
    func idCheck(id:Int,pass:Int) throws{

         
//
        print("idCheck:: id: \(id)-->\(pass)")
        

       for (sid,spass) in studentID
       {
            print("loop sid:\(sid)-->\(spass)")
           if(sid == id && spass == pass){
//
              throw ErrorHandeling.perfect
//
           }
//
//
           else if(sid != id && spass == pass){
              throw ErrorHandeling.invalidID
           }
          else  if( sid == id && spass != pass){
                throw ErrorHandeling.incorrectPass

            }
               else
            {
                   throw ErrorHandeling.invalidInput

               }



       }
       
   }
}
///* :111,
// 112:212,
// 323:311,
// 221:141,
// 4345:954,
// 3323:775,
// 4554:854,
// 5555:754
// */
//
//
var students = StudentPortal()
//
var dictionary :[Int:Int] = [
      121:344,//mishandelled
       
      
      
      112:212,//ok
      323:311,//ok
      119:441,//mishandelled
      4345:954,//ok
     3323:757,//error pass
      4554:855,//error pass
      5555:754//ok
]

do {
    try students.idCheck(id: 4554, pass: 85)
}
catch ErrorHandeling.perfect{
    print("Logged In")
}
catch ErrorHandeling.incorrectPass{
    print("pass is not valid")
}
catch ErrorHandeling.invalidID{
    print("id is not in the database")
}

catch ErrorHandeling.invalidInput{
    print("fields have been mishandled")
}*/


/*
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


do {
    try stud.idCheck(sid: 115, spass: 2244)
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

*/
/*
enum UserError : Error {
    case smallSize
    case smallPass
    case bigSize
    case bigPass
    case specialChar
    case wrongPass
    case hasTaken
    case notMatch
    
    
}



class FoormValidator{
    
   public static func checkValidation(userName:String,password:String, confirmPassword:String) throws{
        let passwordLength = password.count
        let userNameLength = userName.count
        
        if(passwordLength < 10){
            throw UserError.smallPass
        }
        if(passwordLength>25){
            throw UserError.bigPass
        }
        if (userNameLength < 6)
        {
            throw UserError.smallSize
        }
        if (userNameLength > 10){
            throw UserError.bigSize
        }
        if(password != confirmPassword){
            throw UserError.notMatch
        }
    }
    
    
    
    
}
do{
    
try FoormValidator.checkValidation(userName:"Rahm",password:"String", confirmPassword:"Strig")

}
catch UserError.smallSize{
    print("username is small")
}
catch UserError.bigSize{
    print("username is big")
}
catch UserError.smallPass{
    print("password is small")
}
catch UserError.bigPass{
    print("password is big")
}

catch UserError.notMatch{
    print("pass does not match")
}
 */
import Swift
import Foundation

enum MyError: Error {
    case smallLength
    case largeLength
    case voidName
    case passwordMismatch
    case specialCharacter
    case nameTaken

}

class FormValidator{
    func validateCheck(userName:String, password:String, confirmPassword:String)throws {
        let userNameLength = userName.count
        let passwordLength = password.count
        let confirmPasswordLenngth = confirmPassword.count
        for character in userName{
            if((character >= "a" && character <= "z" ) || (character >= "A" && character <= "Z") || (character >= "0" && character <= "9")){
                continue

            }
            else {
                throw MyError.voidName
            }
        }
        if(userNameLength < 6){
            throw MyError.smallLength
        }
        if(userNameLength > 12){
            throw MyError.largeLength
        }
        if(passwordLength != confirmPasswordLenngth){
            throw MyError.passwordMismatch
        }
        if(passwordLength < 8){
            throw MyError.smallLength
        }
        if(passwordLength > 16){
            throw MyError.largeLength
        }

        var smallChar:Bool = false
        var capitalChar:Bool = false
        var specialChar:Bool = false
        var number:Bool = false
        var space:Bool = false
        for character in password{
            if(character >= "a" && character <= "z"){
                smallChar = true
            }
            else if(character >= "A" && character <= "Z"){
                capitalChar = true
            }
            else if(character >= "0" && character <= "9"){
                number = true
            }
            else if(character == " "){
                space = true
            }
            else{
                specialChar = true
            }
        }
        if(!smallChar){
            throw MyError.voidName
        }
        if(!capitalChar){
            throw MyError.voidName
        }
        if(!number){
            throw MyError.voidName
        }
        if(!specialChar){
            throw MyError.specialCharacter
        }
        if(space){
            throw MyError.voidName
        }
        if (password == confirmPassword){
            print("Password Matched")
        }
        else{
            throw MyError.passwordMismatch
        }


         
    }
}

var formValidator = FormValidator()
do{
    try formValidator.validateCheck(userName: "Saifur", password: "Saifur@123", confirmPassword: "Saifur@123")
    print("Check Passed")
}
catch MyError.smallLength{
    print("Length is too small")
}
catch MyError.largeLength{
    print("Length is too large")
}
catch MyError.voidName{
    print("Name is void")
}
catch MyError.passwordMismatch{
    print("Password Mismatch")
}
catch MyError.specialCharacter{
    print("Password must contain special character")
}
catch MyError.nameTaken{
    print("Name is already taken")
}





