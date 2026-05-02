---
url: https://developer.apple.com/documentation/appkit/nsunregisterservicesprovider(_:)
framework: AppKit
category: App structure
title: NSUnregisterServicesProvider(_:)
kind: func
captured: 2026-05-02
---

# NSUnregisterServicesProvider(_:)

Unregisters a service provider.

## Declaration

```swift
func NSUnregisterServicesProvider(_ name: NSServiceProviderName)
```

### Discussion

Use this function to unregister custom services not directly related to your application.

You should not use this function to unregister the services provided by your application. For your application’s services, you should use the `NSApplication/servicesProvider` method of `NSApplication`, passing a `nil` argument.

## Parameters

- **name**: The name of the service you want to unregister.





## Availability

- macOS ?



## See Also

- `NSRegisterServicesProvider(_:_:)`
- `NSUpdateDynamicServices()`
- `NSServiceProviderName`
