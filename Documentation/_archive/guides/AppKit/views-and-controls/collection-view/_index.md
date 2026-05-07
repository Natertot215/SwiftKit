---
url: https://developer.apple.com/documentation/appkit/collection-view
framework: AppKit
category: Views and controls
title: Collection View
kind: article
captured: 2026-05-01
---

# Collection View

## Overview

Display one or more subviews in a highly configurable arrangement.

## Description

Collection View is an API collection in AppKit that provides a comprehensive framework for displaying ordered collections of data items in customizable layouts.

## Core Components

### View
- **NSCollectionView** - An ordered collection of data items displayed in a customizable layout
- **NSCollectionViewSectionHeaderView** - A protocol that defines a button to control the collapse of a collection view's section

### Layout System

#### Basic Layout Components
- **NSCollectionLayoutItem** - The most basic component of a collection view's layout
- **NSCollectionLayoutGroup** - A container for a set of items that lays out the items along a path
- **NSCollectionLayoutSection** - A container that combines a set of groups into distinct visual groupings

#### Size and Spacing
- **NSCollectionLayoutDimension** - An individual dimension representing an item's width or height
- **NSCollectionLayoutSize** - The width and height of an item in a collection view
- **NSCollectionLayoutSpacing** - An object that defines the space between or around items
- **NSCollectionLayoutEdgeSpacing** - An object that defines the space around the edges of items
- **NSCollectionLayoutContainer** - A protocol used to provide information about the size and content insets of a layout's container

### Data Management
- **NSCollectionViewDataSource** - A set of methods that a data source object implements to provide information and view objects
- **NSCollectionViewDelegate** - A set of methods that you use to manage the behavior of a collection view
- **NSCollectionViewDiffableDataSource** - The object you use to manage data and provide items for a collection view
- **NSDiffableDataSourceSnapshot** - A representation of the state of the data in a view at a specific point in time

### Items
- **NSCollectionViewItem** - The visual representation for a single data element in a collection view
- **NSCollectionViewElement** - A protocol that manages content in a collection view

### Layout Types
- **NSCollectionViewFlowLayout** - A layout that organizes items into a flexible and configurable arrangement
- **NSCollectionViewGridLayout** - A layout that displays a single section of items in a row and column grid
- **NSCollectionViewCompositionalLayout** - A layout object that lets you combine items in highly adaptive and flexible visual arrangements
- **NSCollectionViewLayout** - An abstract base class for custom layout implementations
- **NSCollectionViewTransitionLayout** - Implements custom behaviors when changing from one layout to another

### Appearance
- **NSCollectionLayoutBoundarySupplementaryItem** - An object used to add headers or footers
- **NSCollectionLayoutSupplementaryItem** - An object used to add extra visual decoration to an item
- **NSCollectionLayoutDecorationItem** - An object used to add a background to a section
- **NSCollectionLayoutAnchor** - An object that defines how to attach a supplementary item to an item

### Advanced Features
- **NSCollectionLayoutGroupCustomItem** - An item used in a group with a custom layout arrangement
- **NSCollectionLayoutVisibleItem** - An item that's currently visible within the bounds of a section
- **NSCollectionLayoutEnvironment** - A protocol that provides information about layout container and environment traits

## Related Topics

### Content Views
- Outline View - Display a list-based interface for hierarchical data
- Table View - Display custom data in rows and columns
- Browser View - Provide a column-based interface for hierarchical information
- NSTextView - A view that draws text and handles user interactions
