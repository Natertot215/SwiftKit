import SwiftUI

// AppKit Views and Controls / Controls describe page.
// Covers: NSCloudSharingValidation — a protocol that a Cloud-sharing
// toolbar item's target adopts to vend the active CKShare for an item.
// Source: Documentation/AppKit/views-and-controls/nscloudsharingvalidation.md

struct NSCloudSharingValidationDescribePage: View {
    var body: some View {
        DescribePage(
            title: "NSCloudSharingValidation",
            docPath: "Documentation/AppKit/views-and-controls/nscloudsharingvalidation.md",
            availability: "macOS",
            blurb: """
            A protocol that the target of a cloud-sharing toolbar item \
            adopts to supply the current CKShare for the item. AppKit \
            inspects the returned share to drive the item's appearance \
            (shared / not shared / participant) and to wire the \
            NSSharingServicePickerToolbarItem flow.

            Adopt on the target of the toolbar item that triggers a cloud \
            share — typically the document controller or window controller \
            that owns the currently visible record. Return the active \
            CKShare for the focused item, or nil when nothing is shared yet.

            This is a thin protocol — single method — but it's the system \
            hook that connects an NSToolbarItem-driven cloud share button \
            to the underlying CloudKit share state. Without it, the \
            standard cloud-sharing toolbar item has no way to know whether \
            the current item is already part of a share.
            """,
            signatures: [
                "protocol NSCloudSharingValidation : NSObjectProtocol",
                "func cloudShare(for item: NSValidatedUserInterfaceItem) -> CKShare?"
            ],
            notes: [
                "Protocol — nothing to render. Adopt on the toolbar item's target (typically NSWindowController or NSDocument).",
                "Pair with CloudKit (CKShare). The returned CKShare drives the cloud-sharing toolbar item's visual state — shared, owner, participant.",
                "The companion to NSToolbarItemValidation — same target-adopts-protocol pattern, different signal (CKShare instead of Bool enabled state)."
            ]
        )
    }
}

#Preview {
    NSCloudSharingValidationDescribePage()
        .frame(width: 900, height: 700)
}
