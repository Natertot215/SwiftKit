import SwiftUI

struct UserInterfaceSizeClassGalleryPage: View {
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    @Environment(\.verticalSizeClass) private var verticalSizeClass

    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            VariantTile(
                name: "Live horizontalSizeClass",
                api: "@Environment(\\.horizontalSizeClass) var hSizeClass"
            ) {
                Text(label(horizontalSizeClass))
                    .font(.title3)
                    .fontDesign(.monospaced)
                    .foregroundStyle(.primary)
            }

            VariantTile(
                name: "Live verticalSizeClass",
                api: "@Environment(\\.verticalSizeClass) var vSizeClass"
            ) {
                Text(label(verticalSizeClass))
                    .font(.title3)
                    .fontDesign(.monospaced)
                    .foregroundStyle(.primary)
            }

            ReferenceTile(
                name: "enum UserInterfaceSizeClass",
                signature: "@frozen enum UserInterfaceSizeClass  // .compact, .regular",
                note: "Cross-platform size hint. macOS windows are typically .regular; iPhone in portrait is .compact horizontally; iPad regularly is .regular both axes."
            )

            ReferenceTile(
                name: "horizontalSizeClass / verticalSizeClass",
                signature: "@Environment(\\.horizontalSizeClass) var hClass: UserInterfaceSizeClass?",
                note: "Optional in the environment — nil where the platform doesn't supply a size class. Treat nil as \"assume regular\" on macOS."
            )

            ReferenceTile(
                name: "Adaptive layout",
                signature: "if hClass == .compact { VStack { … } } else { HStack { … } }",
                note: "Common pattern: stack children vertically in compact width and horizontally in regular width. SwiftUI's ViewThatFits is often a cleaner alternative for two-way adaptive layouts."
            )

            ReferenceTile(
                name: "macOS note",
                signature: "macOS windows = .regular by default",
                note: "Resizing a macOS window doesn't normally change the size class — adopting size classes on macOS is mainly for code shared with iPad or iPhone targets."
            )
        }
    }

    private func label(_ value: UserInterfaceSizeClass?) -> String {
        switch value {
        case .compact: return ".compact"
        case .regular: return ".regular"
        case .none: return "nil"
        @unknown default: return "?"
        }
    }
}

extension UserInterfaceSizeClassGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.layout.userInterfaceSizeClass",
        title: "UserInterfaceSizeClass",
        folder: "Layout",
        framework: .swiftUI,
        absorbedSymbols: [
            "UserInterfaceSizeClass",
            "swiftui.layout-adjustments.userinterfacesizeclass",
        ],
        blurb: "An indication of the system's height- and width-based size class, surfaced via the horizontalSizeClass and verticalSizeClass environment values. macOS windows are typically .regular, but the type is useful for cross-platform views.",
        signature: "@frozen enum UserInterfaceSizeClass : Hashable, Sendable",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/layout-adjustments/userinterfacesizeclass.md",
        page: { AnyView(UserInterfaceSizeClassGalleryPage()) }
    )
}

#Preview {
    UserInterfaceSizeClassGalleryPage()
        .frame(width: 900, height: 700)
}
