import SwiftUI

struct PrivacySensitiveGalleryPage: View {
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

extension PrivacySensitiveGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.viewConfiguration.privacySensitive",
        title: "PrivacySensitive",
        folder: "View configuration",
        framework: .swiftUI,
        absorbedSymbols: ["View/privacySensitive(_:)"],
        blurb: "Marks a view as containing sensitive user data. The system redacts the marked subtree whenever RedactionReasons.privacy is active — for example during AirPlay, screen recording, or when the user lowers the device.",
        signature: "func privacySensitive(_ sensitive: Bool = true) -> some View",
        availability: "macOS 12.0+",
        docPath: "Documentation/SwiftUI/view-configuration/privacysensitive(_:).md",
        page: { AnyView(PrivacySensitiveGalleryPage()) }
    )
}

#Preview {
    PrivacySensitiveGalleryPage()
        .frame(width: 900, height: 700)
}
