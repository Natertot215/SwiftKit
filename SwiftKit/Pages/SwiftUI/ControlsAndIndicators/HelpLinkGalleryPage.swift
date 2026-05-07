import SwiftUI

// SwiftUI `HelpLink` reference page.
// A button that opens a help anchor in Apple's Help system (macOS only).
// macOS 14.0+

struct HelpLinkGalleryPage: View {
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
            Text("HelpLink")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("A standard macOS help button (the \u{201c}?\u{201d} button) that opens an anchor in the app\u{2019}s Help book.")
                .font(.callout).foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/controls-and-indicators/helplink.md · macOS 14.0+")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        HLCard(api: "HelpLink(anchor: \"overview\")") {
            HelpLink(anchor: "overview")
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {

            HLVariant(title: "Default HelpLink (question mark button)") {
                HLCard(api: "HelpLink(anchor: \"myFeatureHelp\")") {
                    HelpLink(anchor: "myFeatureHelp")
                }
            }

            HLVariant(title: "Placed in an HStack alongside controls") {
                HLCard(api: "HStack { Text(\"Feature\"); HelpLink(anchor: \"feature\") }") {
                    HStack {
                        Text("Advanced Feature")
                        HelpLink(anchor: "advancedFeature")
                    }
                }
            }

            HLVariant(title: "In a Form row (typical Preferences usage)") {
                HLCard(api: "Form { LabeledContent(\"Setting\") { HelpLink(anchor: \"setting\") } }",
                       height: 100) {
                    Form {
                        LabeledContent("Advanced Setting") {
                            HelpLink(anchor: "advancedSetting")
                        }
                    }
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            HLVariant(title: "Disabled") {
                HLCard(api: "HelpLink(anchor: \"...\").disabled(true)") {
                    HelpLink(anchor: "test").disabled(true)
                }
            }
        }
    }

    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            NoteRowHL(symbol: "questionmark.circle", title: "Requires a registered Help book in the app bundle.",
                      detail: "HelpLink opens the anchor in the CFBundleHelpBookName Help bundle. Without a registered Help book, the button opens Apple's general macOS Help.")
            NoteRowHL(symbol: "macwindow", title: "macOS-only primitive.",
                      detail: "HelpLink does not exist on iOS or watchOS. It maps to NSHelpManager.shared.openHelpAnchor(_:inBook:) under the hood.")
        }
    }
}

private struct HLCard<Content: View>: View {
    let api: String
    var height: CGFloat? = nil
    @ViewBuilder var content: () -> Content
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Group {
                if let h = height {
                    content().frame(width: 340, height: h)
                } else {
                    content().frame(minWidth: 280, alignment: .leading)
                }
            }
            .padding(12)
            .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
            .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
            APICallout(api)
        }
    }
}

private struct HLVariant<Content: View>: View {
    let title: String
    @ViewBuilder var content: () -> Content
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title).font(.headline).foregroundStyle(.primary)
            content()
        }
    }
}

private struct NoteRowHL: View {
    let symbol: String
    let title: String
    let detail: String
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Label(title, systemImage: symbol).font(.headline).foregroundStyle(.primary)
            Text(detail).font(.callout).foregroundStyle(.secondary).padding(.leading, 24)
        }
    }
}

extension HelpLinkGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.controlsAndIndicators.helpLink",
        title: "HelpLink",
        folder: "Controls and indicators",
        framework: .swiftUI,
        absorbedSymbols: ["HelpLink"],
        blurb: "A button with a standard appearance that opens app-specific help documentation, typically jumping to an anchor in an Apple Help book.",
        signature: "struct HelpLink",
        availability: "macOS 14.0+",
        docPath: "Documentation/SwiftUI/controls-and-indicators/helplink.md",
        page: { AnyView(HelpLinkGalleryPage()) }
    )
}

#Preview {
    HelpLinkGalleryPage().frame(width: 800, height: 600)
}
