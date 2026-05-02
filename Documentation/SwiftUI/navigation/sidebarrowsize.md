---
url: https://developer.apple.com/documentation/swiftui/sidebarrowsize
framework: SwiftUI
category: Navigation
title: SidebarRowSize
kind: enum
captured: 2026-05-02
---

# SidebarRowSize

The standard sizes of sidebar rows.

## Declaration

```swift
enum SidebarRowSize
```

### Overview

On macOS, sidebar rows have three different sizes: small, medium, and large. The size is primarily controlled by the current users’ “Sidebar Icon Size” in Appearance settings, and applies to all applications.

On all other platforms, the only supported sidebar size is `.medium`.

This size can be read or written in the environment using `EnvironmentValues.sidebarRowSize`.





## Relationships

**Conforms To**: `Copyable`, `Equatable`, `Escapable`, `Hashable`, `Sendable`, `SendableMetatype`

## Availability

- iOS 16.0
- iPadOS 16.0
- Mac Catalyst 16.0
- macOS 13.0
- tvOS 16.0
- visionOS 1.0
- watchOS 9.0

## Topics

### Getting row sizes

- `SidebarRowSize.small`
- `SidebarRowSize.medium`
- `SidebarRowSize.large`

## See Also

- `sidebarRowSize`
