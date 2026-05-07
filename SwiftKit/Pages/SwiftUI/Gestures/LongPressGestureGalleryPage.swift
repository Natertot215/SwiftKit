import SwiftUI

struct LongPressGestureGalleryPage: View {
    @State private var pressed: Bool = false
    @State private var pressing: Bool = false
    @GestureState private var pressingState: Bool = false
    @State private var customDuration: Double = 1.0

    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            VariantTile(
                name: ".onLongPressGesture { perform: }",
                api: ".onLongPressGesture(minimumDuration: 0.5) { pressed.toggle() }"
            ) {
                VStack(spacing: 8) {
                    Circle()
                        .fill(pressed ? Color.accentColor : Color.accentColor.opacity(0.25))
                        .frame(width: 56, height: 56)
                        .onLongPressGesture(minimumDuration: 0.5) {
                            pressed.toggle()
                        }
                    Text(pressed ? "ON" : "OFF")
                        .font(.caption)
                        .fontDesign(.monospaced)
                        .foregroundStyle(.secondary)
                }
            }

            VariantTile(
                name: "onPressingChanged",
                api: ".onLongPressGesture(perform: …, onPressingChanged: { pressing = $0 })"
            ) {
                VStack(spacing: 8) {
                    Circle()
                        .fill(pressing ? Color.accentColor.opacity(0.6) : Color.accentColor.opacity(0.25))
                        .frame(width: 56, height: 56)
                        .scaleEffect(pressing ? 0.92 : 1.0)
                        .animation(.easeOut(duration: 0.12), value: pressing)
                        .onLongPressGesture(minimumDuration: 0.4) {
                            // success
                        } onPressingChanged: { p in
                            pressing = p
                        }
                    Text(pressing ? "pressing" : "idle")
                        .font(.caption)
                        .fontDesign(.monospaced)
                        .foregroundStyle(.secondary)
                }
            }

            VariantTile(
                name: "LongPressGesture + @GestureState",
                api: "LongPressGesture(minimumDuration: 1).updating($pressingState) { … }"
            ) {
                VStack(spacing: 8) {
                    Capsule()
                        .fill(pressingState ? Color.accentColor.opacity(0.6) : Color.accentColor.opacity(0.25))
                        .frame(width: 96, height: 36)
                        .gesture(
                            LongPressGesture(minimumDuration: 1.0)
                                .updating($pressingState) { value, state, _ in
                                    state = value
                                }
                        )
                    Text(pressingState ? "holding…" : "press and hold")
                        .font(.caption)
                        .fontDesign(.monospaced)
                        .foregroundStyle(.secondary)
                }
            }

            VariantTile(
                name: "minimumDuration parameter",
                api: ".onLongPressGesture(minimumDuration: customDuration)"
            ) {
                VStack(spacing: 8) {
                    Slider(value: $customDuration, in: 0.2...2.5)
                        .frame(width: 140)
                    Circle()
                        .fill(Color.accentColor.opacity(0.3))
                        .frame(width: 48, height: 48)
                        .onLongPressGesture(minimumDuration: customDuration) {
                            pressed.toggle()
                        }
                    Text(String(format: "%.1f s", customDuration))
                        .font(.caption)
                        .fontDesign(.monospaced)
                        .foregroundStyle(.secondary)
                }
            }

            ReferenceTile(
                name: "LongPressGesture",
                signature: "struct LongPressGesture : Gesture  // Value == Bool",
                note: "Succeeds when the user presses and holds for minimumDuration without moving more than maximumDistance. The gesture's value is true while pressing, false when canceled."
            )

            ReferenceTile(
                name: ".onLongPressGesture overloads",
                signature: ".onLongPressGesture(minimumDuration: ..., maximumDistance: ..., perform:, onPressingChanged:)",
                note: "Modifier shortcut for the common case. The minimumDuration default is 0.5; maximumDistance gates how far the pointer can drift before the press cancels."
            )

            ReferenceTile(
                name: ".onLongTouchGesture",
                signature: ".onLongTouchGesture(minimumDuration:perform:onTouchingChanged:)",
                note: "Touch-only sibling of onLongPressGesture — fires on direct touches and ignores indirect (mouse) input. Useful when an interaction must require a finger, not a cursor.",
                badge: "iOS 18 / iPadOS 18"
            )
        }
    }
}

extension LongPressGestureGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.gestures.longPressGesture",
        title: "LongPressGesture",
        folder: "Gestures",
        framework: .swiftUI,
        absorbedSymbols: [
            "LongPressGesture",
            "View/onLongPressGesture(minimumDuration:maximumDistance:perform:onPressingChanged:)",
            "View/onLongPressGesture(minimumDuration:perform:onPressingChanged:)",
            "View/onLongTouchGesture(minimumDuration:perform:onTouchingChanged:)"
        ],
        blurb: "A gesture that succeeds when the user performs a long press. Pair with the onLongPressGesture(...) modifier for the common case, or attach a LongPressGesture instance via gesture(_:) for full updating/onChanged/onEnded callbacks.",
        signature: "struct LongPressGesture",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/gestures/longpressgesture.md",
        page: { AnyView(LongPressGestureGalleryPage()) }
    )
}

#Preview {
    LongPressGestureGalleryPage()
        .frame(width: 900, height: 700)
}
