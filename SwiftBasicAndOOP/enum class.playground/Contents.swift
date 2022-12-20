//enum User{
//    case admin case moderator case member
//}
//let data: [String:User] = [ "A00123" : User.admin, "M00111" : User.moderator, "M00131" : User.moderator, "U00113" : User.member, "U00422" : User.member, "U01608" : User.member, "U07712" : User.member, "U09002" : User.member ]
//
//func getUser(role: User, data: [String:User]){
//
//}

func sequenced(first:()->Void, second :()->Void){
    first()
    second()
    
}
sequenced
{
    print("first")
} second: {
    print("second")
}

 

