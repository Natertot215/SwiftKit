---
url: https://developer.apple.com/documentation/swiftui/localizedstringkey
framework: SwiftUI
category: Text input and output
title: LocalizedStringKey
kind: struct
captured: 2026-05-02
---

# LocalizedStringKey

The key used to look up an entry in a strings file or strings dictionary file.

## Declaration

```swift
@frozen struct LocalizedStringKey
```

### Overview

Initializers for several SwiftUI types – such as `Text`, `Toggle`, `Picker` and others –  implicitly look up a localized string when you provide a string literal. When you use the initializer `Text("Hello")`, SwiftUI creates a `LocalizedStringKey` for you and uses that to look up a localization of the `Hello` string. This works because `LocalizedStringKey` conforms to `ExpressibleByStringLiteral`.

Types whose initializers take a `LocalizedStringKey` usually have a corresponding initializer that accepts a parameter that conforms to `StringProtocol`. Passing a `String` variable to these initializers avoids localization, which is usually appropriate when the variable contains a user-provided value.

As a general rule, use a string literal argument when you want localization, and a string variable argument when you don’t. In the case where you want to localize the value of a string variable, use the string to create a new `LocalizedStringKey` instance.

The following example shows how to create `Text` instances both with and without localization. The title parameter provided to the `Section` is a literal string, so SwiftUI creates a `LocalizedStringKey` for it. However, the string entries in the `messageStore.today` array are `String` variables, so the `Text` views in the list use the string values verbatim.

```swift
List {
    Section(header: Text("Today")) {
        ForEach(messageStore.today) { message in
            Text(message.title)
        }
    }
}
```

If the app is localized into Japanese with the following translation of its `Localizable.strings` file:

```other
"Today" = "今日";
```

When run in Japanese, the example produces a list like the following, localizing “Today” for the section header, but not the list items.





## Relationships

**Conforms To**: `Equatable`, `ExpressibleByExtendedGraphemeClusterLiteral`, `ExpressibleByStringInterpolation`, `ExpressibleByStringLiteral`, `ExpressibleByUnicodeScalarLiteral`

## Availability

- iOS 13.0
- iPadOS 13.0
- Mac Catalyst 13.0
- macOS 10.15
- tvOS 13.0
- visionOS 1.0
- watchOS 6.0

## Topics

### Creating a key from a literal value

- `init(_:)`
- `init(stringLiteral:)`

### Creating a key from an interpolation

- `init(stringInterpolation:)`
- `LocalizedStringKey.StringInterpolation`

## See Also

- `Preparing views for localization`
- `locale`
- `typesettingLanguage(_:isEnabled:)`
- `TypesettingLanguage`
