---
url: https://developer.apple.com/documentation/swiftui/gauge
framework: SwiftUI
category: Controls and indicators
title: Gauge
kind: struct
captured: 2026-05-01
---

# Gauge

## Declaration

```swift
struct Gauge<Label, CurrentValueLabel, BoundsLabel, MarkedValueLabels> 
where Label : View, CurrentValueLabel : View, BoundsLabel : View, MarkedValueLabels : View
```

## Abstract

A view that shows a value within a range.

## Overview

A gauge is a view that shows a current level of a value in relation to a specified finite capacity, much like a fuel gauge in an automobile. Gauge displays are configurable; they can show any combination of the gauge's current value, the range the gauge can display, and a label describing the purpose of the gauge itself.

In its most basic form, a gauge displays a single value along the path of the gauge mapped into a range from 0 to 100 percent.

### Basic Example

```swift
struct SimpleGauge: View {
    @State private var batteryLevel = 0.4

    var body: some View {
        Gauge(value: batteryLevel) {
            Text("Battery Level")
        }
    }
}
```

### Labeled Gauge Example

```swift
struct LabeledGauge: View {
    @State private var current = 67.0
    @State private var minValue = 0.0
    @State private var maxValue = 170.0

    var body: some View {
        Gauge(value: current, in: minValue...maxValue) {
            Text("BPM")
        } currentValueLabel: {
            Text("\(Int(current))")
        } minimumValueLabel: {
            Text("\(Int(minValue))")
        } maximumValueLabel: {
            Text("\(Int(maxValue))")
        }
    }
}
```

### Styled Gauge with Gradient

```swift
struct StyledGauge: View {
    @State private var current = 67.0
    @State private var minValue = 50.0
    @State private var maxValue = 170.0
    let gradient = Gradient(colors: [.green, .yellow, .orange, .red])

    var body: some View {
        Gauge(value: current, in: minValue...maxValue) {
            Image(systemName: "heart.fill")
                .foregroundColor(.red)
        } currentValueLabel: {
            Text("\(Int(current))")
                .foregroundColor(Color.green)
        } minimumValueLabel: {
            Text("\(Int(minValue))")
                .foregroundColor(Color.green)
        } maximumValueLabel: {
            Text("\(Int(maxValue))")
                .foregroundColor(Color.red)
        }
        .gaugeStyle(CircularGaugeStyle(tint: gradient))
    }
}
```

## Styling

Change the gauge style using the `gaugeStyle(_:)` view modifier:

```swift
.gaugeStyle(.circular)
```

> **Note:** Some visual presentations of `Gauge` don't display all the labels required by the API. However, the accessibility system does use the label content and you should use these labels to fully describe the gauge for accessibility users.

## Availability

- **iOS** 16.0+
- **iPadOS** 16.0+
- **Mac Catalyst** 16.0+
- **macOS** 13.0+
- **visionOS** 1.0+
- **watchOS** 7.0+

## See Also

- `gaugeStyle(_:)`
- `ProgressView`
- `progressViewStyle(_:)`
- `CircularGaugeStyle`
