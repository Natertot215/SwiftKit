import SwiftUI

// Describe-track page for SwiftUI Toolbar Supporting Types.
// Source: Documentation/SwiftUI/toolbars/
// macOS 11.0+. These are value/protocol types used to configure toolbar
// behavior — none render as standalone Views. Positional placements and
// ornament APIs are iOS/visionOS-only.

struct ToolbarTypesDescribePage: View {
    var body: some View {
        DescribePage(
            title: "Toolbar Supporting Types",
            docPath: "Documentation/SwiftUI/toolbars/",
            availability: "macOS 11.0+",
            blurb: """
            SwiftUI's toolbar API is built from a family of value/protocol types that configure items \
            rather than render them. ToolbarItemPlacement specifies where in the toolbar an item appears — \
            semantic placements (.primaryAction, .principal, .navigation) express intent and flex per \
            platform; positional placements (.topBarLeading, .bottomBar) pin to a specific region and are \
            iOS-only. ToolbarContent and ToolbarContentBuilder are the protocol/result-builder pair behind \
            toolbar(content:). CustomizableToolbarContent, ToolbarCustomizationBehavior, and \
            ToolbarCustomizationOptions govern per-item customizability for toolbar(id:content:). \
            ToolbarPlacement, ContentToolbarPlacement, and ToolbarRole describe the structural role of the \
            bar itself. ToolbarTitleDisplayMode, ToolbarLabelStyle, and SpacerSizing are style/sizing values \
            consumed by existing toolbar modifiers. ToolbarTitleMenu is toolbar-contextual content. \
            ToolbarDefaultItemKind names built-in items like .sidebarToggle. OrnamentAttachmentAnchor and \
            ornament(...) are visionOS-only. toolbarForegroundStyle is watchOS-only.
            """,
            signatures: [
                "ToolbarItem(placement: .primaryAction) { … }",
                "ToolbarItemPlacement — .automatic, .principal, .navigation, .primaryAction, .secondaryAction, .confirmationAction, .cancellationAction, .destructiveAction, .status",
                "protocol ToolbarContent",
                "@resultBuilder struct ToolbarContentBuilder",
                "protocol CustomizableToolbarContent",
                "ToolbarCustomizationBehavior — .automatic, .disabled, .reorderable",
                "ToolbarCustomizationOptions",
                "ToolbarPlacement, ContentToolbarPlacement",
                "ToolbarRole — .automatic, .browser, .editor, .navigationStack",
                "ToolbarTitleDisplayMode — .automatic, .inlineLarge, .large",
                "ToolbarTitleMenu",
                "SpacerSizing — .flexible, .fixed(…)",
                "ToolbarLabelStyle — environment style value",
                "ToolbarDefaultItemKind — .sidebarToggle, …",
                "ornament(visibility:attachmentAnchor:contentAlignment:ornament:) — visionOS only",
                "OrnamentAttachmentAnchor — visionOS only",
                "toolbarForegroundStyle(_:for:) — watchOS only",
                "SearchToolbarBehavior"
            ],
            notes: [
                "ToolbarItemPlacement is an enum value, not a View — it is passed to ToolbarItem(placement:).",
                "ToolbarContent and ToolbarContentBuilder are conformance targets, not standalone views.",
                "Positional placements (.topBarLeading, .topBarTrailing, .bottomBar, .keyboard, .bottomOrnament) are iOS/visionOS only.",
                "ornament(visibility:attachmentAnchor:contentAlignment:ornament:) is visionOS 1.0+ only."
            ]
        )
    }
}

#Preview {
    ToolbarTypesDescribePage()
        .frame(width: 900, height: 700)
}
