import UIKit

protocol ProtocolA{
    
}


protocol ProtocolB{
    associatedtype ElementsB
    var items2:[ElementsB]{get set}
}

extension ProtocolB where ElementsB: ProtocolA{
    func sumFunc(){
        print("Somefunc Has been accessed")
    }
}
struct Type1 : ProtocolA{}
    

struct Type2<T> :  ProtocolB{
    var items2:[T] = []
    typealias ElementsB = T
    
}

var a = Type1()
var b = Type2<Type1>(items2: [a,a,a,a])
b.sumFunc()








