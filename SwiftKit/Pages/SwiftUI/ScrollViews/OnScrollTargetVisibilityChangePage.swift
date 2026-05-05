import SwiftUI

// SwiftUI `View/onScrollTargetVisibilityChange(idType:threshold:_:)` reference page.
// Source: Documentation/SwiftUI/scroll-views/onscrolltargetvisibilitychange(idtype:threshold:_:).md
// macOS 15.0+. Reports which scroll targets have crossed a visibility threshold.

struct OnScrollTargetVisibilityChangePage: View {
    @State private var visibleIDs: [Int] = []

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
            Text("View/onScrollTargetVisibilityChange(idType:threshold:_:)")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("Reports which scroll targets within a scrollTargetLayout have crossed the visibility threshold to be considered on-screen. Use to throttle expensive work like video playback to the visible cards.")
                .font(.callout).foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/scroll-views/onscrolltargetvisibilitychange(idtype:threshold:_:).md \u{00b7} macOS 15.0+")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        VStack(alignment: .leading, spacing: 12) {
            APICallout(".onScrollTargetVisibilityChange(idType: Int.self, threshold: 0.5) { ids in visibleIDs = ids.sorted() }")
            HStack(spacing: 8) {
                Text("visible IDs:")
                    .font(.caption).foregroundStyle(.secondary)
                Text(visibleIDs.map(String.init).joined(separator: ", "))
                    .font(.caption).fontDesign(.monospaced).foregroundStyle(.primary)
                Spacer()
            }

            ScrollView {
                LazyVStack(spacing: 6) {
                    ForEach(0..<20) { i in
                        cardView(index: i, highlighted: visibleIDs.contains(i))
                    }
                }
                .scrollTargetLayout()
                .padding(8)
            }
            .frame(height: 240)
            .onScrollTargetVisibilityChange(idType: Int.self, threshold: 0.5) { ids in
                visibleIDs = ids.sorted()
            }
            .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
            .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
        }
    }

    private func cardView(index: Int, highlighted: Bool) -> some View {
        HStack {
            Circle()
                .fill(highlighted ? AnyShapeStyle(.tint) : AnyShapeStyle(Color.secondary.opacity(0.4)))
                .frame(width: 10, height: 10)
            Text("Target \(index)").font(.callout).foregroundStyle(.primary)
            Spacer()
        }
        .padding(.horizontal, 12).padding(.vertical, 12)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.background.tertiary, in: RoundedRectangle(cornerRadius: 6))
        .overlay(RoundedRectangle(cornerRadius: 6).strokeBorder(.separator.opacity(0.6), lineWidth: 1))
        .id(index)
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 20) {
            VStack(alignment: .leading, spacing: 8) {
                Text("Threshold values").font(.headline).foregroundStyle(.primary)
                APICallout(".onScrollTargetVisibilityChange(idType: Int.self, threshold: 0.0) { … }  // any pixel onscreen")
                APICallout(".onScrollTargetVisibilityChange(idType: Int.self, threshold: 0.5) { … }  // half the target")
                APICallout(".onScrollTargetVisibilityChange(idType: Int.self, threshold: 1.0) { … }  // fully on-screen")
                Text("threshold is the fraction of each target that must be inside the scroll viewport before its ID is included in the callback's array.")
                    .font(.callout).foregroundStyle(.secondary)
            }

            VStack(alignment: .leading, spacing: 8) {
                Text("Required scaffolding").font(.headline).foregroundStyle(.primary)
                APICallout("""
ScrollView {
    LazyVStack {
        ForEach(models) { model in
            CardView(model: model)
        }
    }
    .scrollTargetLayout()
}
.onScrollTargetVisibilityChange(idType: Model.ID.self, threshold: 0.5) { ids in … }
""")
                Text("scrollTargetLayout() must be applied to the lazy stack so SwiftUI knows which subviews are the scroll targets.")
                    .font(.callout).foregroundStyle(.secondary)
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Callback signature").font(.headline).foregroundStyle(.primary)
            APICallout("(action: ([ID]) -> Void)")
            Text("The callback receives the full current set of visible IDs, not deltas. Compare against the previous set yourself if you need enter/exit events.")
                .font(.callout).foregroundStyle(.secondary)
        }
    }

    private let notes: [(title: String, detail: String, symbol: String)] = [
        ("Drives video / autoplay throttling.", "The canonical use is pausing playback for cards that scrolled off-screen. The callback fires when items cross the threshold, so heavy work doesn't run for off-screen content.", "play.rectangle"),
        ("Identity must be Hashable.", "Use the model's stable ID type. Don't use array indices \u{2014} they shift when content changes.", "key"),
        ("Pair with onScrollVisibilityChange for self-tracking.", "If a single view needs to know its own visibility, use onScrollVisibilityChange(threshold:_:) instead.", "eye"),
        ("Initial state.", "On first appearance, the callback fires with whatever IDs already meet the threshold.", "play.circle")
    ]

    @ViewBuilder
    private var notesContent: some View {
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

#Preview {
    OnScrollTargetVisibilityChangePage().frame(width: 1100, height: 1100)
}
