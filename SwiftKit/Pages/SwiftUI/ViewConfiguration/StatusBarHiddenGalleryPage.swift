import SwiftUI

struct StatusBarHiddenGalleryPage: View {
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

extension StatusBarHiddenGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.viewConfiguration.statusBarHidden",
        title: "StatusBarHidden",
        folder: "View configuration",
        framework: .swiftUI,
        absorbedSymbols: ["View/statusBarHidden(_:)"],
        blurb: "Sets the visibility of the status bar. iOS / iPadOS / visionOS only — macOS does not present a system status bar in app windows.",
        signature: "func statusBarHidden(_ hidden: Bool = true) -> some View",
        availability: "iOS 13.0+ (no macOS support)",
        docPath: "Documentation/SwiftUI/view-configuration/statusbarhidden(_:).md",
        page: { AnyView(StatusBarHiddenGalleryPage()) }
    )
}

#Preview {
    StatusBarHiddenGalleryPage()
        .frame(width: 900, height: 700)
}
