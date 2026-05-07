import SwiftUI
import AppKit

// AppKit Accessibility — comprehensive reference for NSAccessibility and related types.
//
// Absorbed leaves:
//   AppKit Elements:    NSAccessibilityProtocol, NSAccessibility (struct)
//   Custom view subclasses: Custom Controls (article), NSAccessibilityButton,
//     NSAccessibilityRadioButton, NSAccessibilitySwitch, NSAccessibilityCheckBox,
//     NSAccessibilityStepper, NSAccessibilitySlider, NSAccessibilityGroup,
//     NSAccessibilityTable, NSAccessibilityList, NSAccessibilityOutline,
//     NSAccessibilityRow, NSAccessibilityStaticText, NSAccessibilityNavigableStaticText,
//     NSAccessibilityColor, NSAccessibilityProgressIndicator,
//     NSAccessibilityElementLoading, NSAccessibilityContainsTransientUI,
//     NSAccessibilityLayoutArea, NSAccessibilityLayoutItem,
//     NSAccessibilityElementProtocol, Accessibility Functions,
//     NSAccessibility.post(element:notification:),
//     NSAccessibility.post(element:notification:userInfo:),
//     NSAccessibility.Notification, NSAccessibility.NotificationUserInfoKey,
//     NSAccessibility.screenRect(fromView:rect:),
//     NSAccessibility.screenPoint(fromView:point:),
//     NSAccessibility.unignoredChildren(from:),
//     NSAccessibility.unignoredChildrenForOnlyChild(from:),
//     NSAccessibility.unignoredDescendant(of:),
//     NSAccessibility.unignoredAncestor(of:),
//     NSAccessibility.setMayContainProtectedContent(_:),
//     NSAccessibility.Action.description,
//     NSAccessibility.Role.description(with:),
//     NSAccessibility.Role.description(for:)
//   Custom Elements:    NSAccessibilityElement
//   Accessibility Types: NSAccessibility.Action, NSAccessibility.AnnotationAttributeKey,
//     NSAccessibilityAnnotationPosition, NSAccessibility.Attribute,
//     NSAccessibility.FontAttributeKey, NSAccessibilityOrientation,
//     NSAccessibility.OrientationValue, NSAccessibility.ParameterizedAttribute,
//     NSAccessibility.Role, NSAccessibilityRulerMarkerType,
//     NSAccessibility.RulerMarkerTypeValue, NSAccessibility.RulerUnitValue,
//     NSAccessibility.SortDirectionValue, NSAccessibilitySortDirection,
//     NSAccessibility.Subrole, NSAccessibilityUnits

// MARK: - Page

