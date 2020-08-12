# iShapeClipper
Union, Subtract and Intersect operators between polygons

## Installation

add imports:
```swift
import iGeometry
import iShapeClipper
```
### [CocoaPods](https://cocoapods.org/)

Add the following to your `Podfile`:
```ruby
pod 'iShapeClipper'
```

### [Cartage](https://github.com/Carthage/Carthage)

Add the following to your `Cartfile`:
```
github "iShape-Swift/iShapeClipper"
```

### [Package Manager](https://swift.org/package-manager/)


Add the following to your `Package.swift`:
```swift
let package = Package(
    name: "[your name]",
    products: [
        dependencies: [
            .package(url: "https://github.com/iShape-Swift/iShapeClipper", from: "0.1.3")
        ],
        targets: [
            .target(
                name: "[your target]",
                dependencies: ["iShapeTriangulation"])
        ]
    ]
)
```
