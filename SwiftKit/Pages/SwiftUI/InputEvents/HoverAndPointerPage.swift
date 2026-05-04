import SwiftUI

// SwiftUI hover & pointer reference page.
// Covers: onHover, onContinuousHover, HoverPhase, pointerStyle, PointerStyle, pointerVisibility
// Source: Documentation/SwiftUI/input-events/

struct HoverAndPointerPage: View {
    @State private var hovered = false
    @State private var continuousPhase: HoverPhase = .ended
    @State private var hoverLocation: CGPoint = .zero

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
            Text("onHover · onContinuousHover · HoverPhase · PointerStyle")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("Track pointer position and customize the cursor on macOS.")
                .font(.callout).foregroundStyle(.secondary)
            Text("onHover macOS 10.15+ · onContinuousHover macOS 14.0+ · PointerStyle macOS 15.0+")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary)
        }
    }

    private var defaultDemo: some View {
        Block(title: "onHover(perform:) — enter/exit") {
            VStack(alignment: .leading, spacing: 12) {
                RoundedRectangle(cornerRadius: 10)
                    .fill(hovered ? Color.accentColor.opacity(0.25) : Color.secondary.opacity(0.15))
                    .frame(height: 60)
                    .overlay(
                        Text(hovered ? "Pointer is inside" : "Hover over me")
                            .font(.callout)
                            .foregroundStyle(hovered ? .primary : .secondary)
                    )
                    .onHover { inside in hovered = inside }
            }
            APICallout(".onHover { inside in hovered = inside }")
            Text("inside is true when the pointer enters the view's bounds, false when it exits.")
                .font(.footnote).foregroundStyle(.secondary)
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "onContinuousHover(coordinateSpace:perform:) — tracks position") {
                ZStack(alignment: .topLeading) {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.secondary.opacity(0.1))
                        .frame(height: 100)
                        .onContinuousHover { phase in
                            continuousPhase = phase
                            if case .active(let loc) = phase {
                                hoverLocation = loc
                            }
                        }
                    switch continuousPhase {
                    case .active(let loc):
                        Circle()
                            .fill(Color.accentColor)
                            .frame(width: 8, height: 8)
                            .offset(x: loc.x - 4, y: loc.y - 4)
                        Text("(\(Int(loc.x)), \(Int(loc.y)))")
                            .font(.caption).fontDesign(.monospaced)
                            .foregroundStyle(.secondary)
                            .padding(4)
                    case .ended:
                        Text("Move pointer over the box")
                            .font(.callout).foregroundStyle(.secondary)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                }
                APICallout(".onContinuousHover { phase in … }")
                Text("HoverPhase.active(CGPoint) delivers continuous location updates. HoverPhase.ended fires when the pointer leaves.")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "HoverPhase — enum cases") {
                snippet("""
                switch phase {
                case .active(let location):  // pointer at CGPoint in the view's coordinate space
                    updateIndicator(location)
                case .ended:                 // pointer left the view
                    hideIndicator()
                }
                """)
            }

            Block(title: "pointerStyle(_:) — cursor appearance") {
                HStack(spacing: 12) {
                    ForEach([
                        ("Default", PointerStyle.default),
                        ("Link", PointerStyle.link),
                        ("ZoomIn", PointerStyle.zoomIn),
                        ("ZoomOut", PointerStyle.zoomOut),
                    ] as [(String, PointerStyle)], id: \.0) { label, style in
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color.secondary.opacity(0.15))
                            .frame(width: 80, height: 40)
                            .overlay(Text(label).font(.caption2).foregroundStyle(.secondary))
                            .pointerStyle(style)
                    }
                }
                APICallout(".pointerStyle(.link)")
                Text("Hover each box to see the cursor change. PointerStyle is macOS 15.0+.")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "PointerStyle values") {
                snippet("""
                PointerStyle.default              // system arrow
                PointerStyle.link                 // hand / link cursor
                PointerStyle.grabIdle             // open hand
                PointerStyle.grabActive           // closed hand (during grab)
                PointerStyle.zoomIn               // magnify cursor
                PointerStyle.zoomOut              // shrink cursor
                PointerStyle.horizontalText       // horizontal I-beam
                PointerStyle.verticalText         // vertical I-beam
                PointerStyle.rectSelection        // rectangle selection crosshair
                PointerStyle.columnResize(directions:)  // column resize
                PointerStyle.rowResize(directions:)     // row resize
                PointerStyle.frameResize(position:directions:) // frame resize
                PointerStyle.image(_:hotSpot:)    // custom NSImage cursor
                PointerStyle.shape(_:eoFill:size:) // custom Shape cursor
                """)
            }

            Block(title: "pointerVisibility(_:)") {
                snippet("""
                view.pointerVisibility(.hidden)   // hide cursor over this view
                view.pointerVisibility(.visible)  // force visible (default)
                view.pointerVisibility(.automatic) // system decides
                """)
                Text("pointerVisibility lets you hide the system cursor, e.g. over a custom drawing canvas — macOS 15.0+.")
                    .font(.footnote).foregroundStyle(.secondary)
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "coordinateSpace in onContinuousHover") {
                snippet("""
                view.onContinuousHover(coordinateSpace: .named("canvas")) { phase in
                    if case .active(let pt) = phase { drawAt(pt) }
                }
                .coordinateSpace(name: "canvas")
                // Default coordinateSpace is .local (view-relative)
                """)
                Text("Pass a named coordinate space to get positions relative to a specific ancestor rather than the view itself.")
                    .font(.footnote).foregroundStyle(.secondary)
            }
        }
    }

    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            noteRow("cursorarrow", "onHover and onContinuousHover are macOS-primary. On iPadOS with pointer support they also fire, but iOS touch devices don't produce hover events.")
            noteRow("slowmo", "onContinuousHover fires continuously while the pointer moves — avoid heavy computation in the handler. Debounce or use geometry reads with care.")
            noteRow("hand.raised", "pointerStyle(_:) replaces the AppKit NSCursor API for SwiftUI views. You no longer need an NSViewRepresentable to change the cursor.")
            noteRow("eye.slash", "Use pointerVisibility(.hidden) for full-screen drawing canvases or games where the system cursor would be distracting.")
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
    HoverAndPointerPage().frame(width: 1100, height: 900)
}
