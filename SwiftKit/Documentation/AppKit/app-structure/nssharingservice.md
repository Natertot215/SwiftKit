---
url: https://developer.apple.com/documentation/appkit/nssharingservice
framework: AppKit
category: App structure
title: NSSharingService
kind: class
captured: 2026-05-01
---

# NSSharingService

## Declaration

```swift
class NSSharingService
```

## Abstract

An object that facilitates the sharing of content with social media services, or with apps like Mail or Safari.

## Overview

An `NSSharingService` object provides a consistent user experience for sharing items—`NSURL` objects, `NSString` objects, `NSImage` objects, video (through file URLs), of any object that implements the `NSPasteboardWriting` protocol—in macOS.

For any item or group of items, the `NSSharingService` displays a sheet with the content to share. A sharing service can create a post on a social network like Twitter or Facebook, send a message by email or iMessage, upload videos to viewing services, or send a file using AirDrop.

You can use `NSSharingService` objects directly in your app. The following example shows how to create a button that shares content directly to a social media service.

```objc
- (void)awakeFromNib
{
    NSSharingService * service = [NSSharingService sharingServiceNamed:NSSharingServiceNamePostOnTwitter];
    [myShareOnTwitterButton setTitle:service.title];
    [myShareOnTwitterButton setEnabled:[service canPerformWithItems:nil]];
}

- (IBAction)shareOnTwitter:(id)sender
{
    // Items to share
    NSAttributedString *text = [self.textView attributedString];
    NSImage *image = [self.imageView image];
    NSArray * shareItems = [NSArray arrayWithObjects:text, image, nil];

    NSSharingService *service = [NSSharingService sharingServiceNamed:NSSharingServiceNamePostOnTwitter];
    service.delegate = self;
    [service performWithItems:shareItems];
}
```

## Availability

- **macOS** 10.8+

## Inheritance

Inherits from `NSObject`

## Conformances

- `CVarArg`
- `CustomDebugStringConvertible`
- `CustomStringConvertible`
- `Equatable`
- `Hashable`
- `NSObjectProtocol`

## See Also

- `NSSharingServicePicker` — A list of sharing services that the user can choose from
- `NSSharingServicePickerToolbarItem` — A toolbar item that displays the macOS share sheet
- `NSServicesMenuRequestor` — A set of methods that support interaction with items users can share
- `NSCloudSharingServiceDelegate` — A set of methods for responding to cloud-sharing service life cycle events
- `NSPreviewRepresentableActivityItem` — An interface for custom objects you want to share using the macOS share sheet
