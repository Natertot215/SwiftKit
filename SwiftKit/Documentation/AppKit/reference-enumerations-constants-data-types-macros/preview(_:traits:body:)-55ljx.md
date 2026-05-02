---
url: https://developer.apple.com/documentation/appkit/preview(_:traits:body:)-55ljx
framework: AppKit
category: Reference (enumerations, constants, data types, macros)
title: Preview(_:traits:body:)
kind: macro
captured: 2026-05-02
---

# Preview(_:traits:body:)

Preview an NSViewController.

## Declaration

```swift
@freestanding(declaration) macro Preview(_ name: String? = nil, traits: PreviewTrait<Preview.ViewTraits>..., @PreviewMacroBodyBuilder<NSViewController> body: @escaping @MainActor () -> NSViewController)
```



## Parameters

- **name**: Optional display name for the preview, which will appear in the canvas.
- **traits**: Optional list of traits customizing the appearance of the preview.
- **body**: A closure producing an NSViewController.





## Availability

- macOS 14.0



## See Also

- `NSIMAGE_UNAVAILABLE_MACCATALYST`
- `NS_USER_ACTIVITY_SUPPORTED`
- `Preview(_:traits:body:)`
