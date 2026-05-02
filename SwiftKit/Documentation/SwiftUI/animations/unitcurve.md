---
url: https://developer.apple.com/documentation/swiftui/unitcurve
framework: SwiftUI
category: Animations
title: UnitCurve
kind: struct
captured: 2026-05-01
---

# UnitCurve

## Declaration

```swift
struct UnitCurve
```

## Abstract

A function defined by a two-dimensional curve that maps an input progress in the range [0,1] to an output progress that is also in the range [0,1]. By changing the shape of the curve, the effective speed of an animation or other interpolation can be changed.

## Overview

The horizontal (x) axis defines the input progress: a single input progress value in the range [0,1] must be provided when evaluating a curve.

The vertical (y) axis maps to the output progress: when a curve is evaluated, the y component of the point that intersects the input progress is returned.

## Conformance

`UnitCurve` conforms to:
- `Copyable`
- `Equatable`
- `Escapable`
- `Hashable`
- `Sendable`
- `SendableMetatype`

## Available Curves

### Linear
- `linear` - A linear curve

### Easing Curves
- `easeIn` - A bezier curve that starts out slowly, then speeds up as it finishes
- `easeOut` - A bezier curve that starts out quickly, then slows down as it approaches the end
- `easeInOut` - A bezier curve that starts out slowly, speeds up over the middle, then slows down again as it approaches the end
- `circularEaseIn` - A curve that starts out slowly, then speeds up as it finishes
- `circularEaseOut` - A circular curve that starts out quickly, then slows down as it approaches the end
- `circularEaseInOut` - A circular curve that starts out slowly, speeds up over the middle, then slows down again as it approaches the end

## Creating Custom Curves

```swift
static func bezier(startControlPoint: UnitPoint, endControlPoint: UnitPoint) -> UnitCurve
```

Creates a new curve using bezier control points.

## Curve Characteristics

### value(at:)
```swift
func value(at: Double) -> Double
```
Returns the output value (y component) of the curve at the given time.

### velocity(at:)
```swift
func velocity(at: Double) -> Double
```
Returns the rate of change (first derivative) of the output value of the curve at the given time.

## Inverting a Curve

```swift
var inverse: UnitCurve
```
Returns a copy of the curve with its x and y components swapped.

## Availability

Supported on:
- iOS 17.0+
- iPadOS 17.0+
- Mac Catalyst 17.0+
- macOS 14.0+
- tvOS 17.0+
- visionOS 1.0+
- watchOS 10.0+

## See Also

- `CustomAnimation`
- `AnimationContext`
- `AnimationState`
- `Spring`
