import SwiftUI

// SwiftUI `View/materialActiveAppearance(_:)` reference page.
// Source: Documentation/SwiftUI/drawing-and-graphics/materialactiveappearance(_:).md
// macOS 15.0+. Sets explicit active appearance for materials in the subtree.
// (Materials default to switching to inactive when their containing window deactivates.)

struct MaterialActiveAppearancePage: View {
    var body: some View {
        GalleryPageScaffold {
            header
        } defaultRender: {
            defaultDemo
        } variants: {
            variantsContent
        } states: {
            statesContent
        } notes: {
            notesContent
        }
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("View/materialActiveAppearance(_:)")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("Sets an explicit active appearance for materials in this view, overriding the default window-tracking behavior.")
                .font(.callout).foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/drawing-and-graphics/materialactiveappearance(_:).md · macOS 15.0+")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 16) {
                materialChip(title: ".active", appearance: .active)
                materialChip(title: ".inactive", appearance: .inactive)
                materialChip(title: ".automatic", appearance: .automatic)
            }
            .padding(20)
            .background(
                LinearGradient(colors: [.purple, .pink, .orange], startPoint: .topLeading, endPoint: .bottomTrailing),
                in: RoundedRectangle(cornerRadius: 14)
            )
            APICallout(".materialActiveAppearance(.active)  // .inactive · .automatic")
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            MAVariantRow(title: "On a regular Material") {
                HStack(spacing: 16) {
                    materialChip(title: "active", appearance: .active, material: .regularMaterial)
                    materialChip(title: "inactive", appearance: .inactive, material: .regularMaterial)
                }
                .padding(20)
                .background(
                    LinearGradient(colors: [.indigo, .blue, .teal], startPoint: .topLeading, endPoint: .bottomTrailing),
                    in: RoundedRectangle(cornerRadius: 14)
                )
            }

            MAVariantRow(title: "On a thin Material") {
                HStack(spacing: 16) {
                    materialChip(title: "active", appearance: .active, material: .thinMaterial)
                    materialChip(title: "inactive", appearance: .inactive, material: .thinMaterial)
                }
                .padding(20)
                .background(
                    LinearGradient(colors: [.green, .yellow], startPoint: .topLeading, endPoint: .bottomTrailing),
                    in: RoundedRectangle(cornerRadius: 14)
                )
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        MAVariantRow(title: "Default vs forced .active") {
            VStack(alignment: .leading, spacing: 8) {
                Text("By default a window-container material picks up the window's active state. Use .active to keep it bright regardless.")
                    .font(.callout).foregroundStyle(.secondary)
                HStack(spacing: 16) {
                    Text("default").padding().background(.regularMaterial, in: RoundedRectangle(cornerRadius: 10))
                    Text(".active").padding().background(.regularMaterial, in: RoundedRectangle(cornerRadius: 10))
                        .materialActiveAppearance(.active)
                }
                .padding(20)
                .background(
                    LinearGradient(colors: [.red, .orange], startPoint: .topLeading, endPoint: .bottomTrailing),
                    in: RoundedRectangle(cornerRadius: 14)
                )
            }
        }
    }

    private func materialChip(title: String, appearance: MaterialActiveAppearance, material: Material = .regularMaterial) -> some View {
        Text(title)
            .font(.callout).fontDesign(.monospaced)
            .padding(.horizontal, 14).padding(.vertical, 10)
            .background(material, in: Capsule())
            .materialActiveAppearance(appearance)
    }

    private let notes: [(title: String, detail: String, symbol: String)] = [
        ("Three appearance values.", ".active forces the bright variant; .inactive forces the dimmed variant; .automatic restores the default window-tracking behavior.", "switch.2"),
        ("Default behavior is window-tracking.", "Without this modifier, .window and .bar materials follow the window's key state. Other materials always render active by default.", "macwindow"),
        ("Useful for popovers, sheets, and floating chrome.", "When a material chip should NOT track the window state (because it lives over its own background or overlays moving content), force .active.", "rectangle.on.rectangle"),
        ("Pair with .containerBackground(_:for:).", "Apply materialActiveAppearance to the value passed into .containerBackground(.regularMaterial.materialActiveAppearance(.active), for: .window).", "rectangle.fill")
    ]

    @ViewBuilder
    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            ForEach(notes, id: \.title) { note in
                VStack(alignment: .leading, spacing: 4) {
                    Label(note.title, systemImage: note.symbol).font(.headline).foregroundStyle(.primary)
                    Text(note.detail).font(.callout).foregroundStyle(.secondary).padding(.leading, 24)
                }
            }
        }
    }
}

private struct MAVariantRow<Content: View>: View {
    let title: String
    @ViewBuilder var content: () -> Content
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title).font(.headline).foregroundStyle(.primary)
            content()
        }
    }
}

#Preview { MaterialActiveAppearancePage().frame(width: 1100, height: 1200) }
