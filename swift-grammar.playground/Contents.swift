import Foundation

var array = ["blogs"]
array[0] = "books"
print(array)

var dict = [String: String]()
dict["key1"] = "value1"
print(dict)

var optionalString: String? = "Hello"
print(optionalString == nil)

var optionalName: String? = nil
var greeting = "Hello!"
if let name = optionalName {
    greeting = "Hello, \(name)"
} else {
    greeting = "World"
}

optionalName = "test"
if optionalName != nil {
    print("OptionalName: \(optionalName!)")
}

let vegetable = "red pepper"
switch vegetable {
    case "celery":
        print("not possible")
    default:
        print("haah")
}

for (key, value) in dict {
    print(key, value)
}

var n = 2
while n < 100 {
    n = n * 2
}
print(n)

for i in 0...4 {
  print(i)
}

func greet(name: String, day: String) -> String {
    return "Hello \(name), today is \(day)"
}
greet("aaron", day: "Friday")

func returnTuple(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    return (0, 1, 2)
}
let tuple = returnTuple([1,2,3])
print(tuple.sum)

func sumOf(numbers: Int...) -> Int {
    var sum = 0
    for number in numbers {
        sum += number
    }
    return sum
}
sumOf(0,1,2,3)

func returnFifteen() -> Int {
    var y = 10
    func add() {
        y += 5
    }
    add()
    return y
}
returnFifteen()

func makeIncrementer(number: Int) -> (() -> Int) {
    var number2 = number
    func addOne() -> Int {
        number2 += 1
        return number2
    }
    return addOne
}
var increment = makeIncrementer(4)
increment()
increment()
increment()

func hasAnyMatches(list: [Int], condition: Int -> Bool) -> Bool {
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
var numbers = [20, 32, 12, 0, 3]
hasAnyMatches(numbers, condition: lessThanTen)

let ret = numbers.map({
    (number: Int) -> Int in
    let result = 3 * number
    return result
})
print(ret)

let mappedNumbers = numbers.map() { number in 3 * number}

let sortedNumbers = numbers.sort { $0 > $1 }
print(sortedNumbers)

class Shape {
    var numberOfSides = 0
    let color = "red"
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
    func speak(something: String) {
        print(something)
    }
}

var shape = Shape()
shape.numberOfSides = 4
print(shape.simpleDescription())
shape.speak("hello")

class Square: Shape {
    override func speak(something: String) {
        print("haha")
    }
}
var square = Square()
square.speak("")

enum Rank: Int {
    case Ace = 1
    case Two, Three, Four
    case Jack, Queue, King
    func simpleDescription() -> String {
        switch self {
        case .Ace:
            return "ace"
        default:
            return String(self.rawValue)
        }
    }
}
let ace = Rank.Ace
let aceRawValue = ace.rawValue
print(ace.rawValue)
let two = Rank(rawValue: 100)

enum Suit {
    case Spades, Hearts
}
let hearts = Suit.Hearts
print(hearts)

struct Card {
    var rank: Rank
    var suit: Suit
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit)"
    }
}
let threeOfHearts = Card(rank: .Three, suit: .Hearts)
print(threeOfHearts.simpleDescription())

protocol ExampleProtocol {
    var simpleDescription: String { get }
    mutating func adjust()
}

class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "A very simple class"
    var anotherProperty: Int = 123
    func adjust() {
        simpleDescription += "hahaha"
    }
}
var a = SimpleClass()
a.adjust()
print(a.simpleDescription)

extension Int: ExampleProtocol {
    var simpleDescription: String {
        return "The number \(self)"
    }
    mutating func adjust() {
        self += 7
    }
}
print(7.simpleDescription)

func repeatItem<Item>(item: Item, numberOfTimes: Int) -> [Item] {
    var result = [Item]()
    for _ in 0..<numberOfTimes {
        result.append(item)
    }
    return result
}
repeatItem("knock", numberOfTimes: 7)

var word = "cafe"
print("\(word.characters.count)")
word += "\u{301}"
print("\(word.characters.count), \(word.endIndex)")
print("\(word[word.endIndex.predecessor()])")

var arr = Array<Int>()
print(arr.isEmpty, arr)

var shoppingList = ["Chocolate Spread", "Cheese", "Butter"]
shoppingList[0...1] = ["a", "b"]
print(shoppingList)

for (index, value) in shoppingList.enumerate() {
    print(index, value)
}

class Movie {
    var name: String
    var director: String
    var v: String!
    let c = ""
    
    init (name: String, director: String) {
        self.name = name
        self.director = director
    }
}

let someObjects: [AnyObject] = [
    Movie(name: "2001: A Space Odyssey", director: "Stanley Kubrick"),
    Movie(name: "Moon", director: "Duncan Jones"),
    Movie(name: "Alien", director: "Ridley Scott")
]
let m = someObjects[0] as! Movie
let o = m as Any

//==============================================================================
enum CustomError: ErrorType {
    case Error1
    case Error2
}

func throwingMethod() throws {
    throw CustomError.Error1
}

func callThrowingMethod() throws {
    try throwingMethod()
}

//==============================================================================

class StringUtils {
    
    class func isEmpty(str: String?) -> Bool {
        if let str = str {
            return str.isEmpty
        } else {
            return true
        }
    }
    
    class func notToNil(str: String?) -> String {
        return isEmpty(str) ? "" : str!
    }
    
    static let machineId3BytesStr = String(format: "%06x", Int(drand48() * 0xFFFFFF))
    static var counter3Bytes = Int(drand48() * 0xFFFFFF)
    static let counterIncLock = "whatever"
    
    class func genServerId() -> String {
        let timestamp4Bytes = Int(NSDate().timeIntervalSince1970)
        let timestamp4BytesStr = String(format: "%08x", timestamp4Bytes)

        let processId2Bytes = NSProcessInfo.processInfo().processIdentifier % 0xFFFF;
        let processId2BytesStr = String(format: "%04x", processId2Bytes)
        
        objc_sync_enter(counterIncLock)
        counter3Bytes = (counter3Bytes + 1) % 0xFFFFFF
        let counter3BytesStr = String(format: "%06x", counter3Bytes)
        objc_sync_exit(counterIncLock)
        
        return "\(timestamp4BytesStr)\(machineId3BytesStr)\(processId2BytesStr)\(counter3BytesStr)"
    }
    
}

var ret1 = 0
var ret2 = Set<String>()
for index in 1...9999 {
    let id = StringUtils.genServerId()
    ret2.insert(id)
    ret1++
}
print(ret, ret2.count)

