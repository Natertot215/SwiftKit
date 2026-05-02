---
url: https://developer.apple.com/documentation/appkit/nsgetwindowservermemory(_:_:_:_:)
framework: AppKit
category: Deprecated symbols
title: NSGetWindowServerMemory(_:_:_:_:)
kind: func
captured: 2026-05-02
---

# NSGetWindowServerMemory(_:_:_:_:)

Returns the amount of memory being used by a context.

## Declaration

```swift
func NSGetWindowServerMemory(_ context: Int, _ virtualMemory: UnsafeMutablePointer<Int>, _ windowBackingMemory: UnsafeMutablePointer<Int>, _ windowDumpString: AutoreleasingUnsafeMutablePointer<NSString>) -> Int
```

### Discussion

Calculates the amount of memory being used at the moment by the given `context`. If `NULL` is passed for `context`, the current context is used. The amount of virtual memory used by the current context is returned in the int pointed to by `virtualMemory`; the amount of window backing store used by windows owned by the current context is returned in the int pointed to by `windowBackingMemory`. The sum of these two numbers is the amount of the memory that this context is responsible for.

Calculating these numbers takes some time to execute; thus, calling this function in normal operation is not recommended.

If `nil` is not passed in for `windowDumpStream`, the information returned is echoed to the specified stream. This fact can be useful for finding out more about which windows are using up your storage.

Normally, `NSGetWindowServerMemory` returns 0. If `NULL` is passed for `context` and there’s no current display context, this function returns –1.







## Availability

- macOS 10.0 (deprecated 10.14)



## See Also

- `NSConvertGlyphsToPackedGlyphs(_:_:_:_:)`
- `raiseBadArgumentException(_:_:_:)`
- `NSReleaseAlertPanel(_:)`
- `NSDisableScreenUpdates()`
- `NSEnableScreenUpdates()`
- `NSDrawColorTiledRects(_:_:_:_:_:)`
- `NSSetShowsServicesMenuItem(_:_:)`
- `NSCopyBits(_:_:_:)`
- `NSShowsServicesMenuItem(_:)`
- `NSDottedFrameRect(_:)`
- `NSReadPixel(_:)`
- `fileContentsType(forPathExtension:)`
- `fileNameType(forPathExtension:)`
- `representedPathExtension`
- `representedPathExtensions(from:)`
