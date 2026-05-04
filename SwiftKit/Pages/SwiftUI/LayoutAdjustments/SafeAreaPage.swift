import SwiftUI

// SwiftUI safeAreaInset, ignoresSafeArea, SafeAreaRegions reference page.
// Source: Documentation/SwiftUI/layout-adjustments/ignoressafearea.md
// macOS 12.0+

struct SafeAreaPage: View {
    var body: some View {
        GalleryPageScaffold {
            VStack(alignment: .leading, spacing: 6) {
                Text("safeAreaInset / ignoresSafeArea / SafeAreaRegions")
                    .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
                Text("Control how views interact with system safe areas — extend beyond, inset additional space, or add a fixed overlay that adjusts the safe area for content below.")
                    .font(.callout).foregroundStyle(.secondary)
                Text("Documentation/SwiftUI/layout-adjustments/ · macOS 12.0+")
                    .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
            }
        } defaultRender: {
            VStack(alignment: .leading, spacing: 8) {
                APICallout(".safeAreaInset(edge: .bottom, spacing: 0) { BottomBar() }")
                Text("safeAreaInset adds a view that overlays at the specified edge and shrinks the safe area for content beneath it — so ScrollView content stops above the bar.")
                    .font(.callout).foregroundStyle(.secondary)
                ZStack(alignment: .bottom) {
                    ScrollView {
                        VStack(alignment: .leading, spacing: 0) {
                            ForEach(0..<8) { i in
                                Text("Row \(i + 1)")
                                    .font(.callout).foregroundStyle(.primary)
                                    .padding(.horizontal, 12).padding(.vertical, 8)
                                Divider().padding(.leading, 12)
                            }
                        }
                    }
                    .safeAreaInset(edge: .bottom, spacing: 0) {
                        Text("Fixed bottom bar — safe area is inset above this")
                            .font(.caption).fontWeight(.medium).foregroundStyle(.secondary)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 8)
                            .background(.regularMaterial)
                    }
                }
                .frame(height: 200)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
                .clipped()
            }
        } variants: {
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("ignoresSafeArea(_:edges:)").font(.headline).foregroundStyle(.primary)
                    APICallout(".ignoresSafeArea(.container, edges: .horizontal)")
                    Text("Allows the view to extend into safe-area regions. .container includes window chrome; .keyboard is the software keyboard region (macOS has no software keyboard). SafeAreaRegions is an option set.")
                        .font(.callout).foregroundStyle(.secondary)
                    APICallout("SafeAreaRegions: .container  //  .keyboard  //  .all")
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("safeAreaInset(edge:alignment:spacing:content:) — all params").font(.headline).foregroundStyle(.primary)
                    APICallout(".safeAreaInset(edge: .trailing, alignment: .center, spacing: 8) { … }")
                    Text("The alignment parameter positions the inserted view within the edge stripe. Spacing adds a gap between the main content and the overlay.")
                        .font(.callout).foregroundStyle(.secondary)
                }
            }
        } states: {
            VStack(alignment: .leading, spacing: 8) {
                Text("SafeAreaRegions option set cases").font(.headline).foregroundStyle(.primary)
                ForEach([
                    (".container", "Window/navigation bars and tab bars"),
                    (".keyboard", "Software keyboard (iOS/iPadOS; no effect on macOS)"),
                    (".all", "All safe area regions combined")
                ], id: \.0) { code, desc in
                    VStack(alignment: .leading, spacing: 2) {
                        APICallout(code)
                        Text(desc).font(.caption).foregroundStyle(.tertiary)
                    }
                }
            }
        } notes: {
            VStack(alignment: .leading, spacing: 12) {
                Label("safeAreaInset is the preferred way to add persistent bottom/top bars — it adjusts ScrollView content insets automatically.", systemImage: "arrow.up.and.down.square")
                    .font(.callout).foregroundStyle(.secondary)
                Label("ignoresSafeArea(.all) is useful for full-bleed backgrounds. Don't use it for interactive content that must stay accessible.", systemImage: "exclamationmark.triangle")
                    .font(.callout).foregroundStyle(.secondary)
                Label("On macOS, the main safe area region is the title bar area. Sidebars introduce additional safe area on the leading edge.", systemImage: "sidebar.left")
                    .font(.callout).foregroundStyle(.secondary)
            }
        }
    }
}

#Preview {
    SafeAreaPage().frame(width: 900, height: 800)
}
