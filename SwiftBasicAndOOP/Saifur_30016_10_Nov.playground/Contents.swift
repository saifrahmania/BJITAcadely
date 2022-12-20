//import UIKit
//
//
//func addExclm(to tex : String) -> () -> String{
//    var greeting = tex
//    func to() -> String{
//        greeting += "!"
//        print(greeting)
//        return greeting
//    }
//    return to
//}
//
//let sayHi = addExclm(to: "hello")
//sayHi()
//sayHi()
//sayHi()
//
//
//
//
//func drawUsing(char  : String)-> () -> String{
//    var st = "      "
//    func drawStar() -> String{
//        st.remove(at: st.startIndex)
//        st = st + char
//        return st
//
//    }
//    return drawStar
//}
//
//
//let draw = drawUsing(char: "+")
//
//for _ in 1...5 {
//    print(draw())
//}
//
//func drawUsing(char  : String)-> () -> String{
//    var st = ""
//    func drawStar() -> String{
//        st = st + char
//        return st
//
//    }
//    return drawStar
//}
//
//
//let draw = drawUsing(char: "*")
//
//for i in 1...5 {
//
//    print(draw())
//}

func a(b: @escaping () -> ()) -> () -> () {
func c() {
print("c")
}
return b
}
let result = a{
print("b")
}
result()
print("Here c is a nestate function which is why c can be returned easily from the function but b is not a part of the function except it is a parammeter of the function which is why without excapping we will not be return this value from the function ")
