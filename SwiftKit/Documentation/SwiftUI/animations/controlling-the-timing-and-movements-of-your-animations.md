---
url: https://developer.apple.com/documentation/swiftui/controlling-the-timing-and-movements-of-your-animations
framework: SwiftUI
category: Animations
title: Controlling the timing and movements of your animations
kind: article
captured: 2026-05-01
---

# Controlling the Timing and Movements of Your Animations

## Abstract
Build sophisticated animations that you control using phase and keyframe animators.

SwiftUI provides a collection of useful animations, but sometimes you need more control over the timing and movement of visual elements. `PhaseAnimator` and `KeyframeAnimator` help give you that control.

- A **phase animator** allows you to define an animation as a collection of discrete steps called phases. The animator cycles through these phases to create a visual transition.
- With **keyframe animator**, you create keyframes that define animation values at specific times during the visual transition.

---

## Create a Simple Bounce Animation

### Overview
Start with a simple example using standard SwiftUI animations. The following code moves an emoji upwards by setting its offset to `-40.0` with a `bouncy` animation when tapped:

```swift
struct SimpleAnimationView: View {
    var emoji: String
    @State private var offset = 0.0

    var body: some View {
        EmojiView(emoji: emoji)
            .offset(y: offset)
            .onTapGesture {
                withAnimation(.bouncy) {
                    offset = -40.0
                }
            }
    }
}
```

To add a return animation, use `withAnimation` with a completion closure:

```swift
struct SimpleAnimationView: View {
    var emoji: String
    @State private var offset = 0.0

    var body: some View {
        EmojiView(emoji: emoji)
            .offset(y: offset)
            .onTapGesture {
                withAnimation(.bouncy) {
                    offset = -40.0
                } completion: {
                    withAnimation {
                        offset = 0.0
                    }
                }
            }
    }
}
```

---

## Bounce with a Phase Animator

A `PhaseAnimator` automatically advances through a set of phases to create an animated transition. Use the `phaseAnimator(_:content:animation:)` modifier:

```swift
struct TwoPhaseAnimationView: View {
    var emoji: String
    
    var body: some View {
        EmojiView(emoji: emoji)
            .phaseAnimator([false, true]) { content, phase in
                content.offset(y: phase ? -40.0 : 0.0)
            }
    }
}
```

The phase animator cycles through phases in order. When the view first appears, it invokes the `content` closure with the first phase, then continues with each subsequent phase.

### Triggering Animation on Events

To start animation based on an event, use the `phaseAnimator(_:trigger:content:animation:)` modifier:

```swift
struct TwoPhaseAnimationView: View {
    var emoji: String
    @State private var likeCount = 1
    
    var body: some View {
        EmojiView(emoji: emoji)
            .phaseAnimator([false, true], trigger: likeCount) { content, phase in
                content.offset(y: phase ? -40.0 : 0.0)
            }
            .onTapGesture {
                likeCount += 1
            }
    }
}
```

### Customizing Animation Types

Provide different animation types for each phase:

```swift
struct TwoPhaseAnimationView: View {
    var emoji: String
    @State private var likeCount = 1
    
    var body: some View {
        EmojiView(emoji: emoji)
            .phaseAnimator([false, true], trigger: likeCount) { content, phase in
                content.offset(y: phase ? -40.0 : 0.0)
            } animation: { phase in
                phase ? .bouncy : .default
            }
            .onTapGesture {
                likeCount += 1
            }
    }
}
```

---

## Add More Phases to the Animation

Create a custom enum to define multiple phases:

```swift
private enum AnimationPhase: CaseIterable {
    case initial
    case move
    case scale
    
    var verticalOffset: Double {
        switch self {
        case .initial: 0
        case .move, .scale: -64
        }
    }
    
    var scaleEffect: Double {
        switch self {
        case .initial: 1
        case .move, .scale: 1.5
        }
    }
}
```

Apply the animator with computed properties:

