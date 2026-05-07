import SwiftUI
import AppKit

// SwiftUI AppKit integration reference page.
// Covers: NSHostingController, NSHostingView, NSHostingSizingOptions,
//         NSHostingSceneBridgingOptions, NSHostingSceneRepresentation
// Source: Documentation/SwiftUI/appkit-integration/

// NSViewRepresentable that wraps an NSHostingView — shows SwiftUI inside AppKit inside SwiftUI.
private struct HostedSwiftUIView: NSViewRepresentable {
    var message: String
    var accentColor: Color

    func makeNSView(context: Context) -> NSView {
        let swiftUIView = VStack(spacing: 8) {
            Image(systemName: "swift")
                .font(.largeTitle)
                .foregroundStyle(accentColor)
            Text(message)
                .font(.headline)
                .foregroundStyle(.primary)
            Text("Rendered by NSHostingView<Content>")
                .font(.caption)
                .foregroundStyle(.secondary)
        }
        .padding(16)
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 12))

        let host = NSHostingView(rootView: swiftUIView)
        host.sizingOptions = [.minSize, .preferredContentSize]
        return host
    }

    func updateNSView(_ nsView: NSView, context: Context) {
        guard let host = nsView as? NSHostingView<AnyView> else { return }
        host.rootView = AnyView(
            VStack(spacing: 8) {
                Image(systemName: "swift").font(.largeTitle).foregroundStyle(accentColor)
                Text(message).font(.headline).foregroundStyle(.primary)
                Text("Rendered by NSHostingView<Content>")
                    .font(.caption).foregroundStyle(.secondary)
            }
            .padding(16)
            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 12))
        )
    }
}

