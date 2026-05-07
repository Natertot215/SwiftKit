import SwiftUI

struct AnyGestureGalleryPage: View {
    @State private var dragOffset: CGSize = .zero
    @State private var tapCount: Int = 0
    @State private var useDrag: Bool = true

    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            VariantTile(
                name: "AnyGesture(_:)",
                api: "AnyGesture(DragGesture().onChanged { … })"
            ) {
                VStack(spacing: 8) {
                    Capsule()
                        .fill(Color.accentColor.opacity(0.3))
                        .frame(width: 96, height: 36)
                        .offset(dragOffset)
                        .gesture(
                            AnyGesture(
                                DragGesture()
                                    .onChanged { dragOffset = $0.translation }
                                    .onEnded { _ in
                                        withAnimation(.spring) { dragOffset = .zero }
                                    }
                                    .map { _ in () }
                            )
                        )
                    Text("dx \(Int(dragOffset.width)), dy \(Int(dragOffset.height))")
                        .font(.caption)
                        .fontDesign(.monospaced)
                        .foregroundStyle(.secondary)
                }
            }

            VariantTile(
                name: "Heterogeneous return",
                api: "func makeGesture() -> AnyGesture<Void>"
            ) {
                VStack(spacing: 8) {
                    Toggle("Use drag", isOn: $useDrag)
                        .toggleStyle(.switch)
                        .labelsHidden()
                    Circle()
                        .fill(Color.accentColor.opacity(0.3))
                        .frame(width: 48, height: 48)
                        .gesture(currentGesture)
                    Text("taps: \(tapCount)")
                        .font(.caption)
                        .fontDesign(.monospaced)
                        .foregroundStyle(.secondary)
                }
            }

            ReferenceTile(
                name: "AnyGesture",
                signature: "@frozen struct AnyGesture<Value> : Gesture",
                note: "Type-erases any Gesture so you can return different gesture types from the same property or function. Use .map { _ in value } to coerce the inner gesture's Value to AnyGesture's generic parameter when types don't match."
            )

            ReferenceTile(
                name: "Why AnyGesture exists",
                signature: "AnyGesture(DragGesture()) — vs returning DragGesture directly",
                note: "Without type erasure, a function or computed property must commit to a single concrete Gesture type. AnyGesture lets a single API return DragGesture in one branch and TapGesture in another."
            )
        }
    }

    private var currentGesture: AnyGesture<Void> {
        if useDrag {
            return AnyGesture(
                DragGesture()
                    .onEnded { _ in tapCount += 1 }
                    .map { _ in () }
            )
        } else {
            return AnyGesture(
                TapGesture()
                    .onEnded { tapCount += 1 }
                    .map { _ in () }
            )
        }
    }
}

extension AnyGestureGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.gestures.anyGesture",
        title: "AnyGesture",
        folder: "Gestures",
        framework: .swiftUI,
        absorbedSymbols: [
            "AnyGesture"
        ],
        blurb: "A type-erased gesture. Use AnyGesture to return heterogeneous gesture types from a single property or function.",
        signature: "@frozen struct AnyGesture<Value>",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/gestures/anygesture.md",
        page: { AnyView(AnyGestureGalleryPage()) }
    )
}

#Preview {
    AnyGestureGalleryPage()
        .frame(width: 900, height: 700)
}
