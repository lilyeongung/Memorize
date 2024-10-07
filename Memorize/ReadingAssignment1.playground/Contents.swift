import UIKit

// MARK: - Swift Tour
let explicitFloat: Float = 4

print(explicitFloat)

let label = "The width is "
let width = 94
let widthLabel = "\(label)\(width)"
print(widthLabel)


var fruits = ["strawberries", "bananas", "apples"]
fruits[2] = "grapes"

print(fruits)

var occupations = [
    "Malcom": "Captain",
    "Kaylee": "Mechanic",
    "Marie": "Doctor",
    "James": "Pilot"
]

occupations["Marie"] = "Architect"

print(occupations)


var optionalString: String? = "Hello"
print(optionalString == nil)
// Prints "false"

var optionalName: String?
var greeting = "Hello!"
if let name = optionalName {
    greeting = "Hello, \(name)"
} else {
    greeting = "Hello, Jim"
}

print(greeting)


// MARK: Functions
func greet(person: String, lunchSpecial: String) -> String {
    return "Hello \(person), todays lunch special is \(lunchSpecial)."
}

greet(person: "Andrew", lunchSpecial: "Chicken")


func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}

func lessThanTen(number: Int) -> Bool {
    return number < 10
}

var numbers = [20, 19, 7, 12]
hasAnyMatches(list: numbers, condition: lessThanTen)

// MARK: Closure
numbers.map({ (number: Int) -> Int in
    if number % 2 != 0 {
        return 0
    }
    let result = 3 * number
    return result
})




// MARK: Generics
func makeArray<Pikachu>(repeating item: Pikachu, numberOfTimes: Int) -> [Pikachu] {
    var result: [Pikachu] = []
    for _ in 0..<numberOfTimes {
        result.append(item)
    }
    return result
}

makeArray(repeating: 9, numberOfTimes: 4)

enum OptionalValue<Wrapped> {
    case none
    case some(Wrapped)
}

var possibleInteger: OptionalValue<Int> = .none
possibleInteger = .some(100)




// MARK: Tuples
let http404Error = (404, "Not Found")

let (statusCode, statusMessage) = http404Error
print("The status code is \(statusCode)")

print("The status message is \(statusMessage)")
