---
url: https://developer.apple.com/documentation/swiftui/inspecting-view-layout
framework: SwiftUI
category: Layout adjustments
title: Inspecting view layout
kind: article
captured: 2026-05-02
---

# Inspecting view layout

Determine the position and extent of a view using Xcode previews or by adding temporary borders.



### Overview

To learn how SwiftUI sizes and positions views, take advantage of Xcode previews to inspect a single view’s boundaries. You can also add temporary borders to see how SwiftUI positions and sizes multiple views together.

#### Highlight views with Xcode previews

Using Xcode previews, you can quickly see the size of a specific view element by selecting the view or child view in the editor. To illustrate this, the following example uses a `VStack` to vertically group an image, provided by `doc://com.apple.documentation/design/Human-Interface-Guidelines/sf-symbols`, above a name:

```swift
struct StatusRow: View {
    let name: String

    var body: some View {
        VStack {
            Image(systemName: "person.circle")
            Text(name)
        }            
    }
}

struct StatusRow_Previews: PreviewProvider {
    static var previews: some View {
        StatusRow(name: "Maria")
    }
}
```

With the `VStack` selected, you’ll see a blue border around the view in the Xcode preview:

#### Use temporary borders to explore complex layouts

To see the border of more than one view, or to see a border when the view isn’t selected, temporarily add a border with the view modifier `View/border(_:width:)`. Set the border’s color to something other than `ShapeStyle/blue` to easily distinguish it from a border added by Xcode:

```swift
struct StatusRow: View {
    let name: String

    var body: some View {
        VStack {
            Image(systemName: "person.circle")
            Text(name)
                .border(Color.red)
        }
        .padding()
        .border(Color.gray)
    }
}
```











## See Also

- `Laying out a simple view`
