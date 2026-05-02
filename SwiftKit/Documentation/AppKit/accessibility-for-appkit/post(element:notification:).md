---
url: https://developer.apple.com/documentation/appkit/nsaccessibility-swift.struct/post(element:notification:)
framework: AppKit
category: Accessibility for AppKit
title: post(element:notification:)
kind: method
captured: 2026-05-02
---

# post(element:notification:)

Sends a notification to any observing assistive apps.

## Declaration

```swift
static func post(element: Any, notification: NSAccessibility.Notification)
```

### Discussion

Sends `notification` to any assistive applications that register to receive the notification from the user interface object `element` in your app. Accessibility notifications require special handling, so they can’t post using `NotificationCenter`.







## Availability

- macOS ?



## See Also

- `post(element:notification:userInfo:)`
