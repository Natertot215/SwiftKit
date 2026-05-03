import SwiftUI

struct APICallout: View {
    let api: String

    init(_ api: String) {
        self.api = api
    }

    var body: some View {
        Text(api)
            .font(.caption)
            .fontDesign(.monospaced)
            .foregroundStyle(.secondary)
            .textSelection(.enabled)
    }
}
