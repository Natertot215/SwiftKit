---
url: https://developer.apple.com/documentation/appkit/nstreenode
framework: AppKit
category: Cocoa bindings
title: NSTreeNode
kind: class
captured: 2026-05-02
---

# NSTreeNode

A node in a tree of nodes.

## Declaration

```swift
class NSTreeNode
```

### Overview

`NSTreeNode` simplifies the creation and management of trees of objects. Each tree node represents a model object. A tree node with `nil` as its parent node is considered the root of the tree.





## Relationships

**Inherits From**: `NSObject`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSObjectProtocol`

## Availability

- macOS 10.5

## Topics

### Creating tree nodes

- `init(representedObject:)`

### Getting information about a node

- `representedObject`
- `indexPath`
- `isLeaf`
- `children`
- `mutableChildren`
- `descendant(at:)`
- `parent`

### Sorting the subtree

- `sort(with:recursively:)`

## See Also

- `Navigating Hierarchical Data Using Outline and Split Views`
- `NSTreeController`
