import SwiftUI

struct NSViewControllerRepresentableGalleryPage: View {
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

extension NSViewControllerRepresentableGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.appKitIntegration.nsViewControllerRepresentable",
        title: "NSViewControllerRepresentable",
        folder: "AppKit integration",
        framework: .swiftUI,
        absorbedSymbols: [
            "NSViewControllerRepresentable",
            "NSViewControllerRepresentableContext"
        ],
        blurb: "A wrapper that you use to integrate an AppKit view controller into your SwiftUI interface. Implement makeNSViewController, updateNSViewController, and an optional Coordinator to facilitate target-action and delegate handoff.",
        signature: "protocol NSViewControllerRepresentable : View where Self.Body == Never",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/appkit-integration/nsviewcontrollerrepresentable.md",
        page: { AnyView(NSViewControllerRepresentableGalleryPage()) }
    )
}

#Preview {
    NSViewControllerRepresentableGalleryPage()
        .frame(width: 900, height: 700)
}
