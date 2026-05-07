import SwiftUI

struct GestureGalleryPage: View {
    @State private var tapCount: Int = 0
    @GestureState private var dragOffset: CGSize = .zero
    @State private var simultaneousLog: String = "—"
    @State private var exclusiveLog: String = "—"
    @State private var sequenceLog: String = "—"
    @State private var pressed: Bool = false

    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            VariantTile(
                name: ".gesture(_:) — TapGesture",
                api: ".gesture(TapGesture().onEnded { tapCount += 1 })"
            ) {
                VStack(spacing: 8) {
                    Circle()
                        .fill(Color.accentColor.opacity(0.3))
                        .frame(width: 56, height: 56)
                        .gesture(TapGesture().onEnded { tapCount += 1 })
                    Text("tapCount: \(tapCount)")
                        .font(.caption)
                        .fontDesign(.monospaced)
                        .foregroundStyle(.secondary)
                }
            }

            VariantTile(
                name: "@GestureState — DragGesture",
                api: "@GestureState var dragOffset; .updating { … }"
            ) {
                VStack(spacing: 8) {
                    Capsule()
                        .fill(Color.accentColor.opacity(0.3))
                        .frame(width: 96, height: 32)
                        .offset(dragOffset)
                        .gesture(
                            DragGesture()
                                .updating($dragOffset) { value, state, _ in
                                    state = value.translation
                                }
                        )
                    Text("dx \(Int(dragOffset.width)), dy \(Int(dragOffset.height))")
                        .font(.caption)
                        .fontDesign(.monospaced)
                        .foregroundStyle(.secondary)
                }
            }

            VariantTile(
                name: "SimultaneousGesture",
                api: "TapGesture().simultaneously(with: LongPressGesture())"
            ) {
                VStack(spacing: 8) {
                    Circle()
                        .fill(pressed ? Color.accentColor.opacity(0.5) : Color.accentColor.opacity(0.2))
                        .frame(width: 56, height: 56)
                        .gesture(
                            TapGesture()
                                .simultaneously(with: LongPressGesture(minimumDuration: 0.3))
                                .onEnded { value in
                                    pressed = value.second != nil
                                    simultaneousLog = "tap=\(value.first != nil ? "yes" : "no"), long=\(value.second != nil ? "yes" : "no")"
                                }
                        )
                    Text(simultaneousLog)
                        .font(.caption)
                        .fontDesign(.monospaced)
                        .foregroundStyle(.secondary)
                }
            }

            VariantTile(
                name: "ExclusiveGesture",
                api: "TapGesture(count: 2).exclusively(before: TapGesture())"
            ) {
                VStack(spacing: 8) {
                    Circle()
                        .fill(Color.accentColor.opacity(0.3))
                        .frame(width: 56, height: 56)
                        .gesture(
                            TapGesture(count: 2)
                                .exclusively(before: TapGesture())
                                .onEnded { value in
                                    switch value {
                                    case .first:  exclusiveLog = "double tap"
                                    case .second: exclusiveLog = "single tap"
                                    }
                                }
                        )
                    Text(exclusiveLog)
                        .font(.caption)
                        .fontDesign(.monospaced)
                        .foregroundStyle(.secondary)
                }
            }

            VariantTile(
                name: "SequenceGesture",
                api: "LongPressGesture().sequenced(before: DragGesture())"
            ) {
                VStack(spacing: 8) {
                    Circle()
                        .fill(Color.accentColor.opacity(0.3))
                        .frame(width: 56, height: 56)
                        .gesture(
                            LongPressGesture(minimumDuration: 0.4)
                                .sequenced(before: DragGesture())
                                .onChanged { value in
                                    switch value {
                                    case .first:        sequenceLog = "long-press"
                                    case .second(_, let drag?):
                                        sequenceLog = "drag dx \(Int(drag.translation.width))"
                                    case .second(_, nil):
                                        sequenceLog = "ready to drag"
                                    }
                                }
                                .onEnded { _ in sequenceLog = "ended" }
                        )
                    Text(sequenceLog)
                        .font(.caption)
                        .fontDesign(.monospaced)
                        .foregroundStyle(.secondary)
                }
            }

