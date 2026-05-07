import SwiftUI

struct AppStoreOverlayGalleryPage: View {
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

extension AppStoreOverlayGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.technologySpecificViews.appStoreOverlay",
        title: "AppStoreOverlay",
        folder: "Technology-specific views",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/appStoreOverlay(isPresented:configuration:)"
        ],
        blurb: "StoreKit modifier that presents an App Store overlay for promoting another app from inside your app.",
        signature: nil,
        availability: nil,
        docPath: "Documentation/SwiftUI/technology-specific-views/appstoreoverlay(ispresented:configuration:).md",
        page: { AnyView(AppStoreOverlayGalleryPage()) }
    )
}

#Preview {
    AppStoreOverlayGalleryPage()
        .frame(width: 900, height: 700)
}
