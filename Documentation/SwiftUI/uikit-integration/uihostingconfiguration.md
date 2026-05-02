---
url: https://developer.apple.com/documentation/swiftui/uihostingconfiguration
framework: SwiftUI
category: UIKit integration
title: UIHostingConfiguration
kind: struct
captured: 2026-05-02
---

# UIHostingConfiguration

A content configuration suitable for hosting a hierarchy of SwiftUI views.

## Declaration

```swift
struct UIHostingConfiguration<Content, Background> where Content : View, Background : View
```

### Overview

Use a value of this type, which conforms to the `UIContentConfiguration-9eib5` protocol, with a `UICollectionViewCell` or `UITableViewCell` to host a hierarchy of SwiftUI views in a collection or table view, respectively. For example, the following shows a stack with an image and text inside the cell:

```swift
myCell.contentConfiguration = UIHostingConfiguration {
    HStack {
        Image(systemName: "star").foregroundStyle(.purple)
        Text("Favorites")
        Spacer()
    }
}
```

You can also customize the background of the containing cell. The following example draws a blue background:

```swift
myCell.contentConfiguration = UIHostingConfiguration {
    HStack {
        Image(systemName: "star").foregroundStyle(.purple)
        Text("Favorites")
        Spacer()
    }
}
.background {
    Color.blue
}
```

When used in a list layout, certain APIs are bridged automatically, like swipe actions and separator alignment. The following example shows a trailing yellow star swipe action:

```swift
cell.contentConfiguration = UIHostingConfiguration {
    HStack {
        Image(systemName: "airplane")
        Text("Flight 123")
        Spacer()
    }
    .swipeActions {
        Button { ... } label: {
            Label("Favorite", systemImage: "star")
        }
        .tint(.yellow)
    }
}
```





## Relationships

**Conforms To**: `UIContentConfiguration`

## Availability

- iOS 16.0
- iPadOS 16.0
- Mac Catalyst 16.0
- tvOS 16.0
- visionOS 1.0

## Topics

### Creating and updating a configuration

- `init(content:)`

### Setting the background

- `background(_:)`
- `background(content:)`

### Setting margins

- `margins(_:_:)`

### Setting a size

- `minSize(width:height:)`
- `minSize()`

## See Also

- `Using SwiftUI with UIKit`
- `Unifying your app’s animations`
- `UIHostingController`
- `UIHostingControllerSizingOptions`
- `UIHostingSceneDelegate`
