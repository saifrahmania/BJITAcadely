import UIKit

var greeting = "Hello, playground"
struct Rectangle{
    var height:Double
    var width:Double
    var area: Double{
        return height*width
    }
}

var obj = Rectangle(height: 3.0, width: 2.0)
print(obj.area		)
