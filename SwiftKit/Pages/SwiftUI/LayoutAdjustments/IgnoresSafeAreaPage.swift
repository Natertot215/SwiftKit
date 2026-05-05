import SwiftUI

// SwiftUI `View/ignoresSafeArea(_:edges:)` reference page.
// Source: Documentation/SwiftUI/layout-adjustments/ignoressafearea(_:edges:).md
// macOS 11.0+. Lets a view extend into safe-area regions.

struct IgnoresSafeAreaPage: View {
    var body: some View {
        GalleryPageScaffold {
            VStack(alignment: .leading, spacing: 6) {
                Text("View/ignoresSafeArea(_:edges:)")
                    .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
                Text("Allows a view to extend into the specified safe-area regions on the chosen edges \u{2014} typically used for full-bleed backgrounds that should run beneath window chrome.")
                    .font(.callout).foregroundStyle(.secondary)
                Text("Documentation/SwiftUI/layout-adjustments/ignoressafearea(_:edges:).md \u{00b7} macOS 11.0+")
                    .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
            }
        } defaultRender: {
            VStack(alignment: .leading, spacing: 12) {
                APICallout(".ignoresSafeArea(.container, edges: .all)")
                Text("A colored background extends to the full container, including the title-bar safe area above. Inset content uses padding to stay within the safe area visually.")
                    .font(.callout).foregroundStyle(.secondary)
                ZStack(alignment: .topLeading) {
                    LinearGradient(colors: [Color.accentColor.opacity(0.35), Color.accentColor.opacity(0.1)],
                                   startPoint: .top, endPoint: .bottom)
                        .ignoresSafeArea(.container, edges: .all)
                    VStack(alignment: .leading, spacing: 6) {
                        Text("Foreground content")
                            .font(.headline).foregroundStyle(.primary)
                        Text("The gradient bleeds beneath chrome. Foreground respects safe area via padding.")
                            .font(.callout).foregroundStyle(.secondary)
                    }
                    .padding(20)
                }
                .frame(height: 180)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
            }
        } variants: {
            VStack(alignment: .leading, spacing: 24) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Specific edges").font(.headline).foregroundStyle(.primary)
                    APICallout(".ignoresSafeArea(.container, edges: .top)")
                    Text("Restricts the bleed to a single edge \u{2014} the leading/trailing/bottom edges keep their safe-area inset.")
                        .font(.callout).foregroundStyle(.secondary)
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text(".horizontal / .vertical Edge.Set values").font(.headline).foregroundStyle(.primary)
                    APICallout(".ignoresSafeArea(.container, edges: .horizontal)")
                    Text("Edge.Set is an OptionSet \u{2014} use [.top, .bottom] or .vertical to combine.")
                        .font(.callout).foregroundStyle(.secondary)
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("SafeAreaRegions selector").font(.headline).foregroundStyle(.primary)
                    APICallout(".ignoresSafeArea(.keyboard, edges: .bottom)")
                    Text("regions selects which safe-area regions to ignore. .container = window chrome, sidebars, navigation. .keyboard = software keyboard region (no effect on macOS). .all = both.")
                        .font(.callout).foregroundStyle(.secondary)
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Defaults \u{2014} no arguments").font(.headline).foregroundStyle(.primary)
                    APICallout(".ignoresSafeArea()  //  .all regions, .all edges")
                    Text("Both parameters default to .all, so the bare call ignores every safe-area region on every edge.")
                        .font(.callout).foregroundStyle(.secondary)
                }
            }
        } states: {
            VStack(alignment: .leading, spacing: 8) {
                Text("Comparison: with vs. without ignoresSafeArea").font(.headline).foregroundStyle(.primary)
                HStack(spacing: 12) {
                    VStack(spacing: 4) {
                        Color.accentColor.opacity(0.4)
                            .frame(height: 80)
                        Text("Without")
                            .font(.caption).foregroundStyle(.secondary)
                    }
                    VStack(spacing: 4) {
                        Color.accentColor.opacity(0.4)
                            .frame(height: 80)
                            .ignoresSafeArea(.container, edges: .all)
                        Text("With ignoresSafeArea")
                            .font(.caption).foregroundStyle(.secondary)
                    }
                }
                Text("Inside a small framed container the visual difference is subtle \u{2014} but at the window level the bled view runs under the title bar.")
                    .font(.caption).foregroundStyle(.tertiary)
            }
        } notes: {
            VStack(alignment: .leading, spacing: 12) {
                Label("Apply to background views \u{2014} ignoresSafeArea on interactive content can put it underneath chrome where the user can't reach it.", systemImage: "exclamationmark.triangle")
                    .font(.callout).foregroundStyle(.secondary)
                Label(".keyboard region is iOS/iPadOS-only \u{2014} on macOS the value resolves but has no effect.", systemImage: "macbook")
                    .font(.callout).foregroundStyle(.secondary)
                Label("For a fixed-size overlay that adjusts the safe area of nested content, use safeAreaInset instead.", systemImage: "arrow.up.and.down.square")
                    .font(.callout).foregroundStyle(.secondary)
            }
        }
    }
}

#Preview {
    IgnoresSafeAreaPage().frame(width: 900, height: 900)
}
