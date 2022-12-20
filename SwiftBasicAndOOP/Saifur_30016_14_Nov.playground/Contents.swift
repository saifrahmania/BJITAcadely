import UIKit
//solve 1
func solve( _ s1: String,_ s2:String)->Bool
{
    var set1 = Set<Character>()
    var set2  = Set<Character>()
    for ch in s2 {
        set2.insert(ch)

    }
    for ch in s1{
        set1.insert(ch)
    }
    
    return set1==set2

}

print(solve("aaa", "b"))

	
/*
 
 */
//solve 2
func combine(_ a1:[Int],_ a2:[Int],_ operation:(Int,Int)->Int )->[Int]{
    var res:[Int] = []
    for i in 0..<a1.count{
        res.append( operation(a1[i],a2[i]))
    }
    return res

}
	




var arr1 = [5,14,77,12]
var arr2 = [1,5,3,13]

let result1 = combine(arr1,arr2) {
    ($0 * $1) * ($0 * $1)
    
}

let result2 = combine( arr1 , arr2) {
    max($0 , $1)
    
}



print(result1)
print(result2)

//solve 3

//enum Faction {
//    case greens
//    case blacks
//}
//let houses: [String: Faction] = [
//    "Baratheon" : .greens,
//    "Stark" : .blacks,
//    "Hightower" : .greens,
//    "Velaryon" : .blacks,
//    "Lannister" : .greens,
//    "Arryn" : .blacks
//]
//
//func getLoyalists(for f:Faction,from houses:[String:Faction])->()->[String]
//{
//    var res:[String] = []
//    func doWork()->[String]{
//        for (key,values) in houses{
//            if(values==f)
//            {
//                res.append( key)
//            }
//        }
//        return res
//    }
//    return doWork
//
//}
//
//let greenLoyalists  = getLoyalists(for: .greens, from: houses)
//let blacks : [String] = greenLoyalists().sorted()
//print(blacks)
//
//
