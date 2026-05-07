import SwiftUI

struct LayoutDirectionGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            VariantTile(
                name: ".leftToRight",
                api: ".environment(\\.layoutDirection, .leftToRight)"
            ) {
                directionBar()
                    .environment(\.layoutDirection, .leftToRight)
            }

            VariantTile(
                name: ".rightToLeft",
                api: ".environment(\\.layoutDirection, .rightToLeft)"
            ) {
                directionBar()
                    .environment(\.layoutDirection, .rightToLeft)
            }

            VariantTile(
                name: ".layoutDirectionBehavior(.fixed)",
                api: ".layoutDirectionBehavior(.fixed)"
            ) {
                directionBar()
                    .layoutDirectionBehavior(.fixed)
                    .environment(\.layoutDirection, .rightToLeft)
            }

            VariantTile(
                name: ".layoutDirectionBehavior(.mirrors)",
                api: ".layoutDirectionBehavior(.mirrors)"
            ) {
                directionBar()
                    .layoutDirectionBehavior(.mirrors)
                    .environment(\.layoutDirection, .rightToLeft)
            }

            ReferenceTile(
                name: "enum LayoutDirection",
                signature: "@frozen enum LayoutDirection : Hashable, CaseIterable, Sendable  // .leftToRight, .rightToLeft",
                note: "Read-only on most surfaces — the OS sets this from the user's preferred locale. Override via .environment(\\.layoutDirection, …) for previewing or for views that should always render in a fixed direction."
            )

            ReferenceTile(
                name: "LayoutDirectionBehavior",
                signature: "enum LayoutDirectionBehavior  // .mirrors (default), .fixed",
                note: "Per-view opt-in. .mirrors flips horizontal layout under right-to-left languages; .fixed keeps the original orientation regardless of environment."
            )

            ReferenceTile(
                name: "View modifier",
                signature: "func layoutDirectionBehavior(_ behavior: LayoutDirectionBehavior) -> some View",
                note: "Apply to subtrees whose mirroring should differ from the system default — branding marks, code blocks, and chronological timelines often want .fixed."
            )
        }
    }

    private func directionBar() -> some View {
        HStack(spacing: 6) {
            Image(systemName: "1.circle.fill")
            Image(systemName: "2.circle.fill")
            Image(systemName: "3.circle.fill")
            Image(systemName: "arrow.right")
        }
        .font(.title3)
        .foregroundStyle(.tint)
    }
}

extension LayoutDirectionGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.layout.layoutDirection",
        title: "LayoutDirection",
        folder: "Layout",
        framework: .swiftUI,
        absorbedSymbols: [
            "LayoutDirection",
            "LayoutDirectionBehavior",
            "View/layoutDirectionBehavior(_:)",
            "swiftui.layout-adjustments.layoutdirection",
            "swiftui.layout-adjustments.layoutdirectionbehavior",
            "swiftui.layout-adjustments.layoutdirectionbehavior(_:)",
        ],
        blurb: "The direction of the user's preferred reading order — leftToRight or rightToLeft — and the per-view behavior modifier that opts into mirroring or fixed orientation under right-to-left languages.",
        signature: "@frozen enum LayoutDirection : Hashable, CaseIterable, Sendable",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/layout-adjustments/layoutdirection.md",
        page: { AnyView(LayoutDirectionGalleryPage()) }
    )
}

#Preview {
    LayoutDirectionGalleryPage()
        .frame(width: 900, height: 700)
}
