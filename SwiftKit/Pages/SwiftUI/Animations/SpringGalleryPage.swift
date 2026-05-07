import SwiftUI

struct SpringGalleryPage: View {
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

extension SpringGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.animations.spring",
        title: "Spring",
        folder: "Animations",
        framework: .swiftUI,
        absorbedSymbols: ["Spring"],
        blurb: "A representation of a spring's motion. Spring describes a damped harmonic oscillator the system uses to drive natural-feeling animations defined by response, damping, and blend duration.",
        signature: "struct Spring",
        availability: "macOS 14.0+",
        docPath: "Documentation/SwiftUI/animations/spring.md",
        page: { AnyView(SpringGalleryPage()) }
    )
}

#Preview {
    SpringGalleryPage()
        .frame(width: 900, height: 700)
}
