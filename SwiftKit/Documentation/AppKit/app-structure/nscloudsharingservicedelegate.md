---
url: https://developer.apple.com/documentation/appkit/nscloudsharingservicedelegate
framework: AppKit
category: App structure
title: NSCloudSharingServiceDelegate
kind: protocol
captured: 2026-05-02
---

# NSCloudSharingServiceDelegate

A set of methods for responding to the life cycle events of the cloud-sharing service.

## Declaration

```swift
protocol NSCloudSharingServiceDelegate : NSSharingServiceDelegate
```

### Overview

CloudKit allows a user to share a hierarchy of records with other iCloud users. In macOS, you use `NSItemProvider` and `NSSharingService` to facilitate sharing. Register an instance of `CKShare` with an item provider, and then use a sharing service to present it to the user. You must initialize the service with the `NSSharingService/Name/cloudSharing` service name. If the share is new, the user can configure the share and invite other iCloud users to participate. Otherwise, they can use the service to manage the share’s participants and their permissions.

This protocol defines methods that the sharing service calls when it saves changes to a share, or deletes it. The service also asks its delegate to provide the preferred sharing options when creating a new share. Set the service’s `NSSharingService/delegate` property to an object that implements this protocol. Use your implementation to provide any appropriate behavior, such as deleting a share you cache locally when the service deletes it from the server.

For more information about CloudKit sharing, see `shared-records`.





## Relationships

**Inherits From**: `NSObjectProtocol`, `NSSharingServiceDelegate`

## Availability

- macOS ?

## Topics

### Managing the Cloud-Sharing Service

- `sharingService(_:didCompleteForItems:error:)`
- `sharingService(_:didSave:)`
- `sharingService(_:didStopSharing:)`
- `options(for:share:)`
- `NSSharingService.CloudKitOptions`

## See Also

- `NSSharingService`
- `NSSharingServicePicker`
- `NSPreviewRepresentableActivityItem`
- `NSSharingServicePickerToolbarItem`
- `NSServicesMenuRequestor`
- `Services Functions`
