import SwiftUI

// Text scale and Dynamic Type reference page.
// Covers: textScale(_:isEnabled:), dynamicTypeSize(_:), DynamicTypeSize, ScaledMetric
// Source: Documentation/SwiftUI/text-input-and-output/
// macOS 14.0+ (textScale), macOS 12.0+ (dynamicTypeSize), macOS 11.0+ (ScaledMetric)

struct TextScaleGalleryPage: View {
    @State private var selectedSize: DynamicTypeSize = .large
    @ScaledMetric(relativeTo: .body) private var iconSize: CGFloat = 24

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
            Text("Text Scale & Dynamic Type")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Control how text responds to Dynamic Type size settings.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("View/textScale(_:isEnabled:) · View/dynamicTypeSize(_:) · DynamicTypeSize · ScaledMetric · macOS 11–14+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        TSCCard(api: ".dynamicTypeSize(.large)") {
            Text("Dynamic Type Large (system default)")
                .dynamicTypeSize(.large)
        }
    }

    private let allSizes: [DynamicTypeSize] = [
        .xSmall, .small, .medium, .large, .xLarge, .xxLarge, .xxxLarge,
        .accessibility1, .accessibility2, .accessibility3, .accessibility4, .accessibility5
    ]
    private let sizeLabels: [String] = [
        "xSmall", "small", "medium", "large", "xLarge", "xxLarge", "xxxLarge",
        "a11y1", "a11y2", "a11y3", "a11y4", "a11y5"
    ]

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            TSCVariant(title: "dynamicTypeSize(_:) — fixed override") {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .top, spacing: 12) {
                        ForEach(Array(zip(sizeLabels, allSizes)), id: \.0) { label, size in
                            VStack(alignment: .leading, spacing: 4) {
                                Text("Aa").font(.body).dynamicTypeSize(size)
                                    .padding(8)
                                    .frame(minWidth: 48, alignment: .center)
                                    .background(.background.secondary, in: RoundedRectangle(cornerRadius: 6))
                                    .overlay(RoundedRectangle(cornerRadius: 6).strokeBorder(.separator, lineWidth: 1))
                                Text(".\(label)")
                                    .font(.system(size: 9))
                                    .fontDesign(.monospaced)
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                    .padding(.horizontal, 2)
                }
            }

            TSCVariant(title: "dynamicTypeSize(_:) range") {
                TSCCard(api: ".dynamicTypeSize(.large ... .xxxLarge)") {
                    Text("Capped between Large and xxxLarge")
                        .dynamicTypeSize(.large ... .xxxLarge)
                }
            }

            TSCVariant(title: "textScale(_:isEnabled:)") {
                HStack(alignment: .top, spacing: 16) {
                    TSCCard(api: ".textScale(.secondary)") {
                        HStack(alignment: .firstTextBaseline, spacing: 4) {
                            Text("$12")
                            Text("99")
                                .textScale(.secondary)
                                .foregroundStyle(.secondary)
                        }
                    }
                    TSCCard(api: ".textScale(.secondary, isEnabled: false)") {
                        HStack(alignment: .firstTextBaseline, spacing: 4) {
                            Text("$12")
                            Text("99")
                                .textScale(.secondary, isEnabled: false)
                                .foregroundStyle(.secondary)
                        }
                    }
                }
            }

            TSCVariant(title: "ScaledMetric — scales a numeric value with Dynamic Type") {
                TSCCard(api: "@ScaledMetric(relativeTo: .body) var iconSize: CGFloat = 24") {
                    HStack(spacing: 8) {
                        Image(systemName: "star.fill")
                            .resizable()
                            .frame(width: iconSize, height: iconSize)
                            .foregroundStyle(.tint)
                        Text("Icon scales with body text: \(Int(iconSize))pt")
                            .font(.body)
                    }
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            TSCVariant(title: "DynamicTypeSize — picker demo") {
                VStack(alignment: .leading, spacing: 12) {
                    Picker("Size", selection: $selectedSize) {
                        ForEach(Array(zip(sizeLabels, allSizes)).filter { !$0.0.hasPrefix("a11y") }, id: \.0) { label, size in
                            Text(".\(label)").tag(size)
                        }
                    }
                    .pickerStyle(.segmented)
                    .frame(maxWidth: 600)

                    Text("The quick brown fox jumps over the lazy dog.")
                        .dynamicTypeSize(selectedSize)
                        .padding(12)
                        .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                        .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
                }
            }
        }
    }

    private struct TSCNote { let title: String; let detail: String; let symbol: String }
    private let notes: [TSCNote] = [
        .init(title: "dynamicTypeSize(_:) overrides the environment.", detail: "It doesn't change the system setting — it injects a specific DynamicTypeSize into the view's environment for all descendants.", symbol: "textformat.size.larger"),
        .init(title: "Use a range to cap growth without fixing it.", detail: ".dynamicTypeSize(.large ... .xxLarge) lets text grow beyond the default but stops at xxLarge, protecting complex layouts.", symbol: "arrow.up.and.down.square"),
        .init(title: "textScale(.secondary) is for secondary numeric text.", detail: "Apply it to cents in a price, subscripts, or secondary counters. It makes the text slightly smaller while keeping it in the same font family.", symbol: "textformat.subscript"),
        .init(title: "@ScaledMetric grows non-text dimensions with the font.", detail: "Use it for icon sizes, spacings, or corner radii that should track the user's text size preference. Provide relativeTo: .body for the common case.", symbol: "scalemass"),
    ]

    @ViewBuilder private var notesContent: some View {
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

private struct TSCCard<C: View>: View {
    let api: String
    @ViewBuilder var content: () -> C
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            content()
                .padding(12)
                .frame(minWidth: 240, minHeight: 40, alignment: .leading)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
            APICallout(api)
        }
    }
}

private struct TSCVariant<C: View>: View {
    let title: String
    @ViewBuilder var content: () -> C
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title).font(.headline).foregroundStyle(.primary)
            content()
        }
    }
}

extension TextScaleGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.textInputAndOutput.textScale",
        title: "TextScale",
        folder: "Text input and output",
        framework: .swiftUI,
        absorbedSymbols: ["swiftui.text-input-and-output.textscale(_:isenabled:)"],
        blurb: "Applies a text scale to text in the view.",
        signature: "func textScale(_ scale: Text.Scale, isEnabled: Bool = true) -> some View",
        availability: "macOS 14.0+",
        docPath: "Documentation/SwiftUI/text-input-and-output/textscale(_:isenabled:).md",
        page: { AnyView(TextScaleGalleryPage()) }
    )
}

#Preview {
    TextScaleGalleryPage().frame(width: 1000, height: 1000)
}
