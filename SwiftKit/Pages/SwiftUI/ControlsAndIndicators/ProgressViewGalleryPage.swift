import SwiftUI

// SwiftUI `ProgressView` consolidated reference page.
// Absorbs: ProgressViewStyle, ProgressViewStyleConfiguration, View/progressViewStyle(_:),
//          DefaultDateProgressLabel (from ProgressViewStylePage.swift and inline leaf)
// Sources:
//   Documentation/SwiftUI/controls-and-indicators/progressview.md
//   Documentation/SwiftUI/view-styles/progressviewstyle.md
//   Documentation/SwiftUI/view-styles/progressviewstyleconfiguration.md
//   Documentation/SwiftUI/view-styles/progressviewstyle(_:).md
//   Documentation/SwiftUI/controls-and-indicators/defaultdateprogresslabel.md
// macOS 11.0+
// Per L-001 / L-012: semantic tokens only, no hand-mixed colors.

private let pvCardWidth: CGFloat = 280
private let pvCardHeight: CGFloat = 130

struct ProgressViewGalleryPage: View {
    @State private var progress: Double = 0.4
    private let timerInterval = Date()...Date().addingTimeInterval(10)

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 32) {
                headerSection
                referenceSection
                defaultSection
                indeterminateVariantsSection
                determinateSection
                styleGallerySection
                tintSection
                timerSection
                notesSection
            }
            .padding(.horizontal, 32)
            .padding(.vertical, 24)
            .frame(maxWidth: galleryReadableContentWidth, alignment: .leading)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }

    // MARK: Header

    private var headerSection: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("ProgressView \u{00b7} DefaultDateProgressLabel")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("A view that shows the progress of a task. Supports indeterminate, determinate, and timer-based modes.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/controls-and-indicators/progressview.md \u{00b7} macOS 11.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
            Text("ProgressView  \u{00b7}  ProgressViewStyle  \u{00b7}  ProgressViewStyleConfiguration  \u{00b7}  DefaultDateProgressLabel  \u{00b7}  View/progressViewStyle(_:)")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.secondary)
                .textSelection(.enabled)
        }
    }

    // MARK: Reference

    private var referenceSection: some View {
        PageSection(
            "Reference",
            subtitle: "ProgressViewStyle protocol \u{00b7} ProgressViewStyleConfiguration \u{00b7} macOS 11.0+"
        ) {
            VStack(alignment: .leading, spacing: 16) {
                Text("ProgressViewStyle is a protocol for customising the appearance of a ProgressView. Apply a built-in style via .progressViewStyle(_:) on any view; all ProgressView instances in the subtree inherit it. The built-in conformers on macOS are .automatic, .linear, and .circular.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                Text("SwiftKit does NOT author custom ProgressViewStyle conformers per project hard constraint. ProgressViewStyleConfiguration is provided to implementations by the framework; fractionCompleted is nil when the ProgressView is indeterminate.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                PVCodeBlock(text:
                    """
                    protocol ProgressViewStyle {
                        associatedtype Body : View
                        @ViewBuilder func makeBody(configuration: Configuration) -> Body
                        typealias Configuration = ProgressViewStyleConfiguration
                    }

                    struct ProgressViewStyleConfiguration {
                        struct Label : View { … }
                        struct CurrentValueLabel : View { … }

                        var fractionCompleted: Double?    // nil = indeterminate
                        var label: Label?
                        var currentValueLabel: CurrentValueLabel?
                    }

                    extension View {
                        func progressViewStyle<S: ProgressViewStyle>(_ style: S) -> some View
                    }
                    """)
            }
        }
    }

    // MARK: Default

    private var defaultSection: some View {
        PageSection("Default", subtitle: "ProgressView()  // indeterminate spinner") {
            VStack(alignment: .leading, spacing: 6) {
                ProgressView()
                    .padding(12)
                    .frame(minWidth: 300, alignment: .leading)
                    .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                    .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
                APICallout("ProgressView()  // indeterminate spinner")
            }
        }
    }

    // MARK: Indeterminate Variants

    private var indeterminateVariantsSection: some View {
        PageSection("Indeterminate Variants", subtitle: "No value \u{2014} spinning activity indicator") {
            VStack(alignment: .leading, spacing: 24) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("No label")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    PVStyleCard(title: "ProgressView()", api: "ProgressView()") {
                        ProgressView()
                    }
                }
                VStack(alignment: .leading, spacing: 8) {
                    Text("With label")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    PVStyleCard(title: "ProgressView(\"Loading\u{2026}\")", api: "ProgressView(\"Loading\u{2026}\")") {
                        ProgressView("Loading\u{2026}")
                    }
                }
            }
        }
    }

    // MARK: Determinate

    private var determinateSection: some View {
        PageSection("Determinate Progress", subtitle: "value: 0.0\u{2026}1.0 with optional label and total") {
            VStack(alignment: .leading, spacing: 24) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("value: 0.0\u{2026}1.0")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    VStack(alignment: .leading, spacing: 6) {
                        ProgressView(value: progress)
                            .frame(minWidth: 300, alignment: .leading)
                        Text("progress: \(progress, specifier: "%.2f")")
                            .font(.caption)
                            .fontDesign(.monospaced)
                            .foregroundStyle(.secondary)
                        Slider(value: $progress, in: 0...1)
                            .controlSize(.small)
                            .frame(maxWidth: 360)
                        APICallout("ProgressView(value: progress)")
                    }
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("With label and total")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    VStack(alignment: .leading, spacing: 6) {
                        ProgressView("Uploading", value: 40.0, total: 100.0)
                            .frame(minWidth: 300, alignment: .leading)
                        APICallout("ProgressView(\"Uploading\", value: 40, total: 100)")
                    }
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Boundary values")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    HStack(alignment: .top, spacing: 24) {
                        VStack(alignment: .leading, spacing: 6) {
                            ProgressView(value: 0.0)
                                .frame(width: 280)
                            APICallout("ProgressView(value: 0.0)")
                        }
                        VStack(alignment: .leading, spacing: 6) {
                            ProgressView(value: 1.0)
                                .frame(width: 280)
                            APICallout("ProgressView(value: 1.0)")
                        }
                    }
                }
            }
        }
    }

    // MARK: Style Gallery

    private var styleGallerySection: some View {
        PageSection(
            "ProgressViewStyle Gallery",
            subtitle: "View/progressViewStyle(_:) \u{00b7} .automatic, .linear, .circular \u{00d7} determinate + indeterminate"
        ) {
            VStack(alignment: .leading, spacing: 16) {
                Text("Three built-in ProgressViewStyle values on macOS, each shown determinate and indeterminate.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                LazyVGrid(
                    columns: [GridItem(.adaptive(minimum: pvCardWidth + 24), spacing: 24)],
                    alignment: .leading,
                    spacing: 24
                ) {
                    PVStyleCard(title: ".automatic (determinate)", api: ".progressViewStyle(.automatic)") {
                        ProgressView(value: progress).progressViewStyle(.automatic)
                    }
                    PVStyleCard(title: ".linear (determinate)", api: ".progressViewStyle(.linear)") {
                        ProgressView(value: progress).progressViewStyle(.linear)
                    }
                    PVStyleCard(title: ".circular (determinate)", api: ".progressViewStyle(.circular)") {
                        ProgressView(value: progress).progressViewStyle(.circular)
                    }
                    PVStyleCard(title: ".automatic (indeterminate)", api: "ProgressView()  // no value") {
                        ProgressView().progressViewStyle(.automatic)
                    }
                    PVStyleCard(title: ".linear (indeterminate)", api: "ProgressView()  // no value") {
                        ProgressView().progressViewStyle(.linear)
                    }
                    PVStyleCard(title: ".circular (indeterminate)", api: "ProgressView()  // no value") {
                        ProgressView().progressViewStyle(.circular)
                    }
                }
            }
        }
    }

    // MARK: Tint

    private var tintSection: some View {
        PageSection("Style Variants and Tint Propagation", subtitle: ".tint(_:) colors the fill and spinner") {
            VStack(alignment: .leading, spacing: 24) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("With label \u{2014} .linear and .circular")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    HStack(alignment: .top, spacing: 24) {
                        PVStyleCard(title: ".linear + label", api: "ProgressView(\"Loading\u{2026}\", value: \u{2026})") {
                            ProgressView("Loading\u{2026}", value: progress)
                                .progressViewStyle(.linear)
                        }
                        PVStyleCard(title: ".circular + label", api: "ProgressView(\"Loading\u{2026}\", value: \u{2026})") {
                            ProgressView("Loading\u{2026}", value: progress)
                                .progressViewStyle(.circular)
                        }
                    }
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Tint propagates")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    HStack(alignment: .top, spacing: 24) {
                        PVStyleCard(title: ".tint(.green)", api: ".tint(.green)") {
                            ProgressView(value: progress).progressViewStyle(.linear).tint(.green)
                        }
                        PVStyleCard(title: ".tint(.purple)", api: ".tint(.purple)") {
                            ProgressView(value: progress).progressViewStyle(.linear).tint(.purple)
                        }
                    }
                }
            }
        }
    }

    // MARK: Timer-based / DefaultDateProgressLabel

    private var timerSection: some View {
        PageSection(
            "Timer-based ProgressView \u{00b7} DefaultDateProgressLabel",
            subtitle: "ProgressView(timerInterval:) \u{00b7} struct DefaultDateProgressLabel \u{00b7} macOS 13.0+"
        ) {
            VStack(alignment: .leading, spacing: 16) {
                Text("DefaultDateProgressLabel is an internal SwiftUI type used by ProgressView(timerInterval:) to render the countdown label. It has no public initializer and cannot be constructed directly.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                VStack(alignment: .leading, spacing: 6) {
                    ProgressView(timerInterval: timerInterval)
                        .padding(12)
                        .frame(minWidth: 300, alignment: .leading)
                        .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                        .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
                    APICallout("ProgressView(timerInterval: start...end)")
                }

                PVCodeBlock(text:
                    """
                    // DefaultDateProgressLabel — no public init
                    // Used internally by ProgressView(timerInterval:) to render the countdown.
                    struct DefaultDateProgressLabel : View { /* SPI */ }

                    // How to use the timer-based overload:
                    let interval = Date()...Date().addingTimeInterval(10)
                    ProgressView(timerInterval: interval)
                    """)
            }
        }
    }

    // MARK: Notes

    private var notesSection: some View {
        PageSection("Notes", subtitle: "Guidance from Apple\u{2019}s docs.") {
            VStack(alignment: .leading, spacing: 16) {
                pvNoteRow(
                    symbol: "rectangle",
                    title: ".automatic resolves to .linear in most macOS contexts.",
                    detail: "macOS reaches for the bar when the ProgressView is in a list, form, or row. .circular shows up in toolbar and inspector contexts."
                )
                pvNoteRow(
                    symbol: "questionmark.circle",
                    title: "Indeterminate vs determinate is data-driven, not style-driven.",
                    detail: "Pass a value (0\u{2026}1 or a Progress) for determinate; omit it for indeterminate. The same style renders both modes differently."
                )
                pvNoteRow(
                    symbol: "circle.dotted",
                    title: ".circular maps to NSProgressIndicator.style = .spinning on macOS.",
                    detail: ".linear maps to NSProgressIndicator.style = .bar. The default style (.automatic) resolves based on context."
                )
                pvNoteRow(
                    symbol: "function",
                    title: "fractionCompleted is nil when indeterminate.",
                    detail: "Custom conformers branch on configuration.fractionCompleted == nil to draw the spinner vs the bar/arc."
                )
                pvNoteRow(
                    symbol: "rectangle.stack",
                    title: "Wrap a Progress object for cancellable, reportable progress.",
                    detail: "ProgressView(_:) accepts Foundation.Progress. SwiftUI observes its fractionCompleted and updates the bar; supports nested children for hierarchical work."
                )
                pvNoteRow(
                    symbol: "paintpalette",
                    title: ".tint colors the fill and spinner.",
                    detail: "Apply .tint(_:) to recolor both the bar and the spinner. Works with all built-in styles."
                )
                pvNoteRow(
                    symbol: "timer",
                    title: "Timer-based ProgressView auto-updates from a DateInterval.",
                    detail: "Provide a ClosedRange<Date> with timerInterval: and SwiftUI animates the bar forward in real time. DefaultDateProgressLabel shows a countdown label automatically."
                )
            }
        }
    }

    // MARK: Helpers

    private func pvNoteRow(symbol: String, title: String, detail: String) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Label(title, systemImage: symbol)
                .font(.headline)
                .foregroundStyle(.primary)
            Text(detail)
                .font(.callout)
                .foregroundStyle(.secondary)
                .padding(.leading, 24)
        }
    }
}

