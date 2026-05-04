import SwiftUI
import AppKit

// SwiftUI NSGestureRecognizerRepresentable reference page.
// Covers: NSGestureRecognizerRepresentable, NSGestureRecognizerRepresentableContext,
//         NSGestureRecognizerRepresentableCoordinateSpaceConverter, NSHostingMenu
// Source: Documentation/SwiftUI/appkit-integration/

// Demo: wrap NSClickGestureRecognizer using NSGestureRecognizerRepresentable
private struct ClickCountRecognizer: NSGestureRecognizerRepresentable {
    var onTap: (Int) -> Void

    func makeNSGestureRecognizer(context: Context) -> NSClickGestureRecognizer {
        let gr = NSClickGestureRecognizer()
        gr.numberOfClicksRequired = 2
        return gr
    }

    func updateNSGestureRecognizer(_ recognizer: NSClickGestureRecognizer, context: Context) {}

    func handleNSGestureRecognizerAction(
        _ recognizer: NSClickGestureRecognizer,
        context: Context
    ) {
        onTap(recognizer.numberOfClicksRequired)
    }
}

struct NSGestureRecognizerRepresentablePage: View {
    @State private var tapCount = 0
    @State private var lastTapLocation = CGPoint.zero

    var body: some View {
        GalleryPageScaffold {
            header
        } defaultRender: {
            defaultDemo
        } variants: {
            variantsContent
        } states: {
            EmptyView()
        } notes: {
            notesContent
        }
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("NSGestureRecognizerRepresentable · NSHostingMenu")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("Bridge AppKit gesture recognizers into SwiftUI, and use NSHostingMenu.")
                .font(.callout).foregroundStyle(.secondary)
            Text("NSGestureRecognizerRepresentable macOS 14.0+ · NSHostingMenu macOS 14.0+")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary)
        }
    }

    private var defaultDemo: some View {
        Block(title: "NSGestureRecognizerRepresentable — double-click recognizer") {
            VStack(alignment: .leading, spacing: 12) {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.secondary.opacity(0.1))
                        .frame(height: 80)
                    VStack(spacing: 4) {
                        Text("Double-click me")
                            .font(.callout).foregroundStyle(.secondary)
                        if tapCount > 0 {
                            Text("Fires: \(tapCount)")
                                .font(.caption).fontDesign(.monospaced)
                                .foregroundStyle(.secondary)
                        }
                    }
                }
                .gesture(ClickCountRecognizer { _ in tapCount += 1 })
            }
            APICallout("view.gesture(MyNSGestureRecognizerRepresentable())")
            Text("NSGestureRecognizerRepresentable lets you attach any AppKit NSGestureRecognizer to a SwiftUI view via the .gesture(_:) modifier.")
                .font(.footnote).foregroundStyle(.secondary)
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "NSGestureRecognizerRepresentable — protocol requirements") {
                snippet("""
                struct MyPressGesture: NSGestureRecognizerRepresentable {
                    // 1. Create the recognizer:
                    func makeNSGestureRecognizer(context: Context) -> NSPressGestureRecognizer {
                        let gr = NSPressGestureRecognizer()
                        gr.minimumPressDuration = 0.5
                        return gr
                    }

                    // 2. Update when SwiftUI state changes:
                    func updateNSGestureRecognizer(
                        _ recognizer: NSPressGestureRecognizer,
                        context: Context
                    ) {
                        recognizer.isEnabled = context.environment.isEnabled
                    }

                    // 3. Handle recognition:
                    func handleNSGestureRecognizerAction(
                        _ recognizer: NSPressGestureRecognizer,
                        context: Context
                    ) {
                        let location = recognizer.location(in: recognizer.view)
                        context.coordinator.handlePress(at: location)
                    }

                    // 4. Optional: Coordinator for complex delegation
                    class Coordinator: NSObject, NSGestureRecognizerDelegate {
                        func handlePress(at point: CGPoint) { … }
                    }
                    func makeCoordinator() -> Coordinator { Coordinator() }
                }
                """)
            }

            Block(title: "NSGestureRecognizerRepresentableContext") {
                snippet("""
                // context is NSGestureRecognizerRepresentableContext<Self>
                context.coordinator   // your Coordinator instance
                context.environment   // SwiftUI Environment values
                context.transaction   // SwiftUI Transaction

                // Coordinate space conversion:
                context.converter.convert(point, from: sourceSpace)
                context.converter.convert(point, to: targetSpace)
                // NSGestureRecognizerRepresentableCoordinateSpaceConverter
                """)
                Text("The context provides your Coordinator, the SwiftUI Environment, and a coordinate converter for translating between AppKit and SwiftUI coordinate spaces.")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "NSGestureRecognizerRepresentableCoordinateSpaceConverter") {
                snippet("""
                // Convert a CGPoint from the recognizer's view to a SwiftUI named space:
                let pt = context.converter.convert(
                    recognizer.location(in: recognizer.view),
                    from: .named("myCanvas")
                )
                // Available coordinate spaces:
                // .global  — screen coordinates
                // .local   — view-local
                // .named(_:) — named space set with .coordinateSpace(name:)
                // .scrollView — inside a ScrollView
                """)
            }

            Block(title: "NSHostingMenu — SwiftUI-driven NSMenu") {
                snippet("""
                // NSHostingMenu wraps an NSMenu with SwiftUI content:
                let menu = NSHostingMenu(rootView:
                    Group {
                        Button("Open") { open() }
                        Button("Save") { save() }
                        Divider()
                        Button("Quit") { NSApp.terminate(nil) }
                    }
                )
                // Attach to an NSStatusItem, NSPopUpButton, or right-click:
                statusItem.menu = menu
                """)
                Text("NSHostingMenu is macOS 14.0+. It provides an NSMenu-compatible object backed by SwiftUI views — useful for status bar menus and contextual menus in AppKit code.")
                    .font(.footnote).foregroundStyle(.secondary)
            }
        }
    }

    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            noteRow("hand.tap", "NSGestureRecognizerRepresentable is the SwiftUI equivalent of UIGestureRecognizerRepresentable on iOS. It bridges full AppKit gesture recognizers into the SwiftUI gesture system.")
            noteRow("arrow.left.arrow.right", "NSGestureRecognizerRepresentableCoordinateSpaceConverter handles the AppKit (Y-up) ↔ SwiftUI (Y-down) coordinate flip automatically.")
            noteRow("contextualmenu.and.cursorarrow", "NSHostingMenu is the cleanest way to back a status bar or right-click NSMenu with SwiftUI views without manually syncing state.")
            noteRow("exclamationmark.triangle", "Don't add NSGestureRecognizers directly to NSViewRepresentable views when NSGestureRecognizerRepresentable exists — it integrates with SwiftUI's gesture priority system correctly.")
        }
    }

    private func noteRow(_ symbol: String, _ text: String) -> some View {
        Label(text, systemImage: symbol)
            .font(.callout).foregroundStyle(.secondary)
    }

    private func snippet(_ code: String) -> some View {
        Text(code)
            .font(.caption).fontDesign(.monospaced)
            .foregroundStyle(.primary)
            .textSelection(.enabled)
            .padding(12)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
            .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
    }
}

private struct Block<Content: View>: View {
    let title: String
    @ViewBuilder var content: () -> Content
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title).font(.headline).foregroundStyle(.primary)
            content()
        }
    }
}

#Preview {
    NSGestureRecognizerRepresentablePage().frame(width: 1100, height: 900)
}
