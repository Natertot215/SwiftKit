import SwiftUI

/// One cell in a `GalleryItemPage` grid. Each tile renders as a discrete card —
/// a title-bar zone with the variant name, a demo area showing the rendered
/// Apple primitive, and (optionally) an API call footer.
///
/// Visual model: the gallery page is the "desk surface"; each tile is a
/// document card sitting on top of it. Card chrome (raised background, static
/// drop shadow, 12pt corner radius) creates the floating-document feel
/// referenced from Notes.app's gallery view. No hover elevation — the cards
/// are sample plates, not interactive controls.
///
/// Per L-012: chrome uses semantic tokens — `Color(nsColor: .controlBackgroundColor)`
/// for the raised fill, `.separator` for the edge, `.primary` / `.secondary`
/// for text. The drop shadow uses `.black.opacity(...)` as decorative depth
/// (not a system color token being replaced).
///
/// AppKit bridges (NSTableView, NSCollectionView) opt into taller demo wells
/// via the `height:` parameter — the adaptive `LazyVGrid` honors per-cell
/// intrinsic heights so promoted tiles slot in without breaking the grid.
struct VariantTile<Demo: View>: View {
    let name: String
    let api: String?
    let height: CGFloat?
    @ViewBuilder var demo: () -> Demo

    init(
        name: String,
        api: String? = nil,
        height: CGFloat? = nil,
        @ViewBuilder demo: @escaping () -> Demo
    ) {
        self.name = name
        self.api = api
        self.height = height
        self.demo = demo
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            titleBar
            Divider()
            demoArea
            if let api {
                Divider()
                apiFooter(api)
            }
        }
        .background(cardFill)
        .overlay(cardBorder)
        .shadow(color: .black.opacity(0.06), radius: 4, x: 0, y: 1)
    }

    // MARK: Zones

    private var titleBar: some View {
        Text(name)
            .font(.subheadline)
            .fontWeight(.medium)
            .foregroundStyle(.primary)
            .lineLimit(1)
            .truncationMode(.tail)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 14)
            .padding(.vertical, 10)
    }

    private var demoArea: some View {
        ZStack {
            demo()
        }
        .frame(maxWidth: .infinity, minHeight: height ?? 96)
        .padding(16)
    }

    private func apiFooter(_ text: String) -> some View {
        Text(text)
            .font(.caption)
            .fontDesign(.monospaced)
            .foregroundStyle(.secondary)
            .textSelection(.enabled)
            .lineLimit(2)
            .truncationMode(.middle)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 14)
            .padding(.vertical, 8)
    }

    // MARK: Chrome

    private var cardFill: some View {
        RoundedRectangle(cornerRadius: 12, style: .continuous)
            .fill(Color(nsColor: .controlBackgroundColor))
    }

    private var cardBorder: some View {
        RoundedRectangle(cornerRadius: 12, style: .continuous)
            .strokeBorder(.separator.opacity(0.6), lineWidth: 0.5)
    }
}

/// Reference-only tile for protocols, result-builders, deprecated overloads,
/// and iOS-only APIs. Same window-chrome shape as `VariantTile` but with a
/// muted treatment — title in `.secondary`, smaller drop shadow, no hover
/// elevation — so it visually distinguishes the bottom "Reference & deprecated"
/// subsection from the live variant grid above.
struct ReferenceTile: View {
    let name: String
    let signature: String
    let note: String?
    let badge: String?

    init(name: String, signature: String, note: String? = nil, badge: String? = nil) {
        self.name = name
        self.signature = signature
        self.note = note
        self.badge = badge
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            titleBar
            Divider()
            body0
        }
        .background(cardFill)
        .overlay(cardBorder)
        .shadow(color: .black.opacity(0.04), radius: 3, x: 0, y: 1)
    }

    // MARK: Zones

    private var titleBar: some View {
        HStack(alignment: .firstTextBaseline) {
            Text(name)
                .font(.subheadline)
                .fontWeight(.medium)
                .foregroundStyle(.secondary)
                .lineLimit(1)
                .truncationMode(.tail)
            Spacer(minLength: 8)
            if let badge {
                Text(badge)
                    .font(.caption2)
                    .fontWeight(.medium)
                    .foregroundStyle(.secondary)
                    .padding(.horizontal, 6)
                    .padding(.vertical, 2)
                    .background(
                        Capsule().strokeBorder(.separator, lineWidth: 1)
                    )
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 14)
        .padding(.vertical, 10)
    }

    private var body0: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(signature)
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.secondary)
                .textSelection(.enabled)
                .lineLimit(3)
                .fixedSize(horizontal: false, vertical: true)

            if let note {
                Text(note)
                    .font(.caption)
                    .foregroundStyle(.secondary)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 14)
        .padding(.vertical, 12)
    }

    // MARK: Chrome

    private var cardFill: some View {
        RoundedRectangle(cornerRadius: 12, style: .continuous)
            .fill(Color(nsColor: .controlBackgroundColor))
    }

    private var cardBorder: some View {
        RoundedRectangle(cornerRadius: 12, style: .continuous)
            .strokeBorder(.separator.opacity(0.6), lineWidth: 0.5)
    }
}
