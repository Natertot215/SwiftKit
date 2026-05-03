import SwiftUI

// SwiftUI `Scene/defaultSize(\u{2026})` reference page \u{2014} all 5 documented overloads.
// Sources:
//   Documentation/SwiftUI/windows/defaultsize(_:).md
//   Documentation/SwiftUI/windows/defaultsize(width:height:).md
//   Documentation/SwiftUI/windows/defaultsize(width:height:depth:).md
//   Documentation/SwiftUI/windows/defaultsize(_:in:).md
//   Documentation/SwiftUI/windows/defaultsize(width:height:depth:in:).md
// macOS: only the 2D forms apply. The depth-bearing forms are visionOS-only.

struct DefaultSizePage: View {
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

    // MARK: Header

    private var header: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("Scene/defaultSize")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Sets a default initial size for windows the scene creates. Five overloads cover 2D (CGSize / width+height) and 3D volumetric variants.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/windows/defaultsize(_:).md \u{00b7} macOS 13.0+ (2D); visionOS 1.0+ (3D)")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        WindowSnippet(
            api: ".defaultSize(width: 600, height: 400)",
            code: """
            WindowGroup {
                ContentView()
            }
            .defaultSize(width: 600, height: 400)
            """,
            note: "Most common form on macOS. Acts as the initial size for the first window of the scene; user resize and state restoration can override."
        )
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "defaultSize(_:) \u{2014} CGSize") {
                WindowSnippet(
                    api: ".defaultSize(CGSize(width: 600, height: 400))",
                    code: """
                    WindowGroup {
                        ContentView()
                    }
                    .defaultSize(CGSize(width: 600, height: 400))
                    """,
                    note: "Pass an existing CGSize value. Identical effect to (width:height:)."
                )
            }

            VariantBlock(title: "defaultSize(width:height:) \u{2014} explicit dimensions") {
                WindowSnippet(
                    api: ".defaultSize(width: 600, height: 400)",
                    code: """
                    WindowGroup {
                        ContentView()
                    }
                    .defaultSize(width: 600, height: 400)
                    """,
                    note: "The most readable form when you want literal dimensions at the call site."
                )
            }

            VariantBlock(title: "defaultSize(width:height:depth:) \u{2014} volumetric (visionOS)") {
                WindowSnippet(
                    api: ".defaultSize(width: 600, height: 400, depth: 600)",
                    code: """
                    WindowGroup {
                        ContentView()
                    }
                    .windowStyle(.volumetric)
                    .defaultSize(width: 600, height: 400, depth: 600)
                    """,
                    note: "visionOS-only. Volumetric scene size is immutable after creation."
                )
            }

            VariantBlock(title: "defaultSize(_:in:) \u{2014} Size3D in a unit (visionOS)") {
                WindowSnippet(
                    api: ".defaultSize(Size3D(width: 1, height: 1, depth: 0.5), in: .meters)",
                    code: """
                    WindowGroup {
                        ContentView()
                    }
                    .windowStyle(.volumetric)
                    .defaultSize(Size3D(width: 1, height: 1, depth: 0.5), in: .meters)
                    """,
                    note: "visionOS-only. Lets you express scale in meters instead of points."
                )
            }

            VariantBlock(title: "defaultSize(width:height:depth:in:) \u{2014} 3D + units (visionOS)") {
                WindowSnippet(
                    api: ".defaultSize(width: 1, height: 1, depth: 0.5, in: .meters)",
                    code: """
                    WindowGroup {
                        ContentView()
                    }
                    .windowStyle(.volumetric)
                    .defaultSize(width: 1, height: 1, depth: 0.5, in: .meters)
                    """,
                    note: "visionOS-only. Same effect as Size3D-based form, but with explicit dimensions."
                )
            }
        }
    }

    // MARK: States

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            BehaviorList(items: [
                "Default size only applies to the first window of the scene \u{2014} subsequent windows offset slightly to avoid full overlap.",
                "User-resized windows persist via state restoration; the default size does not override a restored size.",
                "If the requested size falls outside the scene's resizability range, the framework clamps the affected dimension.",
                "Affects WindowGroup, Window, DocumentGroup, and Settings on macOS.",
                "Volumetric forms are immutable \u{2014} no resize after creation, no clamp."
            ])
        }
    }

    // MARK: Notes

    private struct DSNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [DSNote] = [
        .init(title: "Five overloads, but only two ship value on macOS.",
              detail: "macOS uses defaultSize(_:) (CGSize) and defaultSize(width:height:). The three depth-bearing variants are visionOS-only \u{2014} they're declared in SwiftUI but have no effect on a non-volumetric Mac scene.",
              symbol: "rectangle.split.3x1"),
        .init(title: "Pair with .windowResizability for hard limits.",
              detail: "defaultSize sets the starting point; windowResizability + the content's frame(min/max:) determine the legal range. Without resizability the user can drag the window to any size.",
              symbol: "arrow.up.left.and.down.right.magnifyingglass"),
        .init(title: "Don't bake sizes into Settings windows by accident.",
              detail: "Settings scenes use .contentSize resizability by default \u{2014} the window grows to its content. Setting an explicit defaultSize on Settings can produce a window with empty padding on first launch.",
              symbol: "gearshape"),
        .init(title: "State restoration trumps defaultSize.",
              detail: "Apple is explicit: \u{201C}during state restoration, the system restores windows to their most recent size rather than the default size.\u{201D} The default value only applies on a true first launch.",
              symbol: "clock.arrow.circlepath"),
        .init(title: "For volumetric, prefer the (in: .meters) form.",
              detail: "Specifying volumetric sizes in meters reads more naturally than points and matches the spatial reasoning the rest of visionOS encourages. Skip when shipping macOS-only.",
              symbol: "ruler")
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

// MARK: - Reusable demo helpers (page-local)

private struct WindowSnippet: View {
    let api: String
    let code: String
    var note: String? = nil

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(code)
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.primary)
                .textSelection(.enabled)
                .padding(12)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(.separator, lineWidth: 1)
                )
            APICallout(api)
            if let note {
                Text(note)
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
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

private struct BehaviorList: View {
    let items: [String]

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            ForEach(items, id: \.self) { item in
                Label {
                    Text(item)
                        .font(.callout)
                        .foregroundStyle(.primary)
                } icon: {
                    Image(systemName: "checkmark.circle")
                        .foregroundStyle(.tint)
                }
            }
        }
        .padding(12)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .strokeBorder(.separator, lineWidth: 1)
        )
    }
}

#Preview {
    DefaultSizePage()
        .frame(width: 1100, height: 800)
}
