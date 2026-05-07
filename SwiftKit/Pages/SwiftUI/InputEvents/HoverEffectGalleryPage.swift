import SwiftUI

struct HoverEffectGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            VariantTile(
                name: ".hoverEffect()",
                api: ".hoverEffect()"
            ) {
                Capsule()
                    .fill(Color.accentColor.opacity(0.25))
                    .frame(width: 120, height: 36)
                    .overlay(
                        Text("Hover me")
                            .font(.callout)
                            .foregroundStyle(.secondary)
                    )
                    .hoverEffect()
            }

            VariantTile(
                name: ".hoverEffect(.automatic)",
                api: ".hoverEffect(.automatic)"
            ) {
                Capsule()
                    .fill(Color.accentColor.opacity(0.25))
                    .frame(width: 120, height: 36)
                    .overlay(
                        Text(".automatic")
                            .font(.callout)
                            .foregroundStyle(.secondary)
                    )
                    .hoverEffect(.automatic)
            }

            VariantTile(
                name: ".hoverEffect(.highlight)",
                api: ".hoverEffect(.highlight)"
            ) {
                Capsule()
                    .fill(Color.accentColor.opacity(0.25))
                    .frame(width: 120, height: 36)
                    .overlay(
                        Text(".highlight")
                            .font(.callout)
                            .foregroundStyle(.secondary)
                    )
                    .hoverEffect(.highlight)
            }

            VariantTile(
                name: ".hoverEffect(.lift)",
                api: ".hoverEffect(.lift)"
            ) {
                Capsule()
                    .fill(Color.accentColor.opacity(0.25))
                    .frame(width: 120, height: 36)
                    .overlay(
                        Text(".lift")
                            .font(.callout)
                            .foregroundStyle(.secondary)
                    )
                    .hoverEffect(.lift)
            }

            ReferenceTile(
                name: "HoverEffect",
                signature: "struct HoverEffect  ·  .automatic  ·  .highlight  ·  .lift",
                note: "Built-in hover effect styles. .automatic resolves per-platform; .highlight applies a tinted overlay; .lift pushes the view forward in the visual stack on hover."
            )

            ReferenceTile(
                name: "View.hoverEffect(_:isEnabled:)",
                signature: "func hoverEffect(_ effect: HoverEffect = .automatic, isEnabled: Bool = true) -> some View",
                note: "Apply a hover effect with an optional enable flag. When isEnabled is false the effect is suppressed without removing the modifier."
            )

            ReferenceTile(
                name: "View.hoverEffect(_:in:isEnabled:)",
                signature: "func hoverEffect<S>(_ effect: HoverEffect, in shape: S, isEnabled: Bool) -> some View where S : Shape",
                note: "Constrains the hover effect to a custom shape — useful when the visible content is irregular and the effect should match its silhouette."
            )

            ReferenceTile(
                name: "View.hoverEffect(in:isEnabled:body:)",
                signature: "func hoverEffect<S, V>(in shape: S, isEnabled: Bool, body: …) -> some View",
                note: "Builder-form overload that lets you author a fully custom hover transition by mapping the effect's progress and phase into your own visual."
            )

            ReferenceTile(
                name: "View.hoverEffectDisabled(_:)",
                signature: "func hoverEffectDisabled(_ disabled: Bool = true) -> some View",
                note: "Disables hover effects for the view and its descendants. Use to opt subtrees out of an effect applied higher up the hierarchy."
            )

            ReferenceTile(
                name: "View.defaultHoverEffect(_:)",
                signature: "func defaultHoverEffect(_ effect: HoverEffect?) -> some View",
                note: "Sets the hover effect that descendants inherit when they don't specify one. Pass nil to clear an inherited default."
            )

            ReferenceTile(
                name: "CustomHoverEffect / ContentHoverEffect",
                signature: "protocol CustomHoverEffect  ·  protocol ContentHoverEffect  ·  HoverEffectContent",
                note: "Author your own hover effect by conforming to CustomHoverEffect and returning a HoverEffectContent. ContentHoverEffect is the lower-level view-builder form."
            )

            ReferenceTile(
                name: "HoverEffectGroup family",
                signature: "View.hoverEffectGroup()  ·  .hoverEffectGroup(_:)  ·  .hoverEffectGroup(id:in:behavior:)  ·  GroupHoverEffect",
                note: "Coordinates multi-view hover behavior — hovering one member can trigger effects on the rest of the group. id+namespace overload uses the same matched-geometry pattern as transitions."
            )

            ReferenceTile(
                name: "HoverEffectPhaseOverride",
                signature: "struct HoverEffectPhaseOverride",
                note: "Lets a view force the hover effect into a specific phase (e.g. always-active) regardless of pointer state. Useful for selected items in lists where you want to mimic hover styling."
            )

            ReferenceTile(
                name: "OrnamentHoverEffect / OrnamentHoverContentEffect",
                signature: "OrnamentHoverEffect  ·  OrnamentHoverContentEffect",
                note: "Hover effect variants tuned for ornament UI (visionOS toolbars and floating UI). Surfaced cross-platform for shared code paths."
            )

            ReferenceTile(
                name: "EmptyHoverEffectContent",
                signature: "struct EmptyHoverEffectContent : HoverEffectContent",
                note: "An empty-content placeholder used by builder-form overloads when a branch returns no visual change."
            )
        }
    }
}

extension HoverEffectGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.inputEvents.hoverEffect",
        title: "HoverEffect",
        folder: "Input events",
        framework: .swiftUI,
        absorbedSymbols: [
            "HoverEffect",
            "View/hoverEffect(_:)",
            "View/hoverEffect(_:isEnabled:)",
            "View/hoverEffect(_:in:isEnabled:)",
            "View/hoverEffect(in:isEnabled:body:)",
            "View/hoverEffectDisabled(_:)",
            "View/defaultHoverEffect(_:)",
            "HoverEffectPhaseOverride",
            "OrnamentHoverContentEffect",
            "OrnamentHoverEffect",
            "CustomHoverEffect",
            "ContentHoverEffect",
            "HoverEffectGroup",
            "View/hoverEffectGroup()",
            "View/hoverEffectGroup(_:)",
            "View/hoverEffectGroup(id:in:behavior:)",
            "GroupHoverEffect",
            "HoverEffectContent",
            "EmptyHoverEffectContent"
        ],
        blurb: "Visual effects applied while the pointer hovers over a view. Built-in effects (.automatic, .highlight, .lift) plus the CustomHoverEffect protocol and the HoverEffectGroup family for coordinated, multi-view hover behavior.",
        signature: "struct HoverEffect",
        availability: "macOS 13.0+",
        docPath: "Documentation/SwiftUI/input-events/hovereffect.md",
        page: { AnyView(HoverEffectGalleryPage()) }
    )
}

#Preview {
    HoverEffectGalleryPage()
        .frame(width: 900, height: 700)
}
