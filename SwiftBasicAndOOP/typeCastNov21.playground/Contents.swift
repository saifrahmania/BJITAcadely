import UIKit

// MARK: Protocols as Types

protocol RandomNumberGenerator{
    func random()->Double
}

class LinearCongruentialGenerator: RandomNumberGenerator{
    var lastRandom = 42.0
    let m = 1139968.8
    let a = 3877.0
    let c = 89898.0
    func random()->Double{
        lastRandom = ((lastRandom * a + c).truncatingRemainder(divided))
        return lastRandom / m
    }
}

let generator  = LinearCongruentialGenerator()
print("Here is a random Number :")
