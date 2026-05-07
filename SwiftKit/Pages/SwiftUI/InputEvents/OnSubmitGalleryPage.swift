import SwiftUI

struct OnSubmitGalleryPage: View {
    @State private var formText: String = ""
    @State private var searchText: String = ""
    @State private var lastSubmitted: String = "—"

    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            VariantTile(
                name: ".onSubmit",
                api: ".onSubmit { lastSubmitted = formText }"
            ) {
                VStack(spacing: 8) {
                    TextField("Type and press ↩", text: $formText)
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 180)
                        .onSubmit {
                            lastSubmitted = formText
                            formText = ""
                        }
                    Text("submitted: \(lastSubmitted)")
                        .font(.caption)
                        .fontDesign(.monospaced)
                        .foregroundStyle(.secondary)
                }
            }

            VariantTile(
                name: ".submitLabel(.done)",
                api: ".submitLabel(.done)"
            ) {
                TextField("Done label", text: .constant(""))
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 180)
                    .submitLabel(.done)
            }

            VariantTile(
                name: ".submitScope()",
                api: "TextField(...).submitScope()  // does not propagate"
            ) {
                VStack(spacing: 8) {
                    TextField("Search (scoped)", text: $searchText)
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 180)
                        .submitScope()
                    TextField("Outer field", text: $formText)
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 180)
                }
                .onSubmit {
                    lastSubmitted = "outer only"
                }
            }

            ReferenceTile(
                name: "View.onSubmit(of:_:)",
                signature: "func onSubmit(of triggers: SubmitTriggers = .text, _ action: @escaping () -> Void) -> some View",
                note: "Adds an action that fires when the user submits a value — pressing Return in a TextField/SecureField, or completing a submit-shaped trigger in a parent control. The triggers parameter defaults to .text."
            )

            ReferenceTile(
                name: "View.submitScope(_:)",
                signature: "func submitScope(_ isBlocking: Bool = true) -> some View",
                note: "Stops a submit gesture from bubbling up to parent onSubmit handlers. Use on inner search fields or auxiliary inputs that shouldn't trigger the form's primary submit."
            )

            ReferenceTile(
                name: "View.submitLabel(_:)",
                signature: "func submitLabel(_ submitLabel: SubmitLabel) -> some View",
                note: "Customizes the on-screen label of the submit affordance — primarily the iOS soft-keyboard Return key. macOS shows it in toolbar buttons where applicable."
            )

            ReferenceTile(
                name: "SubmitTriggers",
                signature: "struct SubmitTriggers : OptionSet  ·  .text  ·  .search",
                note: ".text covers TextField/SecureField submission; .search covers a Search field's submit (Return / button). Combine with array literal: [.text, .search]."
            )

            ReferenceTile(
                name: "SubmitLabel",
                signature: "struct SubmitLabel  ·  .return  ·  .done  ·  .go  ·  .send  ·  .next  ·  .continue  ·  .join  ·  .search  ·  .route  ·  .newLine",
                note: "Pre-defined submit labels. Use .search for queries, .send for messages, .next for chained forms, .done as a generic finish."
            )
        }
    }
}

extension OnSubmitGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.inputEvents.onSubmit",
        title: "OnSubmit",
        folder: "Input events",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/onSubmit(of:_:)",
            "View/submitScope(_:)",
            "View/submitLabel(_:)",
            "SubmitTriggers",
            "SubmitLabel"
        ],
        blurb: "Adds an action to perform when the user submits a value — pressing Return in a TextField, completing a search, or any other submission trigger. submitScope blocks bubbling; submitLabel customizes the on-screen submit affordance.",
        signature: "func onSubmit(of triggers: SubmitTriggers = .text, _ action: @escaping () -> Void) -> some View",
        availability: "macOS 12.0+",
        docPath: "Documentation/SwiftUI/input-events/onsubmit(of:_:).md",
        page: { AnyView(OnSubmitGalleryPage()) }
    )
}

#Preview {
    OnSubmitGalleryPage()
        .frame(width: 900, height: 700)
}