struct NSHostingViewGalleryPage: View {
    @State private var message = "Hello from SwiftUI"
    @State private var accent: Color = .accentColor

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
            Text("NSHostingView · NSHostingController · NSHostingSizingOptions")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("Embed SwiftUI views in AppKit hierarchies.")
                .font(.callout).foregroundStyle(.secondary)
            Text("macOS 10.15+")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary)
        }
    }

    private var defaultDemo: some View {
        Block(title: "NSHostingView wrapping a SwiftUI view (via NSViewRepresentable)") {
            VStack(alignment: .leading, spacing: 12) {
                HStack {
                    Text("Message:").font(.caption).foregroundStyle(.secondary)
                    TextField("", text: $message)
                        .textFieldStyle(.roundedBorder)
                        .frame(maxWidth: 220)
                }
                HostedSwiftUIView(message: message, accentColor: accent)
                    .frame(height: 120)
                    .overlay(Rectangle().strokeBorder(.separator, lineWidth: 1))
            }
            APICallout("NSHostingView(rootView: swiftUIView)")
            Text("The bordered area is an NSHostingView<VStack> embedded via NSViewRepresentable. It sizes itself to fit its SwiftUI content.")
                .font(.footnote).foregroundStyle(.secondary)
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "NSHostingView — key properties") {
                snippet("""
                let host = NSHostingView(rootView: MyView())

                // Update the hosted view:
                host.rootView = MyView(data: newData)

                // Sizing options — controls intrinsic content size:
                host.sizingOptions = []                        // no intrinsic size
                host.sizingOptions = .minSize                  // honors minimums
                host.sizingOptions = .preferredContentSize     // full intrinsic sizing
                host.sizingOptions = [.minSize, .preferredContentSize]

                // Scene bridging (macOS 13+):
                host.sceneBridgingOptions = .all               // bridge title bar, toolbar…
                host.sceneBridgingOptions = []                 // no bridging
                """)
            }

            Block(title: "NSHostingSizingOptions — values") {
                snippet("""
                NSHostingSizingOptions.minSize               // floor: layout minimum
                NSHostingSizingOptions.preferredContentSize  // intrinsic: ideal size
                NSHostingSizingOptions.standardBounds        // standard sizing bounds
                NSHostingSizingOptions.maxSize               // ceiling: layout max
                """)
                Text("NSHostingSizingOptions is an OptionSet. The default is [] — NSHostingView does not impose an intrinsic size by default on older SDKs; macOS 26 uses .standardBounds.")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "NSHostingController — view controller wrapper") {
                snippet("""
                // Create a view controller from a SwiftUI view:
                let vc = NSHostingController(rootView: MyView())

                // Present it:
                present(vc, animator: …)
                // or add as a child view controller:
                addChild(vc)
                view.addSubview(vc.view)
                vc.view.frame = containerView.bounds

                // Update:
                vc.rootView = MyView(newData: …)
                """)
                Text("NSHostingController is the AppKit container for SwiftUI. Use it when you need a full NSViewController (e.g. presenting modally or as a child VC).")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "NSHostingSceneBridgingOptions") {
                snippet("""
                // macOS 13+: controls which window chrome SwiftUI can drive:
                host.sceneBridgingOptions = .all
                // .all = toolbar + title + sidebar + toolbarItem

                host.sceneBridgingOptions = []
                // = off: AppKit manages toolbar/title natively

                host.sceneBridgingOptions = [.toolbar]
                // Only bridge toolbar items
                """)
                Text("Scene bridging lets a SwiftUI view hosted in NSHostingView still drive the window toolbar via .toolbar(content:) — useful during incremental SwiftUI migrations.")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "NSHostingSceneRepresentation") {
                snippet("""
                // NSHostingSceneRepresentation lets NSHostingView present
                // multiple scenes from a SwiftUI Scene graph:
                let sceneRep = NSHostingSceneRepresentation(
                    rootView: MyMultiSceneView()
                )
                // Typically managed by NSHostingController internally.
                // Expose via host.sceneRepresentation for advanced use.
                """)
                Text("NSHostingSceneRepresentation is an advanced API for integrating SwiftUI's scene lifecycle with AppKit window management.")
                    .font(.footnote).foregroundStyle(.secondary)
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "Incremental migration pattern") {
                snippet("""
                // Step 1: Wrap an existing NSView in NSViewRepresentable for SwiftUI
                // Step 2: Replace inner AppKit views with SwiftUI via NSHostingView
                // Step 3: Eventually, the NSViewRepresentable wrapper can be removed

                // AppKit view that hosts a SwiftUI detail panel:
                class MyAppKitView: NSView {
                    lazy var swiftUIHost: NSHostingView<DetailPanel> = {
                        let host = NSHostingView(rootView: DetailPanel())
                        host.translatesAutoresizingMaskIntoConstraints = false
                        addSubview(host)
                        NSLayoutConstraint.activate([…])
                        return host
                    }()
                }
                """)
            }
        }
    }

    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            noteRow("arrow.left.and.right", "NSHostingView embeds SwiftUI in AppKit. NSViewRepresentable embeds AppKit in SwiftUI. Both directions are first-class.")
            noteRow("ruler", "NSHostingSizingOptions.preferredContentSize makes NSHostingView behave like an NSView with an intrinsic content size — it participates in Auto Layout sizing.")
            noteRow("link.badge.plus", "sceneBridgingOptions allows SwiftUI .toolbar(content:) to work inside NSHostingView — critical during phased migrations from AppKit to SwiftUI.")
            noteRow("exclamationmark.triangle", "Avoid nesting deep SwiftUI → AppKit → SwiftUI stacks (NSViewRepresentable inside NSHostingView inside NSViewRepresentable) — layout conflicts are common.")
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

extension NSHostingViewGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.appKitIntegration.nsHostingView",
        title: "NSHostingView",
        folder: "AppKit integration",
        framework: .swiftUI,
        absorbedSymbols: ["NSHostingView"],
        blurb: "An AppKit view that hosts a SwiftUI view hierarchy. Drop into an existing AppKit view tree to surface SwiftUI content as an NSView subclass while SwiftUI manages layout and event delivery.",
        signature: "class NSHostingView<Content> where Content : View",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/appkit-integration/nshostingview.md",
        page: { AnyView(NSHostingViewGalleryPage()) }
    )
}

#Preview {
    NSHostingViewGalleryPage().frame(width: 1100, height: 900)
}
