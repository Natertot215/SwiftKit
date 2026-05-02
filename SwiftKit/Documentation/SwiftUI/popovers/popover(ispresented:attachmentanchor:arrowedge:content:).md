---
url: https://developer.apple.com/documentation/swiftui/view/popover(ispresented:attachmentanchor:arrowedge:content:)
framework: SwiftUI
category: Modal presentations
title: popover(isPresented:attachmentAnchor:arrowEdge:content:)
kind: method
captured: 2026-05-02
---

# popover(isPresented:attachmentAnchor:arrowEdge:content:)

Presents a popover when a given condition is true.

## Declaration

```swift
nonisolated func popover<Content>(isPresented: Binding<Bool>, attachmentAnchor: PopoverAttachmentAnchor = .rect(.bounds), arrowEdge: Edge? = nil, @ViewBuilder content: @escaping () -> Content) -> some View where Content : View

```

### Discussion

Use this method to show a popover with contents that are a SwiftUI view, which you provide when a bound Boolean variable is `true`. In the example below, a popover displays whenever the user toggles the `isShowingPopover` state variable by pressing the “Show Popover” button:

```swift
struct PopoverExample: View {
    @State private var isShowingPopover = false

    var body: some View {
        Button("Show Popover") {
            self.isShowingPopover = true
        }
        .popover(isPresented: $isShowingPopover) {
            Text("Popover Content")
                .padding()
        }
    }
}
```

> **IMPORTANT:** Prior to iOS 18.1, the popover arrow edge was not respected. Apps that are re-compiled with the iOS 18.1 or later SDK or visionOS 2.1 or later SDK and run on iOS 18.1 or later or visionOS 2.1 or later have the arrow edge respected. On macOS, arrow edge has always been respected. Alternatively, to allow the system to choose the best orientation of the popover’s arrow, use the `View/popover(isPresented:attachmentAnchor:content:)` variant.

On iPhone, popovers adapt into sheets. In vertically compact environments, such as iPhone in landscape orientation, a popover presentation automatically adapts to appear as a full-screen cover. Use the `View/presentationCompactAdaptation(_:)` or `View/presentationCompactAdaptation(horizontal:vertical:)` modifier to override this behavior.

#### Breakthrough effect

In visionOS, most system presentations appear with a breakthrough effect by default. To change how the enclosing presentation breaks through content occluding it, use `View/presentationBreakthroughEffect(_:)`, like in the following example:

```swift
.popover(isPresented: $isShowingPopover) {
    Text("Popover Content")
        .padding()
        .presentationBreakthroughEffect(.prominent)
}
```

## Parameters

- **isPresented**: A binding to a Boolean value that determines whether to present the popover content that you return from the modifier’s `content` closure.
- **attachmentAnchor**: The positioning anchor that defines the attachment point of the popover. The default is `Anchor/Source/bounds`.
- **arrowEdge**: The edge of the `attachmentAnchor` that defines the location of the popover’s arrow. The default is `nil`, which results in the system allowing any arrow edge.
- **content**: A closure returning the content of the popover.





## Availability

- iOS 13.0
- iPadOS 13.0
- Mac Catalyst 13.0
- macOS 10.15
- visionOS 1.0



## See Also

- `sheet(isPresented:onDismiss:content:)`
- `sheet(item:onDismiss:content:)`
- `fullScreenCover(isPresented:onDismiss:content:)`
- `fullScreenCover(item:onDismiss:content:)`
- `popover(item:attachmentAnchor:arrowEdge:content:)`
- `PopoverAttachmentAnchor`
