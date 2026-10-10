# Swift Closures Cheatsheet

## The general pattern

```swift
func funcName(paramLabel: (InputTypes) -> ReturnType) { }
```

The closure's *type* is `(InputTypes) -> ReturnType`. Everything below is just varying what goes inside `()` and after `->`.

---

## 1. No parameters, no return value

```swift
func doSomething(action: () -> Void) {
    action()
}

doSomething(action: {
    print("Done")
})

// Trailing closure syntax (preferred when closure is the last param)
doSomething {
    print("Done")
}
```

## 2. No parameters, with return value

```swift
func getGreeting(provider: () -> String) {
    print(provider())
}

getGreeting {
    "Hello!"
}
```

## 3. One parameter, no return value

```swift
func process(handler: (Int) -> Void) {
    handler(42)
}

process { number in
    print(number)
}
```

## 4. One parameter, with return value

```swift
func transform(handler: (Int) -> String) {
    print(handler(5))
}

transform { number in
    "Value: \(number)"
}
```

## 5. Two parameters, with return value

```swift
func combine(operation: (Int, Int) -> Int) {
    print(operation(3, 4))
}

combine { a, b in
    a + b
}
```

## 6. Three+ parameters

```swift
func mix(operation: (Int, String, Bool) -> String) {
    print(operation(1, "x", true))
}

mix { number, text, flag in
    "\(number)-\(text)-\(flag)"
}
```

## 7. Named/labeled closure parameters (in the type itself — for clarity only, not enforced)

```swift
// Argument labels inside a closure type are documentation only,
// you still just use positional names in the closure body
func request(completion: (_ data: Data?, _ error: Error?) -> Void) {
    completion(nil, nil)
}

request { data, error in
    // data, error are just names you choose here
}
```

## 8. Closure with multiple return-type shapes

```swift
// Returning Optional
func find(matcher: (Int) -> Bool?) { }

// Returning a tuple
func stats(calc: ([Int]) -> (min: Int, max: Int)) { }

stats { numbers in
    (numbers.min() ?? 0, numbers.max() ?? 0)
}
```

## 9. Closure as a variable / stored property

```swift
var onTap: () -> Void = { print("tapped") }
var adder: (Int, Int) -> Int = { a, b in a + b }

let sum = adder(2, 3)
```

## 10. Optional closures

```swift
func setup(completion: (() -> Void)?) {
    completion?()
}

var callback: ((String) -> Void)? = nil
```

Note the parentheses: `(() -> Void)?` — the `?` applies to the whole closure type, not just `Void`.

## 11. Escaping closures (stored/used after the function returns)

```swift
func fetchData(completion: @escaping (String) -> Void) {
    DispatchQueue.global().async {
        completion("result")
    }
}
```

Use `@escaping` whenever the closure is stored in a property, added to an array, or called asynchronously later.

## 12. Autoclosure (caller writes a plain expression, not `{ }`)

```swift
func logIfTrue(_ condition: @autoclosure () -> Bool) {
    if condition() {
        print("true!")
    }
}

logIfTrue(5 > 3) // no braces needed at call site
```

## 13. Multiple trailing closures (Swift 5.3+)

```swift
func loadImage(
    url: String,
    onSuccess: (Data) -> Void,
    onFailure: (Error) -> Void
) { }

loadImage(url: "x") { data in
    print(data)
} onFailure: { error in
    print(error)
}
```

## 14. Generic closures

```swift
func apply<T, U>(_ value: T, transform: (T) -> U) -> U {
    transform(value)
}

let result = apply(10) { $0 * 2 }
```

## 15. Shorthand argument syntax (progressively terser)

```swift
let add: (Int, Int) -> Int = { a, b in a + b }
let add2: (Int, Int) -> Int = { $0 + $1 }        // shorthand args
let add3 = [1, 2, 3].reduce(0, +)                 // operator as closure
```

---

## Quick reference table

| Signature | Meaning |
|---|---|
| `() -> Void` | no input, no output |
| `() -> String` | no input, returns String |
| `(Int) -> Void` | one input, no output |
| `(Int) -> String` | one input, returns String |
| `(Int, Int) -> Int` | two inputs, returns Int |
| `(Int, String, Bool) -> String` | three inputs, returns String |
| `(() -> Void)?` | optional closure |
| `@escaping (String) -> Void` | closure that outlives the function call |
| `@autoclosure () -> Bool` | wraps a plain expression automatically |
| `(T) -> U` | generic closure |

## Rule of thumb for calling
- Closure is the **last** (or only) parameter → use **trailing closure syntax** (drop the label, use `{ }` after the parens or instead of them).
- Multiple closures → Swift 5.3+ lets you chain multiple trailing closures with labels.
- Need to store, delay, or pass the closure elsewhere → mark it `@escaping`.
