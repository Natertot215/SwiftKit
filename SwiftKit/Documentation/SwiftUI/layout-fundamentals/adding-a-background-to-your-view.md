---
url: https://developer.apple.com/documentation/swiftui/adding-a-background-to-your-view
framework: SwiftUI
category: Layout fundamentals
title: Adding a background to your view
kind: article
captured: 2026-05-02
---

# Adding a background to your view

Compose a background behind your view and extend it beyond the safe area insets.



### Overview

You can add a view as a background with the `View/background(alignment:content:)` view modifier. To add a background under multiple views, or to have a background larger than an existing view, you can layer the views by placing them within a `ZStack`, and place the view you want to be in the background at the bottom of the view stack. You can specify that a background view should ignore the safe area insets to extend the background to some or all edges.

#### Add a background

If your design calls for a background, you can use the `View/background(alignment:content:)` modifier to add it underneath an existing view. The following example adds a gradient to the vertical stack using the `View/background(alignment:content:)` view modifier:

```swift
let backgroundGradient = LinearGradient(
    colors: [Color.red, Color.blue],
    startPoint: .top, endPoint: .bottom)

struct SignInView: View {
    @State private var name: String = ""

    var body: some View {
        VStack {
            Text("Welcome")
                .font(.title)
            HStack {
                TextField("Your name?", text: $name)
                    .textFieldStyle(.roundedBorder)
                Button(action: {}, label: {
                    Image(systemName: "arrow.right.square")
                        .font(.title)
                })
            }
            .padding()
        }
        .background {
            backgroundGradient
        }
    }
}
```

The `View/background(alignment:content:)` view modifier constrains the size of the background view to be the same size as the view to which it’s attached:

#### Expand the background underneath your view

To create a background that’s larger than the vertical stack, use a different technique. You could add `Spacer` views above and below the content in the `VStack` to expand it, but that would also expand the size of the stack, possibly changing it’s layout. To add in a larger background without changing the size of the stack, nest the views within a `ZStack` to layer the `VStack` over the background view:

```swift
struct SignInView: View {
    @State private var name: String = ""

    var body: some View {
        ZStack {
            backgroundGradient
            VStack {
                Text("Welcome")
                    .font(.title)
                HStack {
                    TextField("Your name?", text: $name)
                        .textFieldStyle(.roundedBorder)
                    Button(action: {}, label: {
                        Image(systemName: "arrow.right.square")
                            .font(.title)
                    })
                }
                .padding()
            }
        }
    }
}
```

View sizes within a depth stack are independent, unlike when using the background view modifier. The view from `Gradient` expands to fill the space available to the stack, but avoids the safe area insets by default:

For more information on usings stacks to combine views, see `Building-Layouts-with-Stack-Views`.

#### Extend the background into the safe areas

By default, SwiftUI sizes and positions views to avoid system defined safe areas to ensure that system content or the edges of the device won’t obstruct your views. If your design calls for the background to extend to the screen edges, use the `View/ignoresSafeArea(_:edges:)` modifier to override the default.

```swift
struct SignInView: View {
    @State private var name: String = ""
    var body: some View {
        ZStack {
            backgroundGradient
            VStack {
                Text("Welcome")
                    .font(.title)
                HStack {
                    TextField("Your name?", text: $name)
                        .textFieldStyle(.roundedBorder)
                    Button(action: {}, label: {
                        Image(systemName: "arrow.right.square")
                            .font(.title)
                    })
                }
                .padding()
            }
        }
        .ignoresSafeArea()
    }
}
```

The background gradient fills the display area of the device and ignores the safe area insets.

#### Adjust views when displaying the keyboard

You can ignore the keyboard’s safe area by adding the `View/ignoresSafeArea(_:edges:)` modifier. When you activate the keyboard, the content of the vertical stack remains fixed, ignoring the space used by the keyboard:

To get the contents of the vertical stack to respect the safe areas and adjust to the keyboard, move the modifier to only apply to the background view.

```swift
struct SignInView: View {
    @State private var name: String = ""
    var body: some View {
        ZStack {
            backgroundGradient
                .ignoresSafeArea()
            VStack {
                Text("Welcome")
                    .font(.title)
                HStack {
                    TextField("Your name?", text: $name)
                        .textFieldStyle(.roundedBorder)
                    Button(action: {}, label: {
                        Image(systemName: "arrow.right.square")
                            .font(.title)
                    })
                }
                .padding()
            }
        }
    }
}
```

To accommodate the keyboard, SwiftUI resizes and positions your view. Because the background view has the `View/ignoresSafeArea(_:edges:)` modifier, it remains unchanged.











## See Also

- `ZStack`
- `zIndex(_:)`
- `background(alignment:content:)`
- `background(_:ignoresSafeAreaEdges:)`
- `background(ignoresSafeAreaEdges:)`
- `background(_:in:fillStyle:)`
- `background(in:fillStyle:)`
- `overlay(alignment:content:)`
- `overlay(_:ignoresSafeAreaEdges:)`
- `overlay(_:in:fillStyle:)`
- `backgroundMaterial`
- `containerBackground(_:for:)`
- `containerBackground(for:alignment:content:)`
- `ContainerBackgroundPlacement`
