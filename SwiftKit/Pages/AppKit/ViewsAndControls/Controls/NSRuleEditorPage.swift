import SwiftUI

struct NSRuleEditorPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            ContentUnavailableView(
                "In progress",
                systemImage: "hammer",
                description: Text("This page is awaiting tile content.")
            )
        }
    }
}

extension NSRuleEditorPage {
    @MainActor static let item = GalleryItem(
        id: "appkit.viewsAndControls.nsRuleEditor",
        title: "NSRuleEditor",
        folder: "Views and controls",
        framework: .appKit,
        absorbedSymbols: [
            "NSRuleEditor"
        ],
        blurb: "A control for displaying and editing a list of rule rows, each row composed of popups and other field types that build up a compound predicate.",
        signature: "class NSRuleEditor : NSControl",
        availability: "macOS 10.5+",
        docPath: "Documentation/AppKit/views-and-controls/nsruleeditor.md",
        page: { AnyView(NSRuleEditorPage()) }
    )
}

#Preview {
    NSRuleEditorPage()
        .frame(width: 900, height: 700)
}
