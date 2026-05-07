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
            ReferenceTile(
                name: "Protocol declaration",
                signature: "protocol NSViewControllerRepresentable : View where Self.Body == Never",
                note: "Wraps an NSViewController for use inside a SwiftUI view tree. Body is Never — the protocol's required methods replace it. Pair with an associated NSViewControllerType."
            )

            ReferenceTile(
                name: "Required methods",
                signature: "func makeNSViewController(context: Context) -> Self.NSViewControllerType  /  func updateNSViewController(_:context:)",
                note: "makeNSViewController is called once to construct the controller. updateNSViewController is called on every SwiftUI invalidation — push state in here, never read SwiftUI state in the controller's lifecycle."
            )

            ReferenceTile(
                name: "Coordinator",
                signature: "func makeCoordinator() -> Self.Coordinator",
                note: "Optional. Returns an NSObject that bridges target-action and delegate messages back to SwiftUI. The coordinator is the canonical place to expose @Binding writes from AppKit callbacks."
            )

            ReferenceTile(
                name: "NSViewControllerRepresentableContext",
                signature: "struct Context  // .coordinator, .environment, .transaction",
                note: "Passed into make/update. Read .environment for ambient values (colorScheme, locale, layoutDirection) and forward them to the wrapped controller; .coordinator is your bridge object."
            )

            ReferenceTile(
                name: "Example skeleton",
                signature: "struct PrintingPanel: NSViewControllerRepresentable { typealias NSViewControllerType = NSPrintPanel; … }",
                note: "Use to embed AppKit controllers that have no SwiftUI equivalent — print panel, preview controllers, scene-kit / metal-view controllers. Don't reach for it for views that already have a SwiftUI primitive."
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
