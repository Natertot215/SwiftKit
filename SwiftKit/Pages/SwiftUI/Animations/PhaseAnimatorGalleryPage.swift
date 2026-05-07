import SwiftUI

struct PhaseAnimatorGalleryPage: View {
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

extension PhaseAnimatorGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.animations.phaseAnimator",
        title: "PhaseAnimator",
        folder: "Animations",
        framework: .swiftUI,
        absorbedSymbols: [
            "PhaseAnimator",
            "View/phaseAnimator(_:content:animation:)",
            "View/phaseAnimator(_:trigger:content:animation:)"
        ],
        blurb: "A container that animates its content by automatically cycling through a collection of phases that you provide, each defining a discrete step within an animation.",
        signature: "struct PhaseAnimator<Phase, Content> where Phase : Equatable, Content : View",
        availability: "macOS 14.0+",
        docPath: "Documentation/SwiftUI/animations/phaseanimator.md",
        page: { AnyView(PhaseAnimatorGalleryPage()) }
    )
}

#Preview {
    PhaseAnimatorGalleryPage()
        .frame(width: 900, height: 700)
}
