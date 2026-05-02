---
url: https://developer.apple.com/documentation/swiftui/understanding-the-navigation-stack
framework: SwiftUI
category: Navigation
title: Understanding the Navigation Stack
kind: article
captured: 2026-05-01
---

# Understanding the Navigation Stack

## Overview

A `NavigationStack` is a container for your app's navigation structure. It presents a stack of views over a root view and exposes its state through the `path` parameter of its initializer.

## Key Concepts

### Navigation Path Types

A `NavigationStack` can use:

- **NavigationPath** — A type-erased collection that stores heterogeneous (mixed-type) `Hashable` data
- **Binding to RandomAccessCollection & RangeReplaceableCollection** — For homogenous (single-type) data, such as `Array`

> **Tip:** Avoid using model types as navigation path elements. Keep path elements lightweight and don't use them to transport data models.

### Navigation Destinations

#### 1. View-Destination Links
```swift
NavigationLink {
    ColorDetail(color: .mint, text: "Mint")
} label: {
    Text("Mint")
}
```

#### 2. Value-Destination Links
```swift
NavigationLink("Mint", value: Color.mint)
    .navigationDestination(for: Color.self) { color in
        ColorDetail(color: color, text: color.description)
    }
```

#### 3. Programmatic Navigation (Boolean Binding)
```swift
@State private var showDetails = false

NavigationStack {
    Button("Show details") {
        showDetails = true
    }
    .navigationDestination(isPresented: $showDetails) {
        ColorDetail(color: favoriteColor, text: color.description)
    }
}
```

#### 4. Programmatic Navigation (Item Binding)
```swift
@State private var selectedRecipe: Recipe?

NavigationStack {
    List(recipes, selection: $selectedRecipe) { recipe in
        NavigationLink(recipe.description, value: recipe)
    }
    .navigationDestination(item: $selectedRecipe) { recipe in
        RecipeDetailView(recipe: recipe)
    }
}
```

## Managing Navigation State

### Using NavigationPath

```swift
struct ContentView: View {
    @State private var path = NavigationPath()

    var body: some View {
        NavigationStack(path: $path) {
            List {
                NavigationLink("Mint", value: Color.mint)
                NavigationLink("Red", value: Color.red)
            }
            .navigationDestination(for: Color.self) { color in
                ColorDetail(color: color)
            }
        }
    }
}
```

### Using Observable with Homogenous Collections

```swift
@Observable
class NavigationManager {
    var path: [Color] = []
}

struct ContentView: View {
    @State private var navigationManager = NavigationManager()

    var body: some View {
        NavigationStack(path: $navigationManager.path) {
            List {
                NavigationLink("Mint", value: Color.mint)
                NavigationLink("Red", value: Color.red)
            }
            .navigationDestination(for: Color.self) { color in
                ColorDetail(color: color, text: color.description)
            }
        }
    }
}
```

### Programmatic Pop

```swift
@discardableResult
func navigateBack() -> Color? {
    path.popLast()
}
```

## Mixed Destination Types

```swift
struct ValueView: View {
    private var recipes: [Recipe] = [.applePie, .chocolateCake]

    var body: some View {
        NavigationStack {
            List {
                NavigationLink("Mint", value: Color.mint)
                NavigationLink("Red", value: Color.red)
                ForEach(recipes) { recipe in
                    NavigationLink(recipe.description, value: recipe)
                }
            }
            .navigationDestination(for: Color.self) { color in
                ColorDetail(color: color, text: color.description)
            }
            .navigationDestination(for: Recipe.self) { recipe in
                RecipeDetailView(recipe: recipe)
            }
        }
    }
}
```

## State Restoration

### Heterogenous Paths (NavigationPath)

```swift
@Observable
class NavigationManager {
    var path = NavigationPath() {
        didSet { save() }
    }

    func save() {
        guard let codableRepresentation = path.codable else { return }
        let encoder = JSONEncoder()
        let data = try? encoder.encode(codableRepresentation)
        try? data?.write(to: NavigationManager.dataURL)
    }

    func load(url: URL) throws -> NavigationPath {
        let data = try Data(contentsOf: url, options: .mappedIfSafe)
        let decoder = JSONDecoder()
        let path = try decoder.decode(NavigationPath.CodableRepresentation.self, from: data)
        return NavigationPath(path)
    }
}
```

> **Note:** `path.codable` returns `nil` if any type-erased elements don't conform to `Codable`. Check for nullability before serializing.

## See Also

- Bringing robust navigation structure to your SwiftUI app
- Restoring your app's state with SwiftUI
