import UIKit

print("Solve : 1(i)")
(i) Consider the following dictionary which contains the user id (String) and role of several users: let data: [String:User] = [ "A00123" : User.admin, "M00111" : User.moderator, "M00131" : User.moderator, "U00113" : User.member, "U00422" : User.member, "U01608" : User.member, "U07712" : User.member, "U09002" : User.member ] The three possible roles of different users (i.e. admin, moderator, member) should be defined within an enum called User. Write a function getUser() that takes the role of a user and the dictionary given above as arguments and returns an array of user ids that match the role. Hints: To check if two cases of and enum are the same, an enum has to conform to the equatable protocol as shown below: enum Example: Equatable { case a case b case c }Now it’s possible to check whether two enum cases have the same value, for example: Example.a == Example.a will evaluate as true Example.a == Example.b will evaluate as false Finally, you should be able to call the function as follows: let results = getUser(role: User.member, in: dataOld) print(results) Output: ["U09002", "U00422", "U07712", "U00113", "U01608"]
enum User{
    case admin
    case moderator
    case member
}

let data: [String:User] = [
    "A00123" :User.admin,
    "M00111" : User.moderator,
    "M00131" : User.moderator,
    "U00113" : User.member,
    "U00422" : User.member,
    "U01608" : User.member,
    "U07712" : User.member,
    "U09002" : User.member
]
func getUser(role: User, in :[String:User] )->[ String]{
    var reslt:[String] = []
    for(id,person) in data{
        if(person==role){
            reslt.append(id)

        }
    }
    return reslt
}
let result  = getUser(role: User.member ,in: data)
print(result)
print("\nSolve : 1(ii)")

//(ii) Now assume that the member role can have three ranks, namely, expert, intermediate, and beginner. Create another enum called Rank based on these ranks. Now modify the User enum that you wrote before and implement the rank for the member case using associated values. Modify or overload the function from your previous solution in such a way that it can now handle the associated value for member case. Example/Hint: You should be able to call the function as follows: let results = getUser(role: User.member(rank: Rank.intermediate), in: data) print(results) Output: ["U01608", "U07712"]
enum Rank{
    case beginner
    case intermediate
    case expert
}
enum User:Equatable{
    case admin
    case moderator
    case member(role:Rank)
}

let data: [String:User] = [
    "A00123" : User.admin,
    "M00111" : User.moderator,
    "M00131" : User.moderator,
    "U00113" : User.member(role: Rank.expert),
    "U00422" : User.member(role: Rank.expert),
    "U01608" : User.member(role: Rank.intermediate),
    "U07712" : User.member(role: Rank.intermediate),
    "U09002" : User.member(role: Rank.beginner) ]

func getUser(role: User, in :[String:User] )->[ String]{
    var reslt:[String] = []
    for(id,person) in data{
        if(person==role){
            reslt.append(id)

        }
    }
    return reslt
}
let result  = getUser(role: User.member(role: Rank.intermediate) ,in: data)
print(result)
