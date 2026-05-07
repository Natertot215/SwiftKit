import SwiftUI

struct AssistiveAccessGalleryPage: View {
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

extension AssistiveAccessGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.accessibility.assistiveAccess",
        title: "AssistiveAccess",
        folder: "Accessibility",
        framework: .swiftUI,
        absorbedSymbols: [
            "AssistiveAccess",
            "swiftui.accessible-appearance.assistiveaccess"
        ],
        blurb: "Configure how an app behaves under Assistive Access — the simplified system experience for users who benefit from a reduced interface.",
        signature: "struct AssistiveAccess",
        availability: "macOS 26.0+",
        docPath: "Documentation/SwiftUI/accessible-appearance/assistiveaccess.md",
        page: { AnyView(AssistiveAccessGalleryPage()) }
    )
}

#Preview {
    AssistiveAccessGalleryPage()
        .frame(width: 900, height: 700)
}
