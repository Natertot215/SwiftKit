---
url: https://developer.apple.com/documentation/swiftui/food-truck-building-a-swiftui-multiplatform-app
framework: SwiftUI
category: App organization
title: Food Truck: Building a SwiftUI Multiplatform App
kind: article
captured: 2026-05-02
---

# Food Truck: Building a SwiftUI Multiplatform App

## Overview

Create a single codebase and app target for Mac, iPad, and iPhone.

Using the Food Truck app, someone who operates a food truck can keep track of orders, discover the most-popular menu items, and check the weather at their destination. The sample implements the new `NavigationSplitView` to manage the app's views, `Layout` to show the main interface and pending orders, Charts to show trends, and `WeatherService` to get weather data. Food Truck also implements Live Activities to show the remaining order preparation time with `ActivityKit` on the lock screen, and with `DynamicIsland` on the home screen.

You can access the source code for this sample on [GitHub](https://github.com/apple/sample-food-truck).

## App Targets

The Food Truck sample project contains two types of app targets:

1. **Simple app target** — You can build using personal team signing.
2. **Full-featured Food Truck All app target** — Runs in Simulator, and on devices with an Apple Developer membership.

## Create a Multiplatform App

Food Truck is a multiplatform app with no separate targets to run on macOS or iOS. Instead, there is only one app target that builds for macOS, iPadOS, and iOS.

## Define a Default Navigation Destination

The sample's navigation interface consists of a `NavigationSplitView` with a `Sidebar` view, and a `NavigationStack`:

```swift
NavigationSplitView {
    Sidebar(selection: $selection)
} detail: {
    NavigationStack(path: $path) {
        DetailColumn(selection: $selection, model: model)
    }
}
```

```swift
@State private var selection: Panel? = Panel.truck
```

## Construct a Dynamic Layout

The `Layout` protocol allows the app to define a `DiagonalDonutStackLayout` that arranges donut thumbnails into a diagonal layout:

```swift
for index in subviews.indices {
    switch (index, subviews.count) {
    case (_, 1):
        subviews[index].place(
            at: center,
            anchor: .center,
            proposal: ProposedViewSize(size)
        )
    case (_, 2):
        let direction = index == 0 ? -1.0 : 1.0
        let offsetX = minBound * direction * 0.15
        let offsetY = minBound * direction * 0.20
        subviews[index].place(
            at: CGPoint(x: center.x + offsetX, y: center.y + offsetY),
            anchor: .center,
            proposal: ProposedViewSize(CGSize(width: size.width * 0.7, height: size.height * 0.7))
        )
    }
}
```

## Display a Chart of Popular Items

```swift
Chart {
    ForEach(sortedSales) { sale in
        BarMark(
            x: .value("Donut", sale.donut.name),
            y: .value("Sales", sale.sales)
        )
        .cornerRadius(6, style: .continuous)
        .foregroundStyle(.linearGradient(colors: [Color("BarBottomColor"), .accentColor], startPoint: .bottom, endPoint: .top))
    }
}
```

## Obtain a Weather Forecast

```swift
.task(id: city.id) {
    for parkingSpot in city.parkingSpots {
        do {
            let weather = try await WeatherService.shared.weather(for: parkingSpot.location)
            // ...
        } catch {
            print("Could not gather weather information...", error.localizedDescription)
        }
    }
}
```

## Track Preparation Time with Live Activity

```swift
let timerSeconds = 60
let activityAttributes = TruckActivityAttributes(
    orderID: String(order.id.dropFirst(6)),
    order: order.donuts.map(\.id),
    sales: order.sales,
    activityName: "Order preparation activity."
)

let future = Date(timeIntervalSinceNow: Double(timerSeconds))

let initialContentState = TruckActivityAttributes.ContentState(timerRange: Date.now...future)

let activityContent = ActivityContent(state: initialContentState, staleDate: Calendar.current.date(byAdding: .minute, value: 2, to: Date())!)

do {
    let myActivity = try Activity<TruckActivityAttributes>.request(
        attributes: activityAttributes,
        content: activityContent,
        pushType: nil)
} catch let error {
    print("Error requesting live activity: \(error.localizedDescription)")
}
```

## Availability

- **iOS:** 16.4+
- **iPadOS:** 16.4+
- **macOS:** 13.3+
- **Mac Catalyst:** 16.4+
- **Xcode:** 14.3+
