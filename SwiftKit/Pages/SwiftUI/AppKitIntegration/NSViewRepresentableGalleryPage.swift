import SwiftUI

struct NSViewRepresentableGalleryPage: View {
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

extension NSViewRepresentableGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.appKitIntegration.nsViewRepresentable",
        title: "NSViewRepresentable",
        folder: "AppKit integration",
        framework: .swiftUI,
        absorbedSymbols: [
            "NSViewRepresentable",
            "NSViewRepresentableContext"
        ],
        blurb: "A wrapper that you use to integrate an AppKit view into your SwiftUI view hierarchy. Implement makeNSView, updateNSView, and an optional Coordinator to bridge target-action and delegate messages.",
        signature: "protocol NSViewRepresentable : View where Self.Body == Never",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/appkit-integration/nsviewrepresentable.md",
        page: { AnyView(NSViewRepresentableGalleryPage()) }
    )
}

#Preview {
    NSViewRepresentableGalleryPage()
        .frame(width: 900, height: 700)
}