```swift
struct ThreePhaseAnimationView: View {
    var emoji: String
    @State private var likeCount = 1
    
    var body: some View {
        EmojiView(emoji: emoji)
            .phaseAnimator(AnimationPhase.allCases, trigger: likeCount) { content, phase in
                content
                    .scaleEffect(phase.scaleEffect)
                    .offset(y: phase.verticalOffset)
            } animation: { phase in
                switch phase {
                case .initial: .smooth
                case .move: .easeInOut(duration: 0.3)
                case .scale: .spring(duration: 0.3, bounce: 0.7)
                }
            }
            .onTapGesture {
                likeCount += 1
            }
    }
}
```

---

## Gain More Control with a Keyframe Animator

Define a structure with properties to animate:

```swift
private struct AnimationValues {
    var scale = 1.0
    var verticalStretch = 1.0
    var verticalOffset = 0.0
    var angle = Angle.zero
}
```

Apply the `keyframeAnimator` modifier:

```swift
struct KeyframeAnimationView: View {
    var emoji: String
    @State private var likeCount = 1
    
    var body: some View {
        EmojiView(emoji: emoji)
            .keyframeAnimator(
                initialValue: AnimationValues(),
                trigger: likeCount
            ) { content, value in
                content
                    .rotationEffect(value.angle)
                    .scaleEffect(value.scale)
                    .scaleEffect(y: value.verticalStretch)
                    .offset(y: value.verticalOffset)
            } keyframes: { _ in
                // Define keyframes here
            }
            .onTapGesture {
                likeCount += 1
            }
    }
}
```

### Define Keyframes with Tracks

Create `KeyframeTrack` instances for each property:

```swift
struct KeyframeAnimationView: View {
    var emoji: String
    @State private var likeCount = 1
    
    var body: some View {
        EmojiView(emoji: emoji)
            .keyframeAnimator(
                initialValue: AnimationValues(),
                trigger: likeCount
            ) { content, value in
                content
                    .rotationEffect(value.angle)
                    .scaleEffect(value.scale)
                    .scaleEffect(y: value.verticalStretch)
                    .offset(y: value.verticalOffset)
            } keyframes: { _ in
                KeyframeTrack(\.scale) {
                    LinearKeyframe(1.0, duration: 0.36)
                    SpringKeyframe(1.5, duration: 0.8, spring: .bouncy)
                    SpringKeyframe(1.0, spring: .bouncy)
                }
                
                KeyframeTrack(\.verticalOffset) {
                    LinearKeyframe(0.0, duration: 0.1)
                    SpringKeyframe(20.0, duration: 0.15, spring: .bouncy)
                    SpringKeyframe(-60.0, duration: 1.0, spring: .bouncy)
                    SpringKeyframe(0.0, spring: .bouncy)
                }
                
                KeyframeTrack(\.verticalStretch) {
                    CubicKeyframe(1.0, duration: 0.1)
                    CubicKeyframe(0.6, duration: 0.15)
                    CubicKeyframe(1.5, duration: 0.1)
                    CubicKeyframe(1.05, duration: 0.15)
                    CubicKeyframe(1.0, duration: 0.88)
                    CubicKeyframe(0.8, duration: 0.1)
                    CubicKeyframe(1.04, duration: 0.4)
                    CubicKeyframe(1.0, duration: 0.22)
                }
                
                KeyframeTrack(\.angle) {
                    CubicKeyframe(.zero, duration: 0.58)
                    CubicKeyframe(.degrees(16), duration: 0.125)
                    CubicKeyframe(.degrees(-16), duration: 0.125)
                    CubicKeyframe(.degrees(16), duration: 0.125)
                    CubicKeyframe(.zero, duration: 0.125)
                }
            }
            .onTapGesture {
                likeCount += 1
            }
    }
}
```

---

## See Also

- [`phaseAnimator(_:content:animation:)`](doc://com.apple.SwiftUI/documentation/SwiftUI/View/phaseAnimator(_:content:animation:))
- [`phaseAnimator(_:trigger:content:animation:)`](doc://com.apple.SwiftUI/documentation/SwiftUI/View/phaseAnimator(_:trigger:content:animation:))
- [`PhaseAnimator`](doc://com.apple.SwiftUI/documentation/SwiftUI/PhaseAnimator)
