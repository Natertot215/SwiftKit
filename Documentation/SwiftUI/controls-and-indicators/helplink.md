---
url: https://developer.apple.com/documentation/swiftui/helplink
framework: SwiftUI
category: Controls and indicators
title: HelpLink
kind: struct
captured: 2026-05-02
---

# HelpLink

A button with a standard appearance that opens app-specific help documentation.

## Declaration

```swift
struct HelpLink
```

### Overview

A help link opens documentation relevant to the context where they are used. Typically this is by opening to an anchor in an Apple Help book, but can also perform an arbitrary action such as opening a URL or opening a window.

```swift
HelpLink(anchor: "accountSetupHelp")

HelpLink {
    openURL(onlineHelpURL)
}
```

Help links have a standard appearance, as well as conventional placement within a view. When used within an alert or confirmation dialog’s actions, the help link will automatically be placed in the top trailing corner. Or when used in a sheet toolbar, the help link is automatically placed in the lower leading corner.

```swift
struct SheetContentView: View {
    var body: some View {
        Form {
             ...
        }
        .toolbar {
            ToolbarItem(.confirmationAction) {
                Button("Save") { ... }
            }
            ToolbarItem(.cancellationAction) {
                Button("Cancel") { ... }
            }
            ToolbarItem {
                HelpLink(anchor: "sheetHelp")
            }
         }
    }
}
```





## Relationships

**Conforms To**: `View`

## Availability

- macOS 14.0

## Topics

### Creating a help link

- `init(action:)`
- `init(destination:)`
- `init(anchor:)`
- `init(anchor:book:)`

## See Also

- `Link`
- `ShareLink`
- `SharePreview`
- `TextFieldLink`
