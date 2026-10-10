# Swift Access Control Cheatsheet

## The Levels (from most to least restrictive)

| Level | Visible where? | Subclass/override outside module? |
|---|---|---|
| `private` | Same declaration (or extensions in same file, Swift 4+) | ❌ No |
| `fileprivate` | Same file | ❌ No |
| `internal` (default) | Same module | ❌ No |
| `public` | Any module that imports it | ❌ No |
| `open` | Any module that imports it | ✅ Yes |

---

## Quick Rules

- **No modifier written = `internal`.** This is the default for everything.
- **`open` only applies to classes and their members** (properties, methods). It doesn't exist for structs, enums, protocols, functions, etc. — they max out at `public`.
- **`public` ≠ `open`.** `public` means "visible outside," not "extendable outside."
- **Within the same module**, `public` and `open` behave *identically*. The difference only matters across module boundaries (e.g. a framework someone else imports).

---

## `private` vs `fileprivate`

```swift
class Counter {
    private var count = 0        // only visible inside Counter itself
    fileprivate var label = ""   // visible anywhere else in this file
}

extension Counter {
    func increment() {
        count += 1   // ✅ private works: extension is in the same file (Swift 4+)
    }
}

struct Logger {
    func log(_ c: Counter) {
        print(c.label)   // ✅ fileprivate: same file
        // print(c.count) // ❌ private: different type
    }
}
```

Use `private` for "only this type should touch it."
Use `fileprivate` for "other stuff in this file needs it too" (rare in modern Swift).

---

## `internal` (the default)

```swift
class Car {
    var speed = 0   // implicitly internal — visible anywhere in the same module
}
```

No keyword needed. Fine for most app code where nothing crosses module boundaries.

---

## `public` — visible outside, but sealed

```swift
public class Vehicle {
    public var speed = 0
    public init() {}
    
    public func describe() -> String {
        return "Going \(speed) mph"
    }
}
```

```swift
// In another module, after `import VehicleKit`:
let v = Vehicle()             // ✅ can use it
print(v.describe())           // ✅ can call public members

class SportsCar: Vehicle {}   // ❌ ERROR — Vehicle isn't `open`
```

---

## `open` — visible AND extendable outside

```swift
open class Vehicle {
    open var speed = 0
    public init() {}
    
    open func makeNoise() -> String {
        return "..."
    }
    
    public func describe() -> String {   // public, not open
        return "\(makeNoise())"
    }
}
```

```swift
// In another module:
class SportsCar: Vehicle {                 // ✅ Vehicle is open
    override func makeNoise() -> String {  // ✅ makeNoise is open
        return "Vroom!"
    }
    
    // override func describe() -> String  // ❌ describe is only public
}
```

---

## Mental Model

Think of it as two separate questions `open` answers that `public` doesn't:

1. Can code outside my module **see** this? → answered by `public`
2. Can code outside my module **change its behavior** (subclass/override)? → answered by `open`

`public` says yes to (1), no to (2).
`open` says yes to both.

---

## When to use what

| Situation | Use |
|---|---|
| Internal helper only this type needs | `private` |
| Shared helper, same file only | `fileprivate` |
| Normal app code, single module | `internal` (default, write nothing) |
| Library API you want used but not subclassed | `public` |
| Library class specifically designed for extension (e.g. a base class meant to be customized) | `open` |

**Rule of thumb:** default to the *most restrictive* level that works, and only open things up (`public`/`open`) when you have a deliberate reason. Once something is `open` in a shipped library, you're committing to supporting arbitrary subclasses forever — it's a bigger promise than `public`.
