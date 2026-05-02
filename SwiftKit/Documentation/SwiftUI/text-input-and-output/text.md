---
url: https://developer.apple.com/documentation/swiftui/text
framework: SwiftUI
category: Text input and output
title: Text
kind: struct
captured: 2026-05-02
---

# Text

A view that displays one or more lines of read-only text.

## Declaration

```swift
@frozen struct Text
```

### Overview

A text view draws a string in your app’s user interface using a `Font/body` font that’s appropriate for the current platform. You can choose a different standard font, like `Font/title` or `Font/caption`, using the `View/font(_:)` view modifier.

```swift
Text("Hamlet")
    .font(.title)
```

If you need finer control over the styling of the text, you can use the same modifier to configure a system font or choose a custom font. You can also apply view modifiers like `Text/bold()` or `Text/italic()` to further adjust the formatting.

```swift
Text("by William Shakespeare")
    .font(.system(size: 12, weight: .light, design: .serif))
    .italic()
```

To apply styling within specific portions of the text, you can create the text view from an `AttributedString`, which in turn allows you to use Markdown to style runs of text. You can mix string attributes and SwiftUI modifiers, with the string attributes taking priority.

```swift
let attributedString = try! AttributedString(
    markdown: "_Hamlet_ by William Shakespeare")

var body: some View {
    Text(attributedString)
        .font(.system(size: 12, weight: .light, design: .serif))
}
```

A text view always uses exactly the amount of space it needs to display its rendered contents, but you can affect the view’s layout. For example, you can use the `View/frame(width:height:alignment:)` modifier to propose specific dimensions to the view. If the view accepts the proposal but the text doesn’t fit into the available space, the view uses a combination of wrapping, tightening, scaling, and truncation to make it fit. With a width of `100` points but no constraint on the height, a text view might wrap a long string:

```swift
Text("To be, or not to be, that is the question:")
    .frame(width: 100)
```

Use modifiers like `View/lineLimit(_:)`, `View/allowsTightening(_:)`, `View/minimumScaleFactor(_:)`, and `View/truncationMode(_:)` to configure how the view handles space constraints. For example, combining a fixed width and a line limit of `1` results in truncation for text that doesn’t fit in that space:

```swift
Text("Brevity is the soul of wit.")
    .frame(width: 100)
    .lineLimit(1)
```

#### Localizing strings

If you initialize a text view with a string literal, the view uses the `Text/init(_:tableName:bundle:comment:)` initializer, which interprets the string as a localization key and searches for the key in the table you specify, or in the default table if you don’t specify one.

```swift
Text("pencil") // Searches the default table in the main bundle.
```

For an app localized in both English and Spanish, the above view displays “pencil” and “lápiz” for English and Spanish users, respectively. If the view can’t perform localization, it displays the key instead. For example, if the same app lacks Danish localization, the view displays “pencil” for users in that locale. Similarly, an app that lacks any localization information displays “pencil” in any locale.

To explicitly bypass localization for a string literal, use the `Text/init(verbatim:)` initializer.

```swift
Text(verbatim: "pencil") // Displays the string "pencil" in any locale.
```

If you initialize a text view with a variable value, the view uses the `Text/init(_:)-9d1g4` initializer, which doesn’t localize the string. However, you can request localization by creating a `LocalizedStringKey` instance first, which triggers the `Text/init(_:tableName:bundle:comment:)` initializer instead:

```swift
// Don't localize a string variable...
Text(writingImplement)

// ...unless you explicitly convert it to a localized string key.
Text(LocalizedStringKey(writingImplement))
```

When localizing a string variable, you can use the default table by omitting the optional initialization parameters — as in the above example — just like you might for a string literal.

When composing a complex string, where there is a need to assemble multiple pieces of text, use string interpolation:

```swift
let name: String = //…
Text("Hello, \(name)")
```

This would look up the `"Hello, %@"` localization key in the localized string file and replace the format specifier `%@` with the value of `name` before rendering the text on screen.

Using string interpolation ensures that the text in your app can be localized correctly in all locales, especially in right-to-left languages.

If you desire to style only parts of interpolated text while ensuring that the content can still be localized correctly, interpolate `Text` or `AttributedString`:

```swift
let name = Text(person.name).bold()
Text("Hello, \(name)")
```

The example above uses `LocalizedStringKey/StringInterpolation/appendInterpolation(_:)-4qyfo` and will look up the `"Hello, %@"` in the localized string file and interpolate a bold text rendering the value of  `name`.

Using `LocalizedStringKey/StringInterpolation/appendInterpolation(_:)-5m52e` you can interpolate `Image` in text.





## Relationships

**Conforms To**: `Copyable`, `Equatable`, `Escapable`, `Sendable`, `SendableMetatype`, `View`

## Availability

- iOS 13.0
- iPadOS 13.0
- Mac Catalyst 13.0
- macOS 10.15
- tvOS 13.0
- visionOS 1.0
- watchOS 6.0

## Topics

### Creating a text view

- `init(_:tableName:bundle:comment:)`
- `init(_:)`
- `init(verbatim:)`
- `init(_:style:)`
- `init(_:format:)`
- `init(_:formatter:)`
- `init(timerInterval:pauseTime:countsDown:showsHours:)`

### Choosing a font

- `font(_:)`
- `fontWeight(_:)`
- `fontDesign(_:)`
- `fontWidth(_:)`

### Styling the view’s text

- `foregroundStyle(_:)`
- `bold()`
- `bold(_:)`
- `italic()`
- `italic(_:)`
- `strikethrough(_:color:)`
- `strikethrough(_:pattern:color:)`
- `underline(_:color:)`
- `underline(_:pattern:color:)`
- `monospaced(_:)`
- `monospacedDigit()`
- `kerning(_:)`
- `tracking(_:)`
- `baselineOffset(_:)`
- `Text.Case`
- `Text.DateStyle`
- `Text.LineStyle`

### Fitting text into available space

- `textScale(_:isEnabled:)`
- `Text.Scale`
- `Text.TruncationMode`

### Localizing text

- `typesettingLanguage(_:isEnabled:)`

### Configuring voiceover

- `speechAdjustedPitch(_:)`
- `speechAlwaysIncludesPunctuation(_:)`
- `speechAnnouncementsQueued(_:)`
- `speechSpellsOutCharacters(_:)`

### Providing accessibility information

- `accessibilityHeading(_:)`
- `accessibilityLabel(_:)`
- `accessibilityTextContentType(_:)`

### Combining text views

- `+(_:_:)`

### Deprecated symbols

- `foregroundColor(_:)`

### Structures

- `Text.AlignmentStrategy`
- `Text.Layout`
- `Text.LayoutKey`
- `Text.WritingDirectionStrategy`

### Instance Methods

- `customAttribute(_:)`
- `textVariant(_:)`

## See Also

- `Label`
- `labelStyle(_:)`