struct NSAccessibilityPage: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 36) {
                header
                coreProtocolSection
                elementSection
                roleProtocolsSection
                notificationsSection
                typesSection
                helperFunctionsSection
                notesSection
            }
            .padding(.horizontal, 32)
            .padding(.vertical, 24)
            .frame(maxWidth: galleryReadableContentWidth, alignment: .leading)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }

    // MARK: Header

    private var header: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("Accessibility for AppKit")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("NSAccessibility protocols, element types, notifications, attribute constants, and helper functions for building accessible custom views.")
                .font(.callout).foregroundStyle(.secondary)
            Text("AppKit \u{00b7} macOS 10.0+ \u{00b7} NSAccessibilityColor macOS 11.0+")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary)
        }
    }

    // MARK: Core Protocol

    private var coreProtocolSection: some View {
        PageSection("Reference \u{2014} NSAccessibilityProtocol / NSAccessibility") {
            VStack(alignment: .leading, spacing: 16) {
                refBlock(
                    name: "NSAccessibilityProtocol",
                    kind: "protocol",
                    availability: "macOS 10.10+",
                    blurb: "The principal AppKit accessibility contract. NSView adopts this automatically; custom NSView subclasses override methods to expose custom information to VoiceOver and other assistive technologies."
                ) {
                    snippet("""
                    protocol NSAccessibilityProtocol: AnyObject {
                        // Roles and labels:
                        func accessibilityRole() -> NSAccessibility.Role?
                        func accessibilityRoleDescription() -> String?
                        func accessibilitySubrole() -> NSAccessibility.Subrole?
                        func accessibilityLabel() -> String?
                        func accessibilityTitle() -> String?
                        func accessibilityHelp() -> String?

                        // Value:
                        func accessibilityValue() -> Any?
                        func setAccessibilityValue(_ accessibilityValue: Any?)
                        func accessibilityMinValue() -> Any?
                        func accessibilityMaxValue() -> Any?

                        // Geometry:
                        func accessibilityFrame() -> NSRect
                        func accessibilityParent() -> Any?
                        func accessibilityChildren() -> [Any]?
                        func accessibilityFocusedUIElement() -> Any?

                        // State:
                        func isAccessibilityEnabled() -> Bool
                        func isAccessibilityHidden() -> Bool
                        func isAccessibilityFocused() -> Bool
                        func isAccessibilitySelected() -> Bool
                        func isAccessibilityExpanded() -> Bool

                        // Actions:
                        func accessibilityPerformPress() -> Bool
                        func accessibilityPerformIncrement() -> Bool
                        func accessibilityPerformDecrement() -> Bool
                        func accessibilityActionNames() -> [NSAccessibility.Action]
                        func accessibilityPerformAction(_ action: NSAccessibility.Action) -> Bool
                    }
                    """)
                }

                refBlock(
                    name: "NSAccessibility (struct)",
                    kind: "struct (namespace for static methods and constants)",
                    availability: "macOS 10.0+",
                    blurb: "A namespace struct providing static accessibility utility functions, notification posting, and constant key types (Action, Attribute, Role, Subrole, etc.)."
                ) {
                    snippet("""
                    // NSAccessibility is a struct that holds static constants and functions:
                    struct NSAccessibility {
                        // Post notifications:
                        static func post(element: Any, notification: NSAccessibility.Notification)
                        static func post(element: Any, notification: NSAccessibility.Notification,
                                         userInfo: [NSAccessibility.NotificationUserInfoKey: Any]?)

                        // Screen / view coordinate conversion:
                        static func screenRect(fromView view: NSView, rect: NSRect) -> NSRect
                        static func screenPoint(fromView view: NSView, point: NSPoint) -> NSPoint

                        // Unignored element traversal:
                        static func unignoredChildren(from originalChildren: [Any]) -> [Any]
                        static func unignoredChildrenForOnlyChild(from originalChild: Any) -> [Any]
                        static func unignoredDescendant(of element: Any) -> Any?
                        static func unignoredAncestor(of element: Any) -> Any?

                        // Protected content:
                        static func setMayContainProtectedContent(_ flag: Bool) -> Bool
                    }
                    """)
                }
            }
        }
    }

    // MARK: Element

    private var elementSection: some View {
        PageSection("Reference \u{2014} NSAccessibilityElement") {
            VStack(alignment: .leading, spacing: 16) {
                refBlock(
                    name: "NSAccessibilityElement",
                    kind: "class : NSObject",
                    availability: "macOS 10.10+",
                    blurb: "A concrete accessibility element that is not backed by an NSView. Use when a view contains logical sub-regions that are individually accessible (e.g., chart segments, custom list items) but are not separate NSView instances."
                ) {
                    snippet("""
                    class NSAccessibilityElement: NSObject, NSAccessibilityProtocol

                    // Convenience factory:
                    class func accessibilityElement(
                        withRole role: NSAccessibility.Role,
                        frame: NSRect,
                        label: String?,
                        parent: Any?
                    ) -> Any

                    // Set an explicit accessibility frame in screen coordinates:
                    func setAccessibilityFrameInParentSpace(_ frame: NSRect)
                    var accessibilityFrameInParentSpace: NSRect

                    // Override in a subclass or set directly via NSAccessibilityProtocol methods:
                    // accessibilityRole()          → return .button / .staticText / etc.
                    // accessibilityLabel()         → return descriptive string
                    // accessibilityFrame()         → return NSAccessibility.screenRect(fromView:rect:)

                    // Example custom chart segment element:
                    class PieSliceElement: NSAccessibilityElement {
                        override func accessibilityRole() -> NSAccessibility.Role? { .valueIndicator }
                        override func accessibilityLabel() -> String? { "Revenue: 42%" }
                        override func accessibilityFrame() -> NSRect {
                            NSAccessibility.screenRect(fromView: ownerView, rect: sliceBounds)
                        }
                    }
                    """)
                }

                refBlock(
                    name: "NSAccessibilityElementProtocol",
                    kind: "protocol",
                    availability: "macOS 10.10+",
                    blurb: "The protocol declared on NSObject that makes any object potentially accessible. All objects inherit base NSAccessibilityProtocol conformance through NSObject; this protocol codifies the key entry points."
                ) {
                    snippet("""
                    protocol NSAccessibilityElementProtocol: NSObjectProtocol {
                        func accessibilityIdentifier() -> String    // developer-facing ID (not shown to users)
                    }
                    """)
                }
            }
        }
    }

    // MARK: Role Protocols

    private var roleProtocolsSection: some View {
        PageSection("Reference \u{2014} Role Protocols (Custom View Subclasses)") {
            VStack(alignment: .leading, spacing: 16) {
                Text("These protocols refine NSAccessibilityProtocol for a specific role. Adopt the matching protocol in an NSView subclass whose view acts as that control type. Each is implemented by overriding properties and methods that describe the role-specific state.")
                    .font(.callout).foregroundStyle(.secondary)

                refBlock(
                    name: "NSAccessibilityButton",
                    kind: "protocol : NSAccessibilityProtocol",
                    availability: "macOS 10.10+",
                    blurb: "Adopt in a custom view that acts as a button. The system provides the .button role; you override accessibilityLabel() and accessibilityPerformPress() for tap semantics."
                ) {
                    snippet("""
                    protocol NSAccessibilityButton: NSAccessibilityProtocol {
                        func accessibilityLabel() -> String?       // button name
                        func accessibilityPerformPress() -> Bool   // simulate tap/click
                    }
                    // Optional:
                    func accessibilityPerformShowMenu() -> Bool    // for dropdown buttons
                    """)
                }

                refBlock(
                    name: "NSAccessibilitySwitch",
                    kind: "protocol : NSAccessibilityButton",
                    availability: "macOS 10.10+",
                    blurb: "Extend NSAccessibilityButton for toggle controls (on/off). accessibilityValue() must return \"0\" or \"1\" as a String."
                ) {
                    snippet("""
                    protocol NSAccessibilitySwitch: NSAccessibilityButton {
                        func accessibilityValue() -> Any?     // return "0" or "1" as String
                        func accessibilityPerformDecrement() -> Bool  // toggle off
                        func accessibilityPerformIncrement() -> Bool  // toggle on
                    }
                    """)
                }

                refBlock(
                    name: "NSAccessibilityCheckBox / NSAccessibilityRadioButton",
                    kind: "protocols : NSAccessibilityButton",
                    availability: "macOS 10.10+",
                    blurb: "Checkbox returns 0 (off), 1 (on), or 2 (mixed) as NSNumber from accessibilityValue(). RadioButton follows the same pattern but implies group membership."
                ) {
                    snippet("""
                    protocol NSAccessibilityCheckBox: NSAccessibilityButton {
                        func accessibilityValue() -> Any?     // NSNumber: 0=off, 1=on, 2=mixed
                    }
                    protocol NSAccessibilityRadioButton: NSAccessibilityButton {
                        func accessibilityValue() -> Any?     // NSNumber: 0=off, 1=on
                    }
                    """)
                }

                refBlock(
                    name: "NSAccessibilityStepper",
                    kind: "protocol : NSAccessibilityProtocol",
                    availability: "macOS 10.10+",
                    blurb: "Adopt in a custom view that increments/decrements a numeric value."
                ) {
                    snippet("""
                    protocol NSAccessibilityStepper: NSAccessibilityProtocol {
                        func accessibilityLabel() -> String?
                        func accessibilityValue() -> Any?          // current numeric value
                        func accessibilityPerformDecrement() -> Bool
                        func accessibilityPerformIncrement() -> Bool
                    }
                    """)
                }

                refBlock(
                    name: "NSAccessibilitySlider",
                    kind: "protocol : NSAccessibilityProtocol",
                    availability: "macOS 10.10+",
                    blurb: "Adopt in a custom slider. Expose min, max, and current value. VoiceOver reads the value and allows increment/decrement gestures."
                ) {
                    snippet("""
                    protocol NSAccessibilitySlider: NSAccessibilityProtocol {
                        func accessibilityLabel() -> String?
                        func accessibilityValue() -> Any?       // current value (NSNumber)
                        func accessibilityMinValue() -> Any?
                        func accessibilityMaxValue() -> Any?
                        func accessibilityPerformDecrement() -> Bool
                        func accessibilityPerformIncrement() -> Bool
                    }
                    """)
                }

                refBlock(
                    name: "NSAccessibilityGroup",
                    kind: "protocol : NSAccessibilityProtocol",
                    availability: "macOS 10.10+",
                    blurb: "Groups a set of accessibility elements. VoiceOver reads the group label then navigates children. Use for logical groups that aren't containers (e.g., a custom toolbar segment)."
                ) {
                    snippet("""
                    protocol NSAccessibilityGroup: NSAccessibilityProtocol {
                        func accessibilityLabel() -> String?   // group name
                        func accessibilityChildren() -> [Any]? // child elements
                    }
                    """)
                }

                refBlock(
                    name: "NSAccessibilityList / NSAccessibilityTable / NSAccessibilityOutline / NSAccessibilityRow",
                    kind: "protocols : NSAccessibilityProtocol",
                    availability: "macOS 10.10+",
                    blurb: "Role protocols for collection-style views. Expose child rows/cells via accessibilityChildren(); individual rows adopt NSAccessibilityRow and expose their level (for outline) and column values."
                ) {
                    snippet("""
                    protocol NSAccessibilityList: NSAccessibilityGroup {
                        func accessibilityVisibleRows() -> [Any]?
                        func accessibilitySelectedRows() -> [Any]?
                        func setAccessibilitySelectedRows(_ selectedRows: [Any])
                    }
                    protocol NSAccessibilityTable: NSAccessibilityList {
                        func accessibilityColumns() -> [Any]?
                        func accessibilityVisibleColumns() -> [Any]?
                        func accessibilitySelectedColumns() -> [Any]?
                        func accessibilityRows() -> [Any]?
                        func accessibilityHeader() -> Any?
                    }
                    protocol NSAccessibilityOutline: NSAccessibilityTable {}
                    protocol NSAccessibilityRow: NSAccessibilityGroup {
                        func accessibilityIndex() -> Int          // zero-based row index
                        func accessibilityDisclosureLevel() -> Int // outline nesting depth
                        func accessibilityDisclosed() -> Bool      // expanded/collapsed
                        func setAccessibilityDisclosed(_ accessibilityDisclosed: Bool)
                    }
                    """)
                }

                refBlock(
                    name: "NSAccessibilityStaticText / NSAccessibilityNavigableStaticText",
                    kind: "protocols : NSAccessibilityProtocol",
                    availability: "macOS 10.10+",
                    blurb: "For non-interactive text. NSAccessibilityNavigableStaticText adds character- and range-level navigation, enabling cursor movement inside a custom text view."
                ) {
                    snippet("""
                    protocol NSAccessibilityStaticText: NSAccessibilityProtocol {
                        func accessibilityValue() -> Any?              // the text string
                        func accessibilityAttributedStringForRange(_ range: NSRange) -> NSAttributedString?
                        func accessibilityVisibleCharacterRange() -> NSRange
                    }
                    protocol NSAccessibilityNavigableStaticText: NSAccessibilityStaticText {
                        func accessibilityStringForRange(_ range: NSRange) -> String?
                        func accessibilityLineForIndex(_ index: Int) -> Int
                        func accessibilityRangeForLine(_ lineNumber: Int) -> NSRange
                        func accessibilityFrameForRange(_ range: NSRange) -> NSRect
                        func accessibilityRangeForPosition(_ point: NSPoint) -> NSRange
                        func accessibilityRangeForIndex(_ index: Int) -> NSRange
                        func accessibilityInsertionPointLineNumber() -> Int
                    }
                    """)
                }

                refBlock(
                    name: "NSAccessibilityProgressIndicator",
                    kind: "protocol : NSAccessibilityGroup",
                    availability: "macOS 10.10+",
                    blurb: "Adopt in a custom progress bar or spinner. Return min, max, and current value."
                ) {
                    snippet("""
                    protocol NSAccessibilityProgressIndicator: NSAccessibilityGroup {
                        func accessibilityValue() -> Any?       // current progress (NSNumber)
                        func accessibilityMinValue() -> Any?    // typically 0
                        func accessibilityMaxValue() -> Any?    // typically 1 or 100
                    }
                    """)
                }

                refBlock(
                    name: "NSAccessibilityColor",
                    kind: "protocol : NSAccessibilityProtocol",
                    availability: "macOS 11.0+",
                    blurb: "Adopt in a custom color swatch or color well. Return an NSColor from accessibilityColor() so VoiceOver can describe the color semantically."
                ) {
                    snippet("""
                    protocol NSAccessibilityColor: NSAccessibilityProtocol {
                        func accessibilityColor() -> NSColor?
                    }
                    """)
                }

                refBlock(
                    name: "NSAccessibilityElementLoading / NSAccessibilityContainsTransientUI",
                    kind: "protocols",
                    availability: "macOS 10.13+ / macOS 10.10+",
                    blurb: "NSAccessibilityElementLoading marks elements that are still loading asynchronously. NSAccessibilityContainsTransientUI marks containers that temporarily display a secondary UI (e.g., autocomplete list) that assistive technologies should announce."
                ) {
                    snippet("""
                    protocol NSAccessibilityElementLoading: NSObjectProtocol {
                        func accessibilityLabel() -> String?
                        func accessibilityFrame() -> NSRect
                    }
                    protocol NSAccessibilityContainsTransientUI: NSAccessibilityProtocol {
                        func accessibilityPerformShowAlternateUI() -> Bool
                        func accessibilityPerformShowDefaultUI() -> Bool
                        func isAccessibilityAlternateUIVisible() -> Bool
                    }
                    """)
                }

                refBlock(
                    name: "NSAccessibilityLayoutArea / NSAccessibilityLayoutItem",
                    kind: "protocols : NSAccessibilityGroup / NSAccessibilityProtocol",
                    availability: "macOS 10.10+",
                    blurb: "For canvas or drawing surfaces (NSLayoutArea) and individual items within them (NSLayoutItem). A layout area returns items via accessibilityChildren()."
                ) {
                    snippet("""
                    protocol NSAccessibilityLayoutArea: NSAccessibilityGroup {
                        func accessibilityLabel() -> String?
                        func accessibilityChildren() -> [Any]?
                        func accessibilitySelectedChildren() -> [Any]?
                        func accessibilityFocusedUIElement() -> Any?
                    }
                    protocol NSAccessibilityLayoutItem: NSAccessibilityGroup {
                        func setAccessibilityFrame(_ frame: NSRect)  // allow VoiceOver to move items
                    }
                    """)
                }
            }
        }
    }

    // MARK: Notifications

    private var notificationsSection: some View {
        PageSection("Reference \u{2014} Notifications") {
            VStack(alignment: .leading, spacing: 16) {
                refBlock(
                    name: "NSAccessibility.post(element:notification:)",
                    kind: "static func",
                    availability: "macOS 10.0+",
                    blurb: "Posts an accessibility notification from an element to all listening assistive technologies. Call after layout changes, selection changes, value updates, or focus movements."
                ) {
                    snippet("""
                    // Post a selection-changed notification:
                    NSAccessibility.post(element: myView,
                                         notification: .selectedChildrenChanged)

                    // Post with additional user info (macOS 10.7+):
                    NSAccessibility.post(
                        element: myView,
                        notification: .announcementRequested,
                        userInfo: [
                            .announcement: "File saved successfully",
                            .priority: NSAccessibilityPriorityLevel.high.rawValue,
                        ]
                    )

                    // Common notifications:
                    NSAccessibility.Notification.valueChanged
                    NSAccessibility.Notification.selectedChildrenChanged
                    NSAccessibility.Notification.selectedRowsChanged
                    NSAccessibility.Notification.focusedUIElementChanged
                    NSAccessibility.Notification.windowCreated
                    NSAccessibility.Notification.layoutChanged
                    NSAccessibility.Notification.announcementRequested  // screen reader announcement
                    """)
                }

                refBlock(
                    name: "NSAccessibility.Notification",
                    kind: "struct (RawRepresentable)",
                    availability: "macOS 10.0+",
                    blurb: "Typed constants for the notification name parameter of post(element:notification:). The full list is in NSAccessibility.Notification static properties."
                ) {
                    snippet("""
                    // Selected set:
                    .focusedUIElementChanged
                    .focusedWindowChanged
                    .applicationActivated
                    .applicationDeactivated
                    .valueChanged
                    .uiElementDestroyed
                    .selectedChildrenChanged
                    .selectedRowsChanged
                    .selectedColumnsChanged
                    .selectedTextChanged
                    .windowCreated
                    .windowDeminiaturized
                    .windowMiniaturized
                    .windowMoved
                    .windowResized
                    .drawerCreated
                    .sheetCreated
                    .rowExpanded
                    .rowCollapsed
                    .layoutChanged
                    .announcementRequested     // userInfo[.announcement]: String
                    """)
                }
            }
        }
    }

    // MARK: Types

    private var typesSection: some View {
        PageSection("Reference \u{2014} Attribute and Role Constants") {
            VStack(alignment: .leading, spacing: 16) {
                refBlock(
                    name: "NSAccessibility.Role",
                    kind: "struct (RawRepresentable)",
                    availability: "macOS 10.0+",
                    blurb: "The semantic role of an element. Used in accessibilityRole(). A small set of commonly used roles is listed below; the full list is in NSAccessibility.Role static properties."
                ) {
                    snippet("""
                    // Common roles:
                    NSAccessibility.Role.button
                    NSAccessibility.Role.radioButton
                    NSAccessibility.Role.checkBox
                    NSAccessibility.Role.slider
                    NSAccessibility.Role.textField
                    NSAccessibility.Role.staticText
                    NSAccessibility.Role.image
                    NSAccessibility.Role.group
                    NSAccessibility.Role.list
                    NSAccessibility.Role.table
                    NSAccessibility.Role.outline
                    NSAccessibility.Role.row
                    NSAccessibility.Role.column
                    NSAccessibility.Role.scrollArea
                    NSAccessibility.Role.scrollBar
                    NSAccessibility.Role.window
                    NSAccessibility.Role.popover
                    NSAccessibility.Role.progressIndicator
                    NSAccessibility.Role.link
                    NSAccessibility.Role.toolbar
                    NSAccessibility.Role.menuBar
                    NSAccessibility.Role.menu
                    NSAccessibility.Role.menuItem
                    NSAccessibility.Role.layoutArea
                    NSAccessibility.Role.layoutItem
                    NSAccessibility.Role.valueIndicator   // slider thumb

                    // Role description helpers:
                    NSAccessibility.Role.description(with: .button)   // -> "button"
                    NSAccessibility.Role.description(for: myView)     // -> platform description
                    """)
                }

                refBlock(
                    name: "NSAccessibility.Subrole",
                    kind: "struct (RawRepresentable)",
                    availability: "macOS 10.0+",
                    blurb: "Refines a role with a more specific semantic. Return from accessibilitySubrole() to give assistive technologies additional context."
                ) {
                    snippet("""
                    NSAccessibility.Subrole.closeButton
                    NSAccessibility.Subrole.minimizeButton
                    NSAccessibility.Subrole.zoomButton
                    NSAccessibility.Subrole.fullScreenButton
                    NSAccessibility.Subrole.toolbarButton
                    NSAccessibility.Subrole.secureTextField
                    NSAccessibility.Subrole.tableRow
                    NSAccessibility.Subrole.outlineRow
                    NSAccessibility.Subrole.expandedTreeItem
                    NSAccessibility.Subrole.collapsedTreeItem
                    NSAccessibility.Subrole.toggle
                    NSAccessibility.Subrole.descriptionList
                    NSAccessibility.Subrole.timelineElement
                    NSAccessibility.Subrole.contentList
                    """)
                }

                refBlock(
                    name: "NSAccessibility.Attribute",
                    kind: "struct (RawRepresentable)",
                    availability: "macOS 10.0+",
                    blurb: "Low-level attribute keys used by the NSAccessibilityProtocol value(forAttribute:) / setValue(_:forAttribute:) selectors (legacy API). Modern code uses the typed protocol methods instead."
                ) {
                    snippet("""
                    // Selected attributes (prefer typed protocol methods over these):
                    NSAccessibility.Attribute.role           // -> String
                    NSAccessibility.Attribute.title          // -> String
                    NSAccessibility.Attribute.description    // -> String (help text)
                    NSAccessibility.Attribute.value          // -> Any
                    NSAccessibility.Attribute.frame          // -> NSValue (NSRect)
                    NSAccessibility.Attribute.parent         // -> AnyObject
                    NSAccessibility.Attribute.children       // -> [AnyObject]
                    NSAccessibility.Attribute.enabled        // -> Bool
                    NSAccessibility.Attribute.focused        // -> Bool
                    NSAccessibility.Attribute.selected       // -> Bool
                    NSAccessibility.Attribute.expanded       // -> Bool
                    NSAccessibility.Attribute.minValue       // -> Any
                    NSAccessibility.Attribute.maxValue       // -> Any
                    NSAccessibility.Attribute.selectedText   // -> String
                    NSAccessibility.Attribute.selectedTextRange // -> NSValue (NSRange)
                    """)
                }

                refBlock(
                    name: "NSAccessibility.Action",
                    kind: "struct (RawRepresentable)",
                    availability: "macOS 10.0+",
                    blurb: "Named actions that assistive technologies can request. Override accessibilityActionNames() to advertise them and accessibilityPerformAction(_:) to execute them."
                ) {
                    snippet("""
                    NSAccessibility.Action.press          // click / activate
                    NSAccessibility.Action.increment      // stepper up / slider right
                    NSAccessibility.Action.decrement      // stepper down / slider left
                    NSAccessibility.Action.confirm        // accept / confirm
                    NSAccessibility.Action.cancel         // dismiss / cancel
                    NSAccessibility.Action.raise          // bring to front
                    NSAccessibility.Action.showMenu       // show popup menu
                    NSAccessibility.Action.pick           // select a list item
                    NSAccessibility.Action.delete         // delete item

                    // Action description:
                    NSAccessibility.Action.press.description   // "press"
                    """)
                }

                refBlock(
                    name: "NSAccessibilityOrientation / NSAccessibility.OrientationValue",
                    kind: "typealias struct / struct",
                    availability: "macOS 10.10+",
                    blurb: "Used to describe whether a control or layout is oriented horizontally or vertically. Return from accessibilityOrientation() in custom controls like sliders and split views."
                ) {
                    snippet("""
                    // NSAccessibilityOrientation wraps NSAccessibility.OrientationValue:
                    NSAccessibility.OrientationValue.horizontal
                    NSAccessibility.OrientationValue.vertical
                    NSAccessibility.OrientationValue.unknown
                    """)
                }

                refBlock(
                    name: "NSAccessibilitySortDirection / NSAccessibility.SortDirectionValue",
                    kind: "typealias / struct",
                    availability: "macOS 10.10+",
                    blurb: "Describes column sort direction for table accessibility. Return from accessibilitySortDirection() on column elements."
                ) {
                    snippet("""
                    NSAccessibility.SortDirectionValue.ascending
                    NSAccessibility.SortDirectionValue.descending
                    NSAccessibility.SortDirectionValue.unknown
                    """)
                }

                refBlock(
                    name: "NSAccessibilityUnits / NSAccessibilityRulerMarkerType",
                    kind: "typealias structs",
                    availability: "macOS 10.10+",
                    blurb: "Used in ruler/measurement accessibility contexts. NSAccessibilityUnits describes the unit (inches, centimeters, etc.). NSAccessibilityRulerMarkerType describes the type of ruler marker (tab, indent, etc.)."
                ) {
                    snippet("""
                    // NSAccessibilityUnits:
                    NSAccessibility.RulerUnitValue.inches
                    NSAccessibility.RulerUnitValue.centimeters
                    NSAccessibility.RulerUnitValue.points
                    NSAccessibility.RulerUnitValue.picas
                    NSAccessibility.RulerUnitValue.unknown

                    // NSAccessibilityRulerMarkerType:
                    NSAccessibility.RulerMarkerTypeValue.leftTabStop
                    NSAccessibility.RulerMarkerTypeValue.rightTabStop
                    NSAccessibility.RulerMarkerTypeValue.centerTabStop
                    NSAccessibility.RulerMarkerTypeValue.decimalTabStop
                    NSAccessibility.RulerMarkerTypeValue.headIndent
                    NSAccessibility.RulerMarkerTypeValue.tailIndent
                    NSAccessibility.RulerMarkerTypeValue.firstLineHeadIndent
                    NSAccessibility.RulerMarkerTypeValue.unknown
                    """)
                }
            }
        }
    }

    // MARK: Helper Functions

    private var helperFunctionsSection: some View {
        PageSection("Reference \u{2014} Helper Functions") {
            VStack(alignment: .leading, spacing: 16) {
                refBlock(
                    name: "Coordinate Conversion",
                    kind: "static functions on NSAccessibility",
                    availability: "macOS 10.10+",
                    blurb: "Convert view-local coordinates to screen coordinates for accessibilityFrame() implementations. Always report frames in screen coordinates to assistive technologies."
                ) {
                    snippet("""
                    // Rect in view-local coordinates → screen coordinates:
                    let screenRect = NSAccessibility.screenRect(fromView: self, rect: localRect)

                    // Point in view-local coordinates → screen coordinates:
                    let screenPt = NSAccessibility.screenPoint(fromView: self, point: localPoint)

                    // Usage in accessibilityFrame():
                    override func accessibilityFrame() -> NSRect {
                        return NSAccessibility.screenRect(fromView: self, rect: bounds)
                    }
                    """)
                }

                refBlock(
                    name: "Unignored Element Traversal",
                    kind: "static functions on NSAccessibility",
                    availability: "macOS 10.0+",
                    blurb: "Filter a view hierarchy to only elements that are visible to assistive technologies. NSView subclasses can set isAccessibilityElement = false to mark themselves as ignored; these functions skip ignored elements in traversal."
                ) {
                    snippet("""
                    // Remove ignored views from a children array:
                    let visible = NSAccessibility.unignoredChildren(from: subviews)

                    // For containers that have only one real child:
                    let visible = NSAccessibility.unignoredChildrenForOnlyChild(from: wrapperView)

                    // Descend into children to find the first non-ignored element:
                    let element = NSAccessibility.unignoredDescendant(of: containerView)

                    // Ascend to find the first non-ignored ancestor:
                    let ancestor = NSAccessibility.unignoredAncestor(of: innerView)
                    """)
                }
            }
        }
    }

    // MARK: Notes

    private var notesSection: some View {
        PageSection("Notes") {
            VStack(alignment: .leading, spacing: 12) {
                noteRow("ear", "Enable VoiceOver (Cmd+F5 or System Settings > Accessibility > VoiceOver) to test accessibility. Use the Accessibility Inspector app (Xcode > Open Developer Tool > Accessibility Inspector) for non-intrusive inspection.")
                noteRow("1.square", "NSAccessibilityProtocol is automatically satisfied by NSView. Override individual methods only where your view's behavior differs from the default (which usually reads the view's title/label property).")
                noteRow("2.square", "Use NSAccessibilityElement for sub-view regions — chart segments, custom list cells — that don't have a backing NSView. Return these objects from accessibilityChildren().")
                noteRow("3.square", "NSAccessibility.post(element:notification:) is the correct way to tell assistive technologies about changes. Call it after any state change that affects the element's value, selection, or structure.")
                noteRow("4.square", "Unignored traversal helpers filter out views where isAccessibilityElement == false or accessibilityIsIgnored() returns true. Use them in accessibilityChildren() to skip decorator views.")
                noteRow("lock.shield", "NSAccessibility.setMayContainProtectedContent(_:) tells the system the app may show sensitive data so screen-capture APIs can mask it appropriately.")
            }
        }
    }

    // MARK: Helpers

    private func noteRow(_ symbol: String, _ text: String) -> some View {
        Label(text, systemImage: symbol)
            .font(.callout).foregroundStyle(.secondary)
    }

    private func snippet(_ code: String) -> some View {
        Text(code)
            .font(.caption).fontDesign(.monospaced)
            .foregroundStyle(.primary)
            .textSelection(.enabled)
            .padding(12)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
            .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
    }

    private func refBlock<Content: View>(
        name: String,
        kind: String,
        availability: String,
        blurb: String,
        @ViewBuilder content: () -> Content
    ) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(alignment: .firstTextBaseline, spacing: 8) {
                Text(name).font(.headline).foregroundStyle(.primary)
                Text(kind).font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                Spacer()
                Text(availability).font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary)
            }
            Text(blurb).font(.callout).foregroundStyle(.secondary)
            content()
        }
        .padding(12)
        .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
        .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
    }
}

