---
url: https://developer.apple.com/documentation/swiftui/wishlist-planning-travel-in-a-swiftui-app
framework: SwiftUI
category: Articles
title: Wishlist: Planning travel in a SwiftUI app
kind: article
captured: 2026-05-02
---

# Wishlist: Planning travel in a SwiftUI app

## Overview

The Wishlist sample app helps people organize travel plans by grouping trips into seasonal collections. Within each trip, people can create activities and mark them complete as they explore. The app rewards progress with achievement badges, tracking milestones like completing a first trip or reaching an activity milestone across all adventures.

The sample project demonstrates how to:

- Compose custom views
- Manage state with the `@Observable` macro
- Customize navigation title appearance
- Animate view changes
- Create zoom transitions to navigation destinations and between buttons and sheets

---

## Compose custom views

SwiftUI views conform to the `View` protocol and define their content through a computed `body` property. Each view returns a description of what appears on screen, and SwiftUI handles the rendering.

Wishlist builds custom views by combining built-in components like `VStack`, `HStack`, `Text`, `Image`, and `Button`:

```swift
struct TripCard: View {
    var trip: Trip
    var size: Size

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            TripImageView(url: trip.photoURL)
                .scaledToFill()
                .frame(width: size.width, height: size.height)
                .clipShape(.rect(cornerRadius: 16))

            VStack(alignment: .leading, spacing: 0) {
                Text(trip.name)
                    .font(.body)

                if let subtitle = trip.subtitle {
                    Text(subtitle)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
            }
        }
    }
}
```

The outer `VStack` stacks the image and text vertically, aligning content to the leading edge. Apply transformations sequentially by stacking modifiers, with each modifier wrapping the previous view in a new view with modified behavior.

---

## Manage state with an observable macro

SwiftUI updates views automatically when their dependencies change. Mark model classes with `@Observable` to opt into automatic change tracking. In Wishlist, the `@Observable` macro synthesizes the necessary code to publish changes made to any stored property:

```swift
@Observable
class DataSource {
    var trips: [Trip.ID: Trip] {
        didSet {
            updateGoalAchievements()
        }
    }
    var searchText = ""
}
```

The `DataSource` class stores trips in a `Dictionary` keyed by trip ID for efficient lookup. The `didSet` property observer calls `updateGoalAchievements()` whenever the `trips` dictionary changes, keeping goal progress synchronized with trip completion.

### Sharing data across the app

To share this data across the sample app, Wishlist creates a state with the `State` property wrapper inside the `App` struct, then injects the data into the view hierarchy with the `environment(_:)` modifier:

```swift
@main
struct WishlistApp: App {
    @State private var dataSource = DataSource()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(dataSource)
        }
    }
}
```

Inside a view, Wishlist gets the observable object using its type:

```swift
struct WishlistView: View {
    @Environment(DataSource.self) private var dataSource
    ...
}
```

### Working with bindings

Use the `Bindable` property wrapper to create bindings to properties of an `Observable` object:

```swift
struct SearchView: View {
    @Environment(DataSource.self) private var dataSource

    var body: some View {
        @Bindable var dataSource = dataSource
        NavigationStack {
            SearchResultsListView()
                .searchable(text: $dataSource.searchText)
        }
    }
}
```

---

## Customize navigation title appearance

```swift
NavigationStack {
    ScrollView {
        // Content
    }
    .toolbar {
        ToolbarItem(placement: .title) {
            ExpandedNavigationTitle(title: "Wishlist")
        }
    }
    .navigationTitle("Wishlist")
    .toolbarTitleDisplayMode(.inline)
}
```

For content that extends into the safe area, use `ToolbarItemPlacement/largeTitle` placement instead.

---

## Animate view changes

### Using withAnimation for discrete actions

```swift
Button("Delete", role: .destructive) {
    withAnimation {
        model.removeActivity(activity)
    }
}
```

### Using animation(_:value:) for property changes

```swift
Image(systemName: activity.isComplete ? "checkmark.circle.fill" : "circle")
    .foregroundStyle(activity.isComplete ? Color.accentColor : .gray)
    .contentTransition(.symbolEffect)
    .animation(.snappy, value: activity.isComplete)
```

---

## Create zoom transitions between navigation destinations

```swift
struct WishlistView: View {
    @Namespace private var namespace
    var body: some View {
        NavigationStack {
            ForEach(TripCollection.allCases) { tripCollection in
                TripCollectionView(
                    tripCollection: tripCollection,
                    namespace: namespace
                )
            }
        }
    }
}

struct TripCollectionView: View {
    var tripCollection: TripCollection
    var namespace: Namespace.ID

    var body: some View {
        ForEach(dataSource.trips(in: tripCollection)) { trip in
            NavigationLink {
                TripDetailView(trip: trip)
                    .navigationTransition(.zoom(sourceID: trip.id, in: namespace))
            } label: {
                TripCard(trip: trip, size: cardSize)
                    .matchedTransitionSource(id: trip.id, in: namespace)
            }
        }
    }
}
```

---

## Download

[Download WishlistPlanningTravelInASwiftUIApp.zip](https://docs-assets.developer.apple.com/published/880703578560/WishlistPlanningTravelInASwiftUIApp.zip)
