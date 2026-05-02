---
url: https://developer.apple.com/documentation/swiftui/view/typesettinglanguage(_:isenabled:)
framework: SwiftUI
category: Text input and output
title: typesettingLanguage(_:isEnabled:)
kind: method
captured: 2026-05-02
---

# typesettingLanguage(_:isEnabled:)

Specifies the language for typesetting.

## Declaration

```swift
nonisolated func typesettingLanguage(_ language: Locale.Language, isEnabled: Bool = true) -> some View

```

### Return Value

A view with the typesetting language set to the value you supply.

### Discussion

In some cases `Text` may contain text of a particular language which doesn’t match the device UI language. In that case it’s useful to specify a language so line height, line breaking and spacing will respect the script used for that language. For example:

```swift
Text(verbatim: "แอปเปิล")
    .typesettingLanguage(.init(languageCode: .thai))
```

Note: this language does not affect text localization.

## Parameters

- **language**: The explicit language to use for typesetting.
- **isEnabled**: A Boolean value that indicates whether text language is added





## Availability

- iOS 17.0
- iPadOS 17.0
- Mac Catalyst 17.0
- macOS 14.0
- tvOS 17.0
- visionOS 1.0
- watchOS 10.0



## See Also

- `Preparing views for localization`
- `LocalizedStringKey`
- `locale`
- `TypesettingLanguage`
