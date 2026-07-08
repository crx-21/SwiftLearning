# Swift Syntax Cheatsheet

## Optionals

```swift
var name: String?              // Optional String, defaults to nil
var age: Int? = 25             // Optional with value

// Force unwrap (dangerous — crashes if nil)
let forced = name!

// Optional chaining
let count = name?.count

// Nil-coalescing (default value if nil)
let safeName = name ?? "Unknown"
```

## `if let` — Optional Binding

```swift
if let name = name {
    print("Hello, \(name)")
}

// Shorthand (Swift 5.7+): unwrap into a variable with the same name
if let name {
    print("Hello, \(name)")
}

// Multiple bindings, checked in order
if let name, let age, age >= 18 {
    print("\(name) is an adult")
}
```

## `guard` — Early Exit

```swift
func greet(_ name: String?) {
    guard let name = name else {
        print("No name provided")
        return          // must exit scope: return, break, continue, or throw
    }
    print("Hello, \(name)")
    // `name` is available for the REST of the function, unlike `if let`
}

// guard with a condition (not just unwrapping)
func checkAge(_ age: Int) {
    guard age >= 18 else {
        print("Too young")
        return
    }
    print("OK")
}
```

**`if let` vs `guard let`:** `if let` scopes the unwrapped value to its block; `guard let` unwraps and keeps the value available afterward, forcing you to handle the failure case immediately.

## `as?`, `as!`, `as` — Type Casting

```swift
let value: Any = "Hello"

// as? — safe cast, returns Optional
if let str = value as? String {
    print(str)
}

// as! — forced cast, crashes if wrong type
let str2 = value as! String

// as — upcast (always succeeds, no failure possible)
let number: Int = 5
let anyNumber = number as Any

// switch with pattern matching casts
switch value {
case let str as String:
    print("It's a string: \(str)")
case let num as Int:
    print("It's an int: \(num)")
default:
    print("Unknown type")
}
```

## `_` — Underscore (Wildcard)

```swift
// Ignore a value
let (_, second) = (1, 2)

// Omit external parameter label when calling
func greet(_ name: String) { print("Hi \(name)") }
greet("Sam")            // no label needed

// Ignore loop variable
for _ in 1...5 {
    print("Tick")
}

// Ignore a return value / pattern match
_ = someFunctionWithResult()
```

## Argument Labels

```swift
// externalLabel internalName: Type
func move(from start: Int, to end: Int) {
    print("Moving from \(start) to \(end)")
}
move(from: 0, to: 10)

// Same label and name
func greet(name: String) { }
greet(name: "Sam")

// No label with `_`
func add(_ a: Int, _ b: Int) -> Int { a + b }
add(2, 3)
```

## `in` — Multiple Uses

```swift
// 1. Closures: separates parameters/return type from body
let sum = { (a: Int, b: Int) -> Int in
    return a + b
}

// 2. for-in loops
for i in 1...5 {
    print(i)
}

// 3. Ranges / membership checks
let range = 1...10
if 5 in range { }         // not valid syntax — use `.contains`
if range.contains(5) { print("yes") }

// 4. switch case matching with `where`/ranges
switch 7 {
case 1..<5: print("low")
case 5...10: print("high")
default: break
}
```

## Labels for Loops & Control Flow

```swift
outerLoop: for i in 1...3 {
    for j in 1...3 {
        if j == 2 {
            continue outerLoop
        }
        if i == 3 {
            break outerLoop
        }
        print("i=\(i), j=\(j)")
    }
}
```

## Closures

```swift
// Full syntax
let multiply: (Int, Int) -> Int = { (a: Int, b: Int) -> Int in
    return a * b
}

// Shorthand argument names
let doubled = [1, 2, 3].map { $0 * 2 }

// Trailing closure syntax
func fetchData(completion: () -> Void) { completion() }
fetchData {
    print("Done")
}

// @escaping closures (outlive the function call, e.g. stored or async)
func loadData(completion: @escaping (String) -> Void) {
    DispatchQueue.main.async {
        completion("Loaded")
    }
}
```

## Enums

```swift
enum Direction {
    case north, south, east, west
}

// With associated values
enum Result<T> {
    case success(T)
    case failure(Error)
}

switch result {
case .success(let value):
    print("Got \(value)")
case .failure(let error):
    print("Error: \(error)")
}

// Raw values
enum Planet: Int {
    case mercury = 1, venus, earth
}
```

## Structs vs Classes

```swift
struct Point {          // value type (copied on assignment)
    var x: Int
    var y: Int
}

class Car {             // reference type (shared on assignment)
    var speed: Int = 0
}
```

## Protocols & Extensions

```swift
protocol Describable {
    var description: String { get }
    func describe()
}

extension Describable {
    func describe() {
        print(description)
    }
}

extension Int: Describable {
    var description: String { "The number is \(self)" }
}
```

## Error Handling

```swift
enum NetworkError: Error {
    case timeout
    case notFound
}

func fetch() throws -> String {
    throw NetworkError.timeout
}

do {
    let result = try fetch()
    print(result)
} catch NetworkError.timeout {
    print("Timed out")
} catch {
    print("Other error: \(error)")
}

// try?  → returns Optional, discards error
let value = try? fetch()

// try!  → force try, crashes on error
let value2 = try! fetch()
```

## Generics

```swift
func swapValues<T>(_ a: inout T, _ b: inout T) {
    let temp = a
    a = b
    b = temp
}

struct Stack<Element> {
    var items: [Element] = []
    mutating func push(_ item: Element) { items.append(item) }
    mutating func pop() -> Element? { items.popLast() }
}
```

## `inout` Parameters

```swift
func increment(_ number: inout Int) {
    number += 1
}
var x = 5
increment(&x)   // must use & when calling
```

## Property Wrappers (common ones)

```swift
@State private var count = 0        // SwiftUI local state
@Binding var isOn: Bool             // SwiftUI two-way binding
@Published var name: String = ""    // Combine/ObservableObject
lazy var expensive = computeValue() // computed once, on first access
```

## Quick Reference Table

| Symbol / Keyword | Meaning |
|---|---|
| `?` | Optional type |
| `!` | Force unwrap / implicitly unwrapped optional |
| `as?` | Safe downcast → Optional |
| `as!` | Forced downcast → crashes on failure |
| `as` | Upcast, always safe |
| `_` | Ignore value / omit argument label |
| `if let` | Conditionally unwrap, scoped to block |
| `guard let` | Unwrap or exit early, value persists after |
| `in` | Closure body separator / for-loop / ranges |
| `label:` | Named loop or argument label |
| `??` | Nil-coalescing operator |
| `->` | Function return type arrow |
| `inout` | Pass parameter by reference |
| `try` / `try?` / `try!` | Error propagation variants |
| `@escaping` | Closure that outlives the function call |
| `mutating` | Struct/enum method that modifies `self` |
