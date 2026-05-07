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
            ReferenceTile(
                name: "Protocol declaration",
                signature: "protocol NSViewRepresentable : View where Self.Body == Never",
                note: "Wraps an NSView for use inside a SwiftUI view tree. Body is Never — the protocol's required methods replace it. Pair with an associated NSViewType."
            )

            ReferenceTile(
                name: "Required methods",
                signature: "func makeNSView(context: Context) -> Self.NSViewType  /  func updateNSView(_:context:)",
                note: "makeNSView constructs the view exactly once. updateNSView is called on every SwiftUI re-render — apply property changes, never allocate. Don't keep a reference to the NSView outside the conformance."
            )

            ReferenceTile(
                name: "Sizing",
                signature: "func sizeThatFits(_ proposal: ProposedViewSize, nsView: …, context: Context) -> CGSize?",
                note: "macOS 13+. Override sizing behavior to participate in SwiftUI's layout proposal/response cycle without relying solely on the wrapped NSView's intrinsicContentSize."
            )

            ReferenceTile(
                name: "Coordinator pattern",
                signature: "func makeCoordinator() -> Self.Coordinator",
                note: "Bridge AppKit target-action and delegate messages back to SwiftUI through an NSObject coordinator. Hold @Binding properties on the coordinator and write them from delegate callbacks."
            )

            ReferenceTile(
                name: "NSViewRepresentableContext",
                signature: "struct Context  // .coordinator, .environment, .transaction",
                note: "Passed into make/update. Read .environment to forward ambient SwiftUI values (.colorScheme, .layoutDirection) into the wrapped NSView's appearance API."
            )

            ReferenceTile(
                name: "Example skeleton",
                signature: "struct CodeEditorView: NSViewRepresentable { typealias NSViewType = NSScrollView; … }",
                note: "Use to embed AppKit views that have no SwiftUI equivalent — NSTextView with rich-text bindings, NSScrollView with custom rules, OpenGL/Metal views. Avoid for views that already have a SwiftUI primitive."
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
