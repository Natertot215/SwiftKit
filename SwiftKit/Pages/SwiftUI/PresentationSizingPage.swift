import SwiftUI

// SwiftUI presentationSizing reference page — bundles four symbols:
// • View/presentationSizing(_:)
// • PresentationSizing (protocol)
// • PresentationSizingRoot (the layout root passed to custom sizings)
// • PresentationSizingContext (context passed to custom sizings)
// Source: Documentation/SwiftUI/modal-presentations/presentationsizing(_:).md +
//         presentationsizing.md + presentationsizingroot.md + presentationsizingcontext.md
// macOS 15.0+.

private let demoFrameWidth: CGFloat = 480

struct PresentationSizingPage: View {
    @State private var isShowingForm = false
    @State private var isShowingPage = false
    @State private var isShowingFitted = false

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
            Text("View/presentationSizing(_:) + PresentationSizing")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Sets the sizing of the containing presentation. Built-in values: .automatic, .form, .page, .fitted. Compose with .fitted(horizontal:vertical:) and .sticky(horizontal:vertical:).")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/modal-presentations/presentationsizing(_:).md \u{00b7} macOS 15.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        DemoCard(api: ".sheet(isPresented:) { … .presentationSizing(.form) }") {
            Button("Open form-sized sheet") { isShowingForm = true }
                .buttonStyle(.borderedProminent)
                .sheet(isPresented: $isShowingForm) {
                    SizingSheetBody(label: ".form sizing — wider for inputs")
                        .presentationSizing(.form)
                }
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: ".page — informational sheet sizing") {
                DemoCard(api: ".presentationSizing(.page)") {
                    Button("Open page sheet") { isShowingPage = true }
                        .sheet(isPresented: $isShowingPage) {
                            SizingSheetBody(label: ".page sizing — narrower, tall, like an article")
                                .presentationSizing(.page)
                        }
                }
            }

            VariantBlock(title: ".fitted — sized to content") {
                DemoCard(api: ".presentationSizing(.fitted)") {
                    Button("Open fitted sheet") { isShowingFitted = true }
                        .sheet(isPresented: $isShowingFitted) {
                            SizingSheetBody(label: ".fitted — sheet shrinks to its content")
                                .presentationSizing(.fitted)
                        }
                }
            }

            VariantBlock(title: "Composed — .page.fitted(vertical:).sticky(vertical:)") {
                DemoCard(api: ".presentationSizing(.page.fitted(horizontal: false, vertical: true).sticky(horizontal: false, vertical: true))") {
                    Text("Apple's documented recipe for an info sheet whose vertical size matches its content but doesn't change too often as the content varies.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                    Text("""
                    .presentationSizing(
                        .page
                            .fitted(horizontal: false, vertical: true)
                            .sticky(horizontal: false, vertical: true))
                    """)
                    .font(.caption)
                    .fontDesign(.monospaced)
                    .padding(8)
                    .background(.background.secondary, in: RoundedRectangle(cornerRadius: 6))
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Custom sizing — conform to PresentationSizing") {
                Text("""
                struct SquareSizing: PresentationSizing {
                    func proposedSize(for subview: PresentationSizingRoot,
                                      context: PresentationSizingContext) -> CGSize {
                        .init(width: 400, height: 400)
                    }
                }
                extension PresentationSizing where Self == SquareSizing {
                    static var square: Self { SquareSizing() }
                }

                // Use it:
                .presentationSizing(.square.fitted(horizontal: false, vertical: true))
                """)
                .font(.caption)
                .fontDesign(.monospaced)
                .padding(12)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(.separator, lineWidth: 1)
                )
                Text("PresentationSizingRoot is the layout root the system passes in. PresentationSizingContext gives you `maxDetentValue`, environment values, and other layout context.")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
        }
    }

    private struct PSNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [PSNote] = [
        .init(title: "Four built-in sizings.",
              detail: ".automatic, .form, .page, .fitted — these are static members on PresentationSizing. Most cases never need a custom sizing.",
              symbol: "ruler"),
        .init(title: ".form vs .page — semantic, not size.",
              detail: ".form is wider, suited to input controls (Form, TextField, Picker). .page is narrower and tall, suited to informational content (text + image).",
              symbol: "doc.text"),
        .init(title: ".fitted(horizontal:vertical:) and .sticky(horizontal:vertical:) compose.",
              detail: "Modify ANY built-in sizing by chaining .fitted (size to content per axis) and .sticky (don't re-size unless content changes more than threshold).",
              symbol: "link"),
        .init(title: "Inside NavigationSplitView, sizing applies to the detail column.",
              detail: "If the presentation root is a NavigationSplitView, the proposed width only affects the .detail column. Sidebar/content widths use system defaults or .navigationSplitViewColumnWidth.",
              symbol: "sidebar.right"),
        .init(title: "Conforming types: AutomaticPresentationSizing, FittedPresentationSizing, FormPresentationSizing, PagePresentationSizing.",
              detail: "Documented in the protocol topics — these are the framework's internal conformers. You rarely interact with them directly.",
              symbol: "list.bullet")
    ]

    @ViewBuilder
    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            ForEach(notes, id: \.title) { note in
                VStack(alignment: .leading, spacing: 4) {
                    Label(note.title, systemImage: note.symbol)
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Text(note.detail)
                        .font(.callout)
                        .foregroundStyle(.secondary)
                        .padding(.leading, 24)
                }
            }
        }
    }
}

private struct SizingSheetBody: View {
    let label: String
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack(spacing: 16) {
            Text(label)
                .font(.title3)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
            Button("Dismiss") { dismiss() }
                .keyboardShortcut(.defaultAction)
        }
        .padding(32)
        .frame(minWidth: 280, minHeight: 160)
    }
}

private struct DemoCard<Content: View>: View {
    let api: String
    @ViewBuilder var content: () -> Content

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            content()
                .frame(width: demoFrameWidth, alignment: .leading)
                .padding(12)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(.separator, lineWidth: 1)
                )
            APICallout(api)
        }
    }
}

private struct VariantBlock<Content: View>: View {
    let title: String
    @ViewBuilder var content: () -> Content

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.headline)
                .foregroundStyle(.primary)
            content()
        }
    }
}

#Preview {
    PresentationSizingPage()
        .frame(width: 1100, height: 800)
}
