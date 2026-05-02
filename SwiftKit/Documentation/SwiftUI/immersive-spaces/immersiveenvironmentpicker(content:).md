---
url: https://developer.apple.com/documentation/swiftui/view/immersiveenvironmentpicker(content:)
framework: SwiftUI
category: Immersive spaces
title: immersiveEnvironmentPicker(content:)
kind: method
captured: 2026-05-02
---

# immersiveEnvironmentPicker(content:)

Add menu items to open immersive spaces from a media player’s environment picker.

## Declaration

```swift
nonisolated func immersiveEnvironmentPicker<Content>(@ViewBuilder content: () -> Content) -> some View where Content : View

```

### Discussion

These items are added alongside recently used system environments.

```swift
SystemPlayerView(player: player)
    .immersiveEnvironmentPicker {
        Button("Chalet", systemImage: "fireplace") {
            Task {
                await openImmersiveSpace(id: "Chalet")
            }
        }
    }
```

Use a `UIViewControllerRepresentable` instance to display a `AVPlayerViewController` class in your SwiftUI interface.

```swift
struct SystemPlayerView: UIViewControllerRepresentable {
    let player: AVPlayer

    func makeUIViewController(context: Context) -> AVPlayerViewController {
        return AVPlayerViewController()
    }

    func updateUIViewController(_ avPlayerViewController: AVPlayerViewController, context: Context) {
        viewController.player = player
    }
}
```

Items will be donated to media players (like `AVPlayerViewController`) downstream in the hierarchy.

> **NOTE:** View the sample code in `building-an-immersive-media-viewing-experience` to see an immersive space in action.







## Availability

- visionOS 2.0
