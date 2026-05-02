---
url: https://developer.apple.com/documentation/appkit/preview(_:traits:body:)-7pfjp
framework: AppKit
category: Reference (enumerations, constants, data types, macros)
title: Preview(_:traits:body:)
kind: macro
captured: 2026-05-02
---

# Preview(_:traits:body:)

Preview an NSView.

## Declaration

```swift
@freestanding(declaration) macro Preview(_ name: String? = nil, traits: PreviewTrait<Preview.ViewTraits>..., @PreviewMacroBodyBuilder<NSView> body: @escaping @MainActor () -> NSView)
```



## Parameters

- **name**: Optional display name for the preview, which will appear in the canvas.
- **traits**: Optional list of traits customizing the appearance of the preview.
- **body**: A closure producing an NSView.





## Availability

- macOS 14.0



## See Also

- `NSIMAGE_UNAVAILABLE_MACCATALYST`
- `NS_USER_ACTIVITY_SUPPORTED`
- `Preview(_:traits:body:)`
