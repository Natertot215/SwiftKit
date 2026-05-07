import SwiftUI

// DynamicTypeSize — environment-driven type-size step. Inject specific values
// via .dynamicTypeSize(_:); ScaledMetric scales numeric values alongside.

struct DynamicTypeSizeGalleryPage: View {
    @ScaledMetric(relativeTo: .body) private var iconSize: CGFloat = 24

    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            // MARK: Fixed sizes

            VariantTile(
                name: ".dynamicTypeSize(.xSmall)",
                api: ".dynamicTypeSize(.xSmall)"
            ) {
                Text("Aa")
                    .font(.body)
                    .dynamicTypeSize(.xSmall)
            }

            VariantTile(
                name: ".dynamicTypeSize(.small)",
                api: ".dynamicTypeSize(.small)"
            ) {
                Text("Aa")
                    .font(.body)
                    .dynamicTypeSize(.small)
            }

            VariantTile(
                name: ".dynamicTypeSize(.large)",
                api: ".dynamicTypeSize(.large)"
            ) {
                Text("Aa")
                    .font(.body)
                    .dynamicTypeSize(.large)
            }

            VariantTile(
                name: ".dynamicTypeSize(.xxxLarge)",
                api: ".dynamicTypeSize(.xxxLarge)"
            ) {
                Text("Aa")
                    .font(.body)
                    .dynamicTypeSize(.xxxLarge)
            }

            VariantTile(
                name: ".dynamicTypeSize(.accessibility3)",
                api: ".dynamicTypeSize(.accessibility3)"
            ) {
                Text("Aa")
                    .font(.body)
                    .dynamicTypeSize(.accessibility3)
            }

            // MARK: Range — caps growth

            VariantTile(
                name: ".dynamicTypeSize(.large ... .xxLarge)",
                api: ".dynamicTypeSize(.large ... .xxLarge)"
            ) {
                Text("Capped between Large and xxLarge")
                    .font(.body)
                    .dynamicTypeSize(.large ... .xxLarge)
            }

            // MARK: ScaledMetric

            VariantTile(
                name: "@ScaledMetric — non-text dimension",
                api: "@ScaledMetric(relativeTo: .body) var iconSize: CGFloat = 24"
            ) {
                HStack(spacing: 8) {
                    Image(systemName: "star.fill")
                        .resizable()
                        .frame(width: iconSize, height: iconSize)
                        .foregroundStyle(.tint)
                    Text("Icon: \(Int(iconSize))pt")
                        .font(.body)
                }
            }

            // MARK: Reference

            ReferenceTile(
                name: "DynamicTypeSize",
                signature: "enum DynamicTypeSize : Comparable, CaseIterable, Hashable, Sendable",
                note: "Cases: .xSmall, .small, .medium, .large (default), .xLarge, .xxLarge, .xxxLarge, .accessibility1...accessibility5. The accessibility5 cases are a separate, larger tier than the standard ones."
            )

            ReferenceTile(
                name: "dynamicTypeSize(_:)",
                signature: "func dynamicTypeSize(_ size: DynamicTypeSize) -> some View",
                note: "Injects a fixed DynamicTypeSize into the environment for this view's descendants. Doesn't change the system setting — it overrides what descendants read."
            )

            ReferenceTile(
                name: "dynamicTypeSize(_:) — range form",
                signature: "func dynamicTypeSize<T: RangeExpression>(_ range: T) -> some View where T.Bound == DynamicTypeSize",
                note: "Clamps the inherited Dynamic Type size to the supplied range. The user keeps their preference within the range; values outside it are clamped."
            )

            ReferenceTile(
                name: "@ScaledMetric",
                signature: "@propertyWrapper struct ScaledMetric<Value : BinaryFloatingPoint>",
                note: "Scales a numeric value with the active Dynamic Type size. Use it for icon sizes, paddings, or corner radii that should track the user's text preference. Specify `relativeTo:` to anchor scaling to a font text style."
            )

            ReferenceTile(
                name: "ContentSizeCategory",
                signature: "enum ContentSizeCategory",
                note: "Legacy enum that DynamicTypeSize replaced. Kept available for back-compat with code that read @Environment(\\.sizeCategory). New code should use DynamicTypeSize.",
                badge: "Legacy"
            )
        }
    }
}

extension DynamicTypeSizeGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.textInputAndOutput.dynamicTypeSize",
        title: "DynamicTypeSize",
        folder: "Text input and output",
        framework: .swiftUI,
        absorbedSymbols: [
            "swiftui.text-input-and-output.dynamictypesize",
            "swiftui.text-input-and-output.dynamictypesize(_:)",
            "swiftui.text-input-and-output.scaledmetric",
            "swiftui.text-input-and-output.contentsizecategory"
        ],
        blurb: "Dynamic Type sizing — the DynamicTypeSize enum, the dynamicTypeSize(_:) modifier, the ScaledMetric property wrapper, and the legacy ContentSizeCategory enum it replaced.",
        signature: "enum DynamicTypeSize · func dynamicTypeSize(_:) · @propertyWrapper struct ScaledMetric<Value>",
        availability: "macOS 12.0+",
        docPath: "Documentation/SwiftUI/text-input-and-output/dynamictypesize.md",
        page: { AnyView(DynamicTypeSizeGalleryPage()) }
    )
}

#Preview {
    DynamicTypeSizeGalleryPage()
        .frame(width: 900, height: 700)
}
