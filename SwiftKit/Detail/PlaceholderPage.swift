import SwiftUI

struct PlaceholderPage: View {
    let leaf: Leaf

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                header
                Divider()
                metadata
                Spacer(minLength: 24)
                hint
            }
            .padding(.horizontal, 32)
            .padding(.vertical, 24)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(leaf.displayName)
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text(leaf.apiSignature)
                .font(.callout)
                .fontDesign(.monospaced)
                .foregroundStyle(.secondary)
        }
    }

    private var metadata: some View {
        VStack(alignment: .leading, spacing: 8) {
            metadataRow("Framework", leaf.framework == .swiftUI ? "SwiftUI" : "AppKit")
            if let availability = leaf.availability {
                metadataRow("Availability", availability)
            }
            metadataRow("Documentation", leaf.docMarkdownPath)
        }
    }

    private func metadataRow(_ label: String, _ value: String) -> some View {
        HStack(alignment: .firstTextBaseline) {
            Text(label)
                .font(.callout)
                .foregroundStyle(.secondary)
                .frame(width: 120, alignment: .leading)
            Text(value)
                .font(.callout)
                .fontDesign(label == "Documentation" ? .monospaced : .default)
                .foregroundStyle(.primary)
                .textSelection(.enabled)
        }
    }

    private var hint: some View {
        Label {
            Text("This page hasn't been written yet. Refer to the documentation path above for variants and availability.")
                .font(.callout)
                .foregroundStyle(.secondary)
        } icon: {
            Image(systemName: "wrench.and.screwdriver")
                .foregroundStyle(.secondary)
        }
        .padding(16)
        .background(.quaternary.opacity(0.5), in: RoundedRectangle(cornerRadius: 10))
    }
}
