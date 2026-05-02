---
url: https://developer.apple.com/documentation/swiftui/environmentvalues/levelofdetail
framework: SwiftUI
category: Environment values
title: levelOfDetail
kind: property
captured: 2026-05-02
---

# levelOfDetail

The level of detail the view is recommended to have.

## Declaration

```swift
var levelOfDetail: LevelOfDetail { get set }
```

### Discussion

Read from the environment with

```swift
@Environment(\.levelOfDetail) var levelOfDetail
```

To customize your view based on recommended level of detail, read the environment value using the `.levelOfDetail` key and apply that to change your view.

```swift
var body: some View {
     switch levelOfDetail {
     case .default:
         VStack {
            NewsTitleView()
            NewsBodyView()
         }
     case .simplified:
         NewsImageOverview()
     }
}
```

> **NOTE:** The levelOfDetail can be determined by different factors depending on the platforms.







## Availability

- iOS 26.0
- iPadOS 26.0
- Mac Catalyst 26.0
- visionOS 26.0
