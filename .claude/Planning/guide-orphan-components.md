# Guide-Only Components — Phase 0b Cross-Check

Components mentioned in archived guide articles whose only documentation home is the guide itself — no corresponding type-doc found in `Documentation/SwiftUI/` or `Documentation/AppKit/` (post-archive).

## How Phase 1 sort agents should use this

For each entry below, decide one of:

1. **Promote to a tile** in an existing or new gallery page (preferred when the type is a real macOS-relevant primitive).
2. **Defer** — note in the Phase 1 sort-decisions log and skip; the type will not appear in the gallery MVP.
3. **Out-of-scope** — type belongs to a non-macOS platform (UIKit, WatchKit, MapKit, Wallet, etc.) or to a non-UI framework (StoreKit, AppIntents, Foundation). Skip entirely.

The agents that produced these lists ran heuristic name-matching, not semantic analysis. Some entries are noise; some entries (e.g. `LinearGradient`) are real SwiftUI types whose doc was missed by the heuristic. Verify with `find-docs` or grep before deciding.

---

## SwiftUI

Five candidates without `[non-SwiftUI]` mark are real SwiftUI types — verify their location and route them to the right page.

- `CaptionTextFormat` — referenced in [Reducing view modifier maintenance](https://developer.apple.com/documentation/swiftui/reducing-view-modifier-maintenance)
- `DragState` — referenced in [Composing SwiftUI gestures](https://developer.apple.com/documentation/swiftui/composing-swiftui-gestures)
- `LinearGradient` — referenced in [Laying out a simple view](https://developer.apple.com/documentation/swiftui/laying-out-a-simple-view)
- `TransferRepresentation` — referenced in [Making a view into a drag source](https://developer.apple.com/documentation/swiftui/making-a-view-into-a-drag-source)
- `Transferable` — referenced in [Adopting drag and drop using SwiftUI](https://developer.apple.com/documentation/swiftui/adopting-drag-and-drop-using-swiftui), [Making a view into a drag source](https://developer.apple.com/documentation/swiftui/making-a-view-into-a-drag-source), [SwiftUI Updates](https://developer.apple.com/documentation/updates/swiftui)

**Out-of-scope (do not promote):**

- `AppDelegate` [non-SwiftUI — UIKit/AppKit] — referenced in [Migrating to the SwiftUI life cycle](https://developer.apple.com/documentation/swiftui/migrating-to-the-swiftui-life-cycle)
- `AppIntent` [non-SwiftUI — AppIntents framework] — referenced in [SwiftUI Updates](https://developer.apple.com/documentation/updates/swiftui)
- `AttributedString` [non-SwiftUI — Foundation] — referenced in [SwiftUI Updates](https://developer.apple.com/documentation/updates/swiftui)
- `Model3D` [non-SwiftUI — RealityKit] — referenced in [SwiftUI Updates](https://developer.apple.com/documentation/updates/swiftui)
- `SubscriptionStoreView` [non-SwiftUI — StoreKit] — referenced in [Backyard Birds: Building an app with SwiftData and widgets](https://developer.apple.com/documentation/swiftui/backyard-birds-sample)

> **Note re: 5 method docs.** Phase 0b's mechanical pass also matched 5 method-doc files whose frontmatter incorrectly carries `kind: article` (`copyable(_:)`, `cuttable(for:action:)`, `pastedestination(for:action:validator:)`, `focused(_:equals:)`, `prefersdefaultfocus(_:in:)`). The controller restored these to their original `Documentation/SwiftUI/clipboard/` and `Documentation/SwiftUI/focus/` locations during the merge step — they are tile candidates available for the SwiftUI sort agent in their normal type-doc tree, not orphans.

---

## AppKit

- `NSAccessibilityElement` — referenced in [Custom Controls](https://developer.apple.com/documentation/appkit/custom-controls)
- `NSAttributedString` — referenced in [Supporting Writing Tools via the pasteboard](https://developer.apple.com/documentation/appkit/supporting-writing-tools-via-the-pasteboard)
- `NSCoder` — referenced in [Restoring Your App's State with AppKit](https://developer.apple.com/documentation/appkit/restoring-your-app-s-state-with-appkit)
- `NSHostingMenu` — referenced in [Updates to AppKit](https://developer.apple.com/documentation/updates/appkit)
- `NSMenuItemImportFromDeviceIdentifier` — referenced in [Supporting Continuity Camera in Your Mac App](https://developer.apple.com/documentation/appkit/supporting-continuity-camera-in-your-mac-app)
- `NSRestorableState` — referenced in [Organize Your User Interface with a Stack View](https://developer.apple.com/documentation/appkit/organize-your-user-interface-with-a-stack-view)
- `NSSplitViewItemAccessoryViewController` — referenced in [Updates to AppKit](https://developer.apple.com/documentation/updates/appkit)
- `NSViewContentSelectionInfo` — referenced in [Supporting Writing Tools via the pasteboard](https://developer.apple.com/documentation/appkit/supporting-writing-tools-via-the-pasteboard)
- `NSWindows` — referenced in [Updates to AppKit](https://developer.apple.com/documentation/updates/appkit) *(likely a typo in the source for `NSWindow`; confirm)*

---

## HIG

68 candidates flagged. The HIG corpus references types from many cross-platform frameworks (UIKit, WatchKit, MapKit, Wallet, Game Controller, AccessibilityNotification, Sign-in-with-Apple buttons, etc.). The vast majority are out-of-scope for a macOS-focused gallery. The few that may warrant macOS tile homes are flagged by *italics* below — verify each.

- `ASAuthorizationAppleIDButton` — referenced in [Sign in with Apple](https://developer.apple.com/design/human-interface-guidelines/sign-in-with-apple)
- `AVCaptureControl` — referenced in [Camera Control](https://developer.apple.com/design/human-interface-guidelines/camera-control)
- `AVPlayerViewController` — referenced in [Playing video](https://developer.apple.com/design/human-interface-guidelines/playing-video)
- `AccessibilityNotification` — referenced in [VoiceOver](https://developer.apple.com/design/human-interface-guidelines/voiceover)
- `AddOrderToWalletButton` — referenced in [Wallet](https://developer.apple.com/design/human-interface-guidelines/wallet)
- `ApplePayPaymentOrderDetails` — referenced in [Wallet](https://developer.apple.com/design/human-interface-guidelines/wallet)
- `CLLocationButton` — referenced in [Privacy](https://developer.apple.com/design/human-interface-guidelines/privacy)
- `CSImportExtension` — referenced in [Searching](https://developer.apple.com/design/human-interface-guidelines/searching)
- `GCControllerElement` — referenced in [Game controls](https://developer.apple.com/design/human-interface-guidelines/game-controls)
- `GCRequiresControllerUserInteraction` — referenced in [Game controls](https://developer.apple.com/design/human-interface-guidelines/game-controls)
- `INImage` — referenced in [Siri](https://developer.apple.com/design/human-interface-guidelines/siri)
- `INParameter` — referenced in [Siri](https://developer.apple.com/design/human-interface-guidelines/siri)
- `INPlayMediaIntent` — referenced in [Siri](https://developer.apple.com/design/human-interface-guidelines/siri)
- `INSendMessageIntent` — referenced in [Siri](https://developer.apple.com/design/human-interface-guidelines/siri)
- `LocationButton` — referenced in [Privacy](https://developer.apple.com/design/human-interface-guidelines/privacy)
- `MKAnnotationView` — referenced in [Maps](https://developer.apple.com/design/human-interface-guidelines/maps)
- `MKMapFeatureOptions` — referenced in [Maps](https://developer.apple.com/design/human-interface-guidelines/maps)
- `MKOverlayLevel` — referenced in [Maps](https://developer.apple.com/design/human-interface-guidelines/maps)
- `MapItemDetailPresentationStyle` — referenced in [Maps](https://developer.apple.com/design/human-interface-guidelines/maps)
- `MapItemDetailSelectionAccessoryStyle` — referenced in [Maps](https://developer.apple.com/design/human-interface-guidelines/maps)
- `MobileDriversLicenseDataRequest` — referenced in [ID Verifier](https://developer.apple.com/design/human-interface-guidelines/id-verifier)
- `MobileDriversLicenseDisplayRequest` — referenced in [ID Verifier](https://developer.apple.com/design/human-interface-guidelines/id-verifier)
- `MobileDriversLicenseRawDataRequest` — referenced in [ID Verifier](https://developer.apple.com/design/human-interface-guidelines/id-verifier)
- `NSAccessibilityCustomRotor` — referenced in [VoiceOver](https://developer.apple.com/design/human-interface-guidelines/voiceover)
- `PKAddPassButton` — referenced in [Wallet](https://developer.apple.com/design/human-interface-guidelines/wallet)
- `PKAddPassesViewController` — referenced in [Wallet](https://developer.apple.com/design/human-interface-guidelines/wallet)
- `PKIdentityIntentToStore` — referenced in [Wallet](https://developer.apple.com/design/human-interface-guidelines/wallet)
- `PKPaymentOrderDetails` — referenced in [Wallet](https://developer.apple.com/design/human-interface-guidelines/wallet)
- `PlaceDetail` — referenced in [Maps](https://developer.apple.com/design/human-interface-guidelines/maps)
- `PlaceSelectionAccessoryStyle` — referenced in [Maps](https://developer.apple.com/design/human-interface-guidelines/maps)
- `ReadError` — referenced in [Tap to Pay on iPhone](https://developer.apple.com/design/human-interface-guidelines/tap-to-pay-on-iphone)
- *`RequestReviewAction`* — referenced in [Ratings and reviews](https://developer.apple.com/design/human-interface-guidelines/ratings-and-reviews) *(SwiftUI environment action — verify)*
- `SpatialTemplatePreference` — referenced in [SharePlay](https://developer.apple.com/design/human-interface-guidelines/shareplay)
- *`SymbolEffect`* — referenced in [SF Symbols](https://developer.apple.com/design/human-interface-guidelines/sf-symbols) *(may be a SwiftUI type; verify against `Documentation/SwiftUI/`)*
- *`SymbolScale`* — referenced in [SF Symbols](https://developer.apple.com/design/human-interface-guidelines/sf-symbols) *(verify)*
- `SystemCoordinator` — referenced in [SharePlay](https://developer.apple.com/design/human-interface-guidelines/shareplay)
- `TVDigitEntryViewController` — referenced in [Digit entry views](https://developer.apple.com/design/human-interface-guidelines/digit-entry-views)
- `TouchController` — referenced in [Game controls](https://developer.apple.com/design/human-interface-guidelines/game-controls)
- `UIAccessibilityCustomRotor` — referenced in [VoiceOver](https://developer.apple.com/design/human-interface-guidelines/voiceover)
- `UIBackgroundExtensionView` — referenced in [Layout](https://developer.apple.com/design/human-interface-guidelines/layout)
- `UIBandSelectionInteraction` — referenced in [Pointing devices](https://developer.apple.com/design/human-interface-guidelines/pointing-devices)
- `UIBlurEffect` — referenced in [Materials](https://developer.apple.com/design/human-interface-guidelines/materials)
- `UICollectionView` — referenced in [Focus and selection](https://developer.apple.com/design/human-interface-guidelines/focus-and-selection)
- `UICollectionViewCell` — referenced in [Focus and selection](https://developer.apple.com/design/human-interface-guidelines/focus-and-selection)
- `UICollectionViewFlowLayout` — referenced in [Layout](https://developer.apple.com/design/human-interface-guidelines/layout)
- `UIColor` — referenced in [Color](https://developer.apple.com/design/human-interface-guidelines/color)
- `UIColorPickerViewController` — referenced in [Color wells](https://developer.apple.com/design/human-interface-guidelines/color-wells)
- `UIColorWell` — referenced in [Color wells](https://developer.apple.com/design/human-interface-guidelines/color-wells)
- `UICommand` — referenced in [Mac Catalyst](https://developer.apple.com/design/human-interface-guidelines/mac-catalyst)
- `UIFeedbackGenerator` — referenced in [Playing haptics](https://developer.apple.com/design/human-interface-guidelines/playing-haptics)
- `UIFocusGroupPriority` — referenced in [Focus and selection](https://developer.apple.com/design/human-interface-guidelines/focus-and-selection)
- `UIFocusHaloEffect` — referenced in [Focus and selection](https://developer.apple.com/design/human-interface-guidelines/focus-and-selection)
- `UIFontDescriptor` — referenced in [Typography](https://developer.apple.com/design/human-interface-guidelines/typography)
- `UIKeyCommand` — referenced in [Mac Catalyst](https://developer.apple.com/design/human-interface-guidelines/mac-catalyst)
- `UILayoutGuide` — referenced in [Layout](https://developer.apple.com/design/human-interface-guidelines/layout)
- `UIMenuBuilder` — referenced in [Mac Catalyst](https://developer.apple.com/design/human-interface-guidelines/mac-catalyst)
- `UIPointerAccessory` — referenced in [Pointing devices](https://developer.apple.com/design/human-interface-guidelines/pointing-devices)
- `UIPrintInteractionController` — referenced in [Printing](https://developer.apple.com/design/human-interface-guidelines/printing)
- `UIStepper` — referenced in [Steppers](https://developer.apple.com/design/human-interface-guidelines/steppers)
- `UITouch` — referenced in [Gestures](https://developer.apple.com/design/human-interface-guidelines/gestures)
- `UIVibrancyEffect` — referenced in [Materials](https://developer.apple.com/design/human-interface-guidelines/materials)
- `UIVisualEffectView` — referenced in [Materials](https://developer.apple.com/design/human-interface-guidelines/materials)
- `VerifyIdentityWithWalletButton` — referenced in [Wallet](https://developer.apple.com/design/human-interface-guidelines/wallet)
- `VideoPlayer` — referenced in [Playing video](https://developer.apple.com/design/human-interface-guidelines/playing-video)
- `WKHapticType` — referenced in [Playing haptics](https://developer.apple.com/design/human-interface-guidelines/playing-haptics)
- `WKInterfaceAuthorizationAppleIDButton` — referenced in [Sign in with Apple](https://developer.apple.com/design/human-interface-guidelines/sign-in-with-apple)
- `WKInterfaceMap` — referenced in [Maps](https://developer.apple.com/design/human-interface-guidelines/maps)
- `WKWebView` — referenced in [Web views](https://developer.apple.com/design/human-interface-guidelines/web-views)