extension NSAccessibilityPage {
    @MainActor static let item = GalleryItem(
        id: "appkit.accessibilityForAppKit.nsAccessibility",
        title: "NSAccessibility",
        folder: "Accessibility for AppKit",
        framework: .appKit,
        absorbedSymbols: [
            "NSAccessibilityProtocol",
            "NSAccessibility",
            "NSAccessibilityElement",
            "NSAccessibilityElementProtocol",
            "NSAccessibilityButton",
            "NSAccessibilityRadioButton",
            "NSAccessibilitySwitch",
            "NSAccessibilityCheckBox",
            "NSAccessibilityStepper",
            "NSAccessibilitySlider",
            "NSAccessibilityGroup",
            "NSAccessibilityTable",
            "NSAccessibilityList",
            "NSAccessibilityOutline",
            "NSAccessibilityRow",
            "NSAccessibilityStaticText",
            "NSAccessibilityNavigableStaticText",
            "NSAccessibilityColor",
            "NSAccessibilityProgressIndicator",
            "NSAccessibilityElementLoading",
            "NSAccessibilityContainsTransientUI",
            "NSAccessibilityLayoutArea",
            "NSAccessibilityLayoutItem",
            "NSAccessibility.Action",
            "NSAccessibility.AnnotationAttributeKey",
            "NSAccessibilityAnnotationPosition",
            "NSAccessibility.Attribute",
            "NSAccessibility.FontAttributeKey",
            "NSAccessibilityOrientation",
            "NSAccessibility.OrientationValue",
            "NSAccessibility.ParameterizedAttribute",
            "NSAccessibility.Role",
            "NSAccessibilityRulerMarkerType",
            "NSAccessibility.RulerMarkerTypeValue",
            "NSAccessibility.RulerUnitValue",
            "NSAccessibility.SortDirectionValue",
            "NSAccessibilitySortDirection",
            "NSAccessibility.Subrole",
            "NSAccessibilityUnits",
            "NSAccessibility.Notification",
            "NSAccessibility.NotificationUserInfoKey"
        ],
        blurb: "NSAccessibility protocols, element types, notifications, attribute and role constants, and helper functions for building accessible custom AppKit views.",
        signature: "protocol NSAccessibilityProtocol + struct NSAccessibility",
        availability: "macOS 10.0+",
        docPath: "Documentation/AppKit/accessibility-for-appkit/nsaccessibility.md",
        page: { AnyView(NSAccessibilityPage()) }
    )
}

#Preview {
    NSAccessibilityPage().frame(width: 1100, height: 900)
}
