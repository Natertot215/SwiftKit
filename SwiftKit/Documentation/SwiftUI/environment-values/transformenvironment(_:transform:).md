---
url: https://developer.apple.com/documentation/swiftui/scene/transformenvironment(_:transform:)
framework: SwiftUI
category: Environment values
title: transformEnvironment(_:transform:)
kind: method
captured: 2026-05-02
---

# transformEnvironment(_:transform:)

Transforms the environment value of the specified key path with the given function.

## Declaration

```swift
nonisolated func transformEnvironment<V>(_ keyPath: WritableKeyPath<EnvironmentValues, V>, transform: @escaping (inout V) -> Void) -> some Scene

```









## Availability

- iOS 17.0
- iPadOS 17.0
- Mac Catalyst 17.0
- macOS 14.0
- tvOS 17.0
- visionOS 1.0
- watchOS 10.0



## See Also

- `environment(_:)`
- `environment(_:_:)`
