---
url: https://developer.apple.com/documentation/swiftui/view/sheet(ispresented:ondismiss:content:)
framework: SwiftUI
category: Modal presentations
title: sheet(isPresented:onDismiss:content:)
kind: method
captured: 2026-05-02
---

# sheet(isPresented:onDismiss:content:)

Presents a sheet when a binding to a Boolean value that you provide is true.

## Declaration

```swift
nonisolated func sheet<Content>(isPresented: Binding<Bool>, onDismiss: (() -> Void)? = nil, @ViewBuilder content: @escaping () -> Content) -> some View where Content : View

```

### Discussion

Use this method when you want to present a modal view to the user when a Boolean value you provide is true. The example below displays a modal view of the mockup for a software license agreement when the user toggles the `isShowingSheet` variable by clicking or tapping on the “Show License Agreement” button:

```swift
struct ShowLicenseAgreement: View {
    @State private var isShowingSheet = false
    var body: some View {
        Button(action: {
            isShowingSheet.toggle()
        }) {
            Text("Show License Agreement")
        }
        .sheet(isPresented: $isShowingSheet,
               onDismiss: didDismiss) {
            VStack {
                Text("License Agreement")
                    .font(.title)
                    .padding(50)
                Text("""
                        Terms and conditions go here.
                    """)
                    .padding(50)
                Button("Dismiss",
                       action: { isShowingSheet.toggle() })
            }
        }
    }

    func didDismiss() {
        // Handle the dismissing action.
    }
}
```

In vertically compact environments, such as iPhone in landscape orientation, a sheet presentation automatically adapts to appear as a full-screen cover. Use the `View/presentationCompactAdaptation(_:)` or `View/presentationCompactAdaptation(horizontal:vertical:)` modifier to override this behavior.

#### Breakthrough effect

In visionOS, most system presentations appear with a breakthrough effect by default. To change how the enclosing presentation breaks through content occluding it, use `View/presentationBreakthroughEffect(_:)`, like in the following example:

```swift
.sheet(isPresented: $isShowingSheet,
       onDismiss: didDismiss) {
    VStack {
        Text("License Agreement")
            .font(.title)
            .padding(50)
        Text("""
                Terms and conditions go here.
            """)
            .padding(50)
        Button("Dismiss",
               action: { isShowingSheet.toggle() })
    }
    .presentationBreakthroughEffect(.prominent)
}
```

> **NOTE:** Passing a `.none` value for a sheet has no effect.

## Parameters

- **isPresented**: A binding to a Boolean value that determines whether to present the sheet that you create in the modifier’s `content` closure.
- **onDismiss**: The closure to execute when dismissing the sheet.
- **content**: A closure that returns the content of the sheet.





## Availability

- iOS 13.0
- iPadOS 13.0
- Mac Catalyst 13.0
- macOS 10.15
- tvOS 13.0
- visionOS 1.0
- watchOS 6.0



## See Also

- `sheet(item:onDismiss:content:)`
- `fullScreenCover(isPresented:onDismiss:content:)`
- `fullScreenCover(item:onDismiss:content:)`
- `popover(item:attachmentAnchor:arrowEdge:content:)`
- `popover(isPresented:attachmentAnchor:arrowEdge:content:)`
- `PopoverAttachmentAnchor`