// MARK: Private sub-views

private struct PVStyleCard<Content: View>: View {
    let title: String
    let api: String
    @ViewBuilder var content: () -> Content

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            content()
                .padding(12)
                .frame(width: 280, height: 130, alignment: .center)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(.separator, lineWidth: 1)
                )
            APICallout(api)
        }
    }
}

private struct PVCodeBlock: View {
    let text: String
    var body: some View {
        Text(text)
            .font(.callout)
            .fontDesign(.monospaced)
            .textSelection(.enabled)
            .foregroundStyle(.primary)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(12)
            .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .strokeBorder(.separator, lineWidth: 1)
            )
    }
}

extension ProgressViewGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.controlsAndIndicators.progressView",
        title: "ProgressView",
        folder: "Controls and indicators",
        framework: .swiftUI,
        absorbedSymbols: ["ProgressView"],
        blurb: "A view that shows progress toward completion of a task. Renders both determinate (percentage) and indeterminate (spinning) progress.",
        signature: "struct ProgressView<Label, CurrentValueLabel> where Label : View, CurrentValueLabel : View",
        availability: "macOS 11.0+",
        docPath: "Documentation/SwiftUI/controls-and-indicators/progressview.md",
        page: { AnyView(ProgressViewGalleryPage()) }
    )
}

#Preview {
    ProgressViewGalleryPage()
        .frame(width: 1000, height: 1600)
}
