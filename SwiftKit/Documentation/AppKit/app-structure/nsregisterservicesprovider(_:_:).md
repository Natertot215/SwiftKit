---
url: https://developer.apple.com/documentation/appkit/nsregisterservicesprovider(_:_:)
framework: AppKit
category: App structure
title: NSRegisterServicesProvider(_:_:)
kind: func
captured: 2026-05-02
---

# NSRegisterServicesProvider(_:_:)

Registers a service provider.

## Declaration

```swift
func NSRegisterServicesProvider(_ provider: Any?, _ name: NSServiceProviderName)
```

### Discussion

Use this function to register custom services not directly related to your application.

You should not use this function to register the services provided by your application. For your application’s services, you should use the `NSApplication/servicesProvider` method of `NSApplication`, passing a non-`nil` argument.

## Parameters

- **provider**: The object providing the service you want to register.
- **name**: The unique name to associate with the service. This string is used to advertise the service to interested clients.





## Availability

- macOS ?



## See Also

- `NSUnregisterServicesProvider(_:)`
- `NSUpdateDynamicServices()`
- `NSServiceProviderName`
