---
url: https://developer.apple.com/documentation/swiftui/navigationsplitview
framework: SwiftUI
category: Navigation
title: NavigationSplitView
kind: struct
captured: 2026-05-01
---

# NavigationSplitView

## Declaration

```swift
struct NavigationSplitView<Sidebar, Content, Detail> where Sidebar : View, Content : View, Detail : View
```

## Abstract

A view that presents views in two or three columns, where selections in leading columns control presentations in subsequent columns.

## Overview

You create a navigation split view with two or three columns, and typically use it as the root view in a `Scene`. People choose one or more items in a leading column to display details about those items in subsequent columns.

### Two-Column Navigation Split View

```swift
@State private var employeeIds: Set<Employee.ID> = []

var body: some View {
    NavigationSplitView {
        List(model.employees, selection: $employeeIds) { employee in
            Text(employee.name)
        }
    } detail: {
        EmployeeDetails(for: employeeIds)
    }
}
```

### Three-Column Navigation Split View

```swift
@State private var departmentId: Department.ID?
@State private var employeeIds: Set<Employee.ID> = []

var body: some View {
    NavigationSplitView {
        List(model.departments, selection: $departmentId) { department in
            Text(department.name)
        }
    } content: {
        if let department = model.department(id: departmentId) {
            List(department.employees, selection: $employeeIds) { employee in
                Text(employee.name)
            }
        } else {
            Text("Select a department")
        }
    } detail: {
        EmployeeDetails(for: employeeIds)
    }
}
```

### Column Visibility Control

```swift
@State private var columnVisibility = NavigationSplitViewVisibility.detailOnly

NavigationSplitView(columnVisibility: $columnVisibility) {
    List(model.employees, selection: $employeeIds) { employee in
        Text(employee.name)
    }
} detail: {
    EmployeeDetails(for: employeeIds)
}
```

### Collapsed Split Views

On narrow size classes a navigation split view collapses into a single stack. Control which column appears on top using `preferredCompactColumn`:

```swift
@State private var preferredColumn = NavigationSplitViewColumn.detail

NavigationSplitView(preferredCompactColumn: $preferredColumn) {
    Color.yellow
} detail: {
    Color.blue
}
```

### Customization

- **Column Width:** `navigationSplitViewColumnWidth(_:)` for fixed widths or `navigationSplitViewColumnWidth(min:ideal:max:)` for flexible widths
- **Split View Style:** `navigationSplitViewStyle(_:)` to specify column interaction behavior
- **Sidebar Toggle:** Remove default sidebar toggle with `toolbar(removing:)`

## Availability

| Platform | Version |
|----------|---------|
| iOS | 16.0+ |
| iPadOS | 16.0+ |
| Mac Catalyst | 16.0+ |
| macOS | 13.0+ |
| tvOS | 16.0+ |
| visionOS | 1.0+ |
| watchOS | 9.0+ |

## See Also

- Bringing robust navigation structure to your SwiftUI app
- Migrating to new navigation types
- `navigationSplitViewStyle(_:)`
- `navigationSplitViewColumnWidth(_:)`
- `navigationSplitViewColumnWidth(min:ideal:max:)`
- `NavigationSplitViewVisibility`
- `NavigationLink`
