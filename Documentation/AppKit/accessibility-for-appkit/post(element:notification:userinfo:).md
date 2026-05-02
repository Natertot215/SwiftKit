---
url: https://developer.apple.com/documentation/appkit/nsaccessibility-swift.struct/post(element:notification:userinfo:)
framework: AppKit
category: Accessibility for AppKit
title: post(element:notification:userInfo:)
kind: method
captured: 2026-05-02
---

# post(element:notification:userInfo:)

Sends a notification and an optional user info dictionary to any observing assistive apps.

## Declaration

```swift
static func post(element: Any, notification: NSAccessibility.Notification, userInfo: [NSAccessibility.NotificationUserInfoKey : Any]?)
```

### Discussion

Sends `notification` and `userInfo` to any assistive apps that register to receive the notification from the UI object `element` in your app. The system restricts the `userInfo` dictionary values to the same values as it restricts the accessibility attributes. The `userInfo` dictionary can also be `nil` (most accessibility notifications don’t require it).







## Availability

- macOS 10.7



## See Also

- `post(element:notification:)`
