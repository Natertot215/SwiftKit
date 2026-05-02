---
url: https://developer.apple.com/documentation/swiftui/view/toolbar(id:content:)
framework: SwiftUI
category: Toolbars
title: View/toolbar(id:content:)
kind: instance method
captured: 2026-05-01
---

# toolbar(id:content:)

## Declaration

```swift
nonisolated func toolbar<Content>(
    id: String,
    @ToolbarContentBuilder content: () -> Content
) -> some View where Content: CustomizableToolbarContent
```

## Abstract

Populates the toolbar or navigation bar with the specified items, allowing for user customization.

## Discussion

> **Note:** Customizable toolbars display on macOS and iOS, but only iPadOS 16.0+ supports user customization.

```swift
struct ToolsEditorView: View {
    @State private var text = ""
    @State private var bold = false
    @State private var italic = false
    @State private var fontSize = 12.0

    var displayFont: Font {
        let font = Font.system(size: CGFloat(fontSize),
            weight: bold ? .bold : .regular)
        return italic ? font.italic() : font
    }

    var body: some View {
        TextEditor(text: $text)
            .font(displayFont)
            .toolbar(id: "editingtools") {
                ToolbarItem(id: "sizeSelector", placement: .secondaryAction) {
                    Slider(value: $fontSize, in: 8...120,
                        minimumValueLabel: Text("A").font(.system(size: 8)),
                        maximumValueLabel: Text("A").font(.system(size: 16))
                    ) {
                        Text("Font Size (\(Int(fontSize)))")
                    }
                    .frame(width: 150)
                }
                ToolbarItem(id: "bold", placement: .secondaryAction) {
                    Toggle(isOn: $bold) { Image(systemName: "bold") }
                }
                ToolbarItem(id: "italic", placement: .secondaryAction) {
                    Toggle(isOn: $italic) { Image(systemName: "italic") }
                }
            }
            .navigationTitle("My Note")
    }
}
```

> **Note:** Only `secondaryAction` items support customization in iPadOS.

## macOS Menu Support

```swift
@main
struct ToolbarContent_macOSApp: App {
    var body: some Scene {
        WindowGroup {
            ToolsEditorView()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .commands {
            ToolbarCommands()
        }
    }
}
```

## Parameters

- **id**: A unique identifier for this toolbar.
- **content**: The content of the toolbar.

## Availability

- iOS 14.0+, iPadOS 14.0+, Mac Catalyst 14.0+, macOS 11.0+, tvOS 14.0+, visionOS 1.0+, watchOS 7.0+

## See Also

- `CustomizableToolbarContent`
- `ToolbarCustomizationBehavior`
- `ToolbarCustomizationOptions`
- `SearchToolbarBehavior`