            VariantTile(
                name: ".highPriorityGesture(_:)",
                api: ".highPriorityGesture(TapGesture().onEnded { … })"
            ) {
                VStack(spacing: 8) {
                    Button("Inner Button") { /* ignored */ }
                        .highPriorityGesture(
                            TapGesture().onEnded { tapCount += 1 }
                        )
                    Text("tapCount: \(tapCount)")
                        .font(.caption)
                        .fontDesign(.monospaced)
                        .foregroundStyle(.secondary)
                }
            }

            ReferenceTile(
                name: "Gesture protocol",
                signature: "@MainActor protocol Gesture<Value> { associatedtype Value; associatedtype Body : Gesture; var body: Self.Body { get } }",
                note: "Every concrete gesture type — TapGesture, DragGesture, MagnifyGesture, etc. — conforms to Gesture. The associatedtype Value is the data delivered to onChanged / onEnded handlers."
            )

            ReferenceTile(
                name: "GestureMask",
                signature: "struct GestureMask : OptionSet  // .gesture, .subviews, .all, .none",
                note: "Used by .gesture(_:including:) and friends to control how the new gesture interacts with subview gestures. .gesture disables subview gestures while this one is active; .all lets both compete."
            )

            ReferenceTile(
                name: "@GestureState",
                signature: "@propertyWrapper struct GestureState<Value> : DynamicProperty",
                note: "A property wrapper that lives only while the gesture is active and resets to its initial value when the gesture ends. Pair with .updating(_:body:) to track in-progress gesture data without needing to manually reset."
            )

            ReferenceTile(
                name: "Composition operators",
                signature: "simultaneously(with:)  ·  exclusively(before:)  ·  sequenced(before:)",
                note: "SwiftUI exposes three combinators on Gesture: simultaneously runs both at once (SimultaneousGesture<A,B>), exclusively prefers the first (ExclusiveGesture), sequenced runs A then B (SequenceGesture)."
            )

            ReferenceTile(
                name: "View.gesture overloads",
                signature: ".gesture(_:)  ·  .gesture(_:including:)  ·  .gesture(_:isEnabled:)  ·  .gesture(_:name:isEnabled:)",
                note: "Attach a gesture to a view. The variants add a GestureMask, an enable toggle, or a stable name used for state preservation."
            )

            ReferenceTile(
                name: "highPriorityGesture / simultaneousGesture",
                signature: ".highPriorityGesture(_:)  ·  .simultaneousGesture(_:)",
                note: "highPriorityGesture wins over child views' built-in gestures (intercepts before subviews). simultaneousGesture lets both this gesture and child gestures fire together."
            )
        }
    }
}

extension GestureGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.gestures.gesture",
        title: "Gesture",
        folder: "Gestures",
        framework: .swiftUI,
        absorbedSymbols: [
            "Adding interactivity with gestures",
            "Composing SwiftUI gestures",
            "ExclusiveGesture",
            "Gesture",
            "GestureMask",
            "GestureState",
            "GestureStateGesture",
            "SequenceGesture",
            "SimultaneousGesture",
            "View/gesture(_:)",
            "View/gesture(_:including:)",
            "View/gesture(_:isEnabled:)",
            "View/gesture(_:name:isEnabled:)",
            "View/highPriorityGesture(_:including:)",
            "View/highPriorityGesture(_:isEnabled:)",
            "View/highPriorityGesture(_:name:isEnabled:)",
            "View/simultaneousGesture(_:including:)",
            "View/simultaneousGesture(_:isEnabled:)",
            "View/simultaneousGesture(_:name:isEnabled:)"
        ],
        blurb: "The protocol that all SwiftUI gestures conform to, attached to views via the gesture(_:) family and tracked with @GestureState. Composition wrappers layer recognizers together: HighPriorityGesture intercepts ahead of children, SimultaneousGesture runs two recognizers in parallel, ExclusiveGesture lets only one win, and SequenceGesture chains one after another.",
        signature: "Gesture \u{00b7} HighPriorityGesture \u{00b7} SimultaneousGesture \u{00b7} ExclusiveGesture \u{00b7} SequenceGesture \u{00b7} GestureMask \u{00b7} GestureState",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/gestures/gesture.md",
        page: { AnyView(GestureGalleryPage()) }
    )
}

#Preview {
    GestureGalleryPage()
        .frame(width: 900, height: 700)
}
