---
url: https://developer.apple.com/documentation/appkit/nsdataasset
framework: AppKit
category: Resource management
title: NSDataAsset
kind: class
captured: 2026-05-02
---

# NSDataAsset

An object from a data set type stored in an asset catalog.

## Declaration

```swift
class NSDataAsset
```

### Overview

The object’s content is stored as a set of one or more files with associated device attributes. These sets can also be tagged for use as on-demand resources.

#### Initialize data assets

Data assets are initialized from a named data set in an asset catalog. You create data sets during app development. Each data set contains one or more data files. Each file has associated attributes for features of the device, including the minimum amount of memory and the version of Metal. When you initialize the data asset, the system selects the data file that best matches the current device.

For more information on the data set type in an asset catalog, see `https://developer.apple.com/library/archive/documentation/Xcode/Reference/xcode_ref-Asset_Catalog_Format/DataSetType.html#//apple_ref/doc/uid/TP40015170-CH23` in `https://developer.apple.com/library/archive/documentation/Xcode/Reference/xcode_ref-Asset_Catalog_Format/index.html#//apple_ref/doc/uid/TP40015170`. For information on asset catalogs, see `managing-assets-with-asset-catalogs`.

#### Access the data

You access the data file by using the `NSDataAsset/data` property. Because the property is of type `NSData` it provides methods for accessing the raw data only as bytes and ranges of bytes.

To access structured data, convert the bytes into the appropriate format. The system can convert some data types for you. One example is XML data using the `XMLParser/init(data:)` method of `XMLParser`. Other data types require code for parsing and converting the raw data. You may need to convert larger data files incrementally.





## Relationships

**Inherits From**: `NSObject`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSCopying`, `NSObjectProtocol`

## Availability

- macOS 10.11

## Topics

### Initializing the data asset

- `init(name:)`
- `init(name:bundle:)`

### Accessing data

- `data`

### Getting data asset information

- `name`
- `NSDataAsset.Name`
- `typeIdentifier`
