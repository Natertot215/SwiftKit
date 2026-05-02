---
url: https://developer.apple.com/documentation/swiftui/managing-user-interface-state
framework: SwiftUI
category: Model data
title: Managing User Interface State
kind: article
captured: 2026-05-01
---

# Managing User Interface State

## Abstract
Encapsulate view-specific data within your app's view hierarchy to make your views reusable.

## Overview

Store data as state in the least common ancestor of the views that need the data to establish a single **source of truth** that's shared across views. Provide the data as read-only through a Swift property, or create a two-way connection to the state with a binding. SwiftUI watches for changes in the data, and updates any affected views as needed.

**Important:** Don't use state properties for persistent storage because the life cycle of state variables mirrors the view life cycle. Instead, use them to manage transient state that only affects the user interface, like the highlight state of a button, filter settings, or the currently selected list item.

---

## Manage Mutable Values as State

If a view needs to store data that it can modify, declare a variable with the `@State` property wrapper:

```swift
struct PlayerView: View {
    @State private var isPlaying: Bool = false
    
    var body: some View {
        // ...
    }
}
```

When you change the value, SwiftUI updates the affected parts of the view:

```swift
Button(action: {
    self.isPlaying.toggle()
}) {
    Image(systemName: isPlaying ? "pause.circle" : "play.circle")
}
```

**Best practice:** Limit the scope of state variables by declaring them as private to ensure they remain encapsulated in the view hierarchy that declares them.

---

## Declare Swift Properties to Store Immutable Values

To provide a view with data that the view doesn't modify, declare a standard Swift property:

```swift
struct PlayerView: View {
    let episode: Episode // The queued episode.
    @State private var isPlaying: Bool = false
    
    var body: some View {
        VStack {
            Text(episode.title)
            Text(episode.showTitle)

            Button(action: {
                self.isPlaying.toggle()
            }) {
                Image(systemName: isPlaying ? "pause.circle" : "play.circle")
            }
        }
    }
}
```

When the user selects a different episode in the parent, SwiftUI detects the state change and recreates the `PlayerView` with new input.

---

## Share Access to State with Bindings

If a view needs to share control of state with a child view, declare a property in the child with the `@Binding` property wrapper:

```swift
struct PlayButton: View {
    @Binding var isPlaying: Bool
    
    var body: some View {
        Button(action: {
            self.isPlaying.toggle()
        }) {
            Image(systemName: isPlaying ? "pause.circle" : "play.circle")
        }
    }
}
```

When you instantiate `PlayButton`, provide a binding to the corresponding state variable by prefixing it with the dollar sign (`$`):

```swift
struct PlayerView: View {
    var episode: Episode
    @State private var isPlaying: Bool = false
    
    var body: some View {
        VStack {
            Text(episode.title)
            Text(episode.showTitle)
            PlayButton(isPlaying: $isPlaying) // Pass a binding.
        }
    }
}
```

You can also get a binding to a scoped value within a state variable:

```swift
struct Podcaster: View {
    @State private var episode = Episode(title: "Some Episode",
                                         showTitle: "Great Show",
                                         isFavorite: false)
    var body: some View {
        VStack {
            Toggle("Favorite", isOn: $episode.isFavorite) // Bind to the Boolean.
            PlayerView(episode: episode)
        }
    }
}
```

---

## Animate State Transitions

Wrap the state change that triggers transitions in a call to the `withAnimation(_:_:)` function:

```swift
withAnimation(.easeInOut(duration: 1)) {
    self.isPlaying.toggle()
}
```

By changing `isPlaying` inside the animation function's trailing closure, you tell SwiftUI to animate anything that depends on the wrapped value:

```swift
Image(systemName: isPlaying ? "pause.circle" : "play.circle")
    .scaleEffect(isPlaying ? 1 : 1.5)
```

Animations applied to a view above the state change will also be animated:

```swift
VStack {
    Text(episode.title)
    Text(episode.showTitle)
    PlayButton(isPlaying: $isPlaying)
}
.background(isPlaying ? Color.green : Color.red) // Transitions with animation.
```

When you want to apply animations to specific views, use the `animation(_:value:)` view modifier instead.

---

## See Also

- [`State`](doc://com.apple.SwiftUI/documentation/SwiftUI/State) - A property wrapper type that can read and write a value managed by SwiftUI
- [`Bindable`](doc://com.apple.SwiftUI/documentation/SwiftUI/Bindable) - A property wrapper type that supports creating bindings to mutable properties of observable objects
- [`Binding`](doc://com.apple.SwiftUI/documentation/SwiftUI/Binding) - A property wrapper type that can read and write a value owned by a source of truth
