import SwiftUI

// Dense SwiftUI Alert / Dialog gallery — consolidates the entire family:
//   ButtonRole reference (.cancel, .destructive, .none)
//   DialogSeverity reference (.automatic, .standard, .critical)
//   View/alert(_:isPresented:actions:[message:])
//   View/alert(_:isPresented:presenting:actions:[message:])
//   View/alert(isPresented:error:actions:[message:])
//   AlertScene (init(_:isPresented:actions:[message:]) and presenting: variants)
//   View/confirmationDialog(_:isPresented:titleVisibility:actions:[message:])
//   View/confirmationDialog(_:isPresented:titleVisibility:presenting:actions:[message:])
//   View/dismissalConfirmationDialog(_:shouldPresent:actions:[message:])
//   View/dialogIcon(_:) + Scene/dialogIcon(_:)
//   View/dialogSeverity(_:) + Scene/dialogSeverity(_:)
//   View/dialogSuppressionToggle([_:]isSuppressed:) + Scene equivalents
//   Alert struct (deprecated migration reference)
//
// Source docs:
//   Documentation/SwiftUI/modal-presentations/alert(_:ispresented:actions:[message:]).md
//   Documentation/SwiftUI/modal-presentations/alert(_:ispresented:presenting:actions:[message:]).md
//   Documentation/SwiftUI/modal-presentations/alert(ispresented:error:actions:[message:]).md
//   Documentation/SwiftUI/modal-presentations/alertscene.md
//   Documentation/SwiftUI/modal-presentations/confirmationdialog(_:ispresented:titlevisibility:actions:[message:]).md
//   Documentation/SwiftUI/modal-presentations/confirmationdialog(_:ispresented:titlevisibility:presenting:actions:[message:]).md
//   Documentation/SwiftUI/modal-presentations/dismissalconfirmationdialog(_:shouldpresent:actions:[message:]).md
//   Documentation/SwiftUI/modal-presentations/dialogicon(_:).md
//   Documentation/SwiftUI/modal-presentations/dialogseverity(_:).md
//   Documentation/SwiftUI/modal-presentations/dialogsuppressiontoggle(issuppressed:).md
//   Documentation/SwiftUI/modal-presentations/alert.md
//
// Per L-001 / L-012: semantic tokens only, no hand-mixed colors.

// MARK: — Shared demo models (file-private)

private struct AlertGalleryError: LocalizedError {
    let errorDescription: String?
    let recoverySuggestion: String?
}

private struct AlertGallerySaveDetails {
    let name: String
    let error: String
}

private struct AlertGalleryConfirmDetail {
    let name: String
    let fileType: String
}

private let alertDemoFrameWidth: CGFloat = 460

// MARK: — Main page

struct AlertGalleryPage: View {
    // alert(_:isPresented:actions:) demos
    @State private var didFail = false
    @State private var didFailWithMessage = false
    @State private var destructive = false
    @State private var loginAcknowledged = "\u{2014}"
    // alert(_:isPresented:presenting:actions:) demos
    @State private var didError = false
    @State private var didErrorMessage = false
    @State private var saveDetails: AlertGallerySaveDetails?
    // alert(isPresented:error:actions:) demos
    @State private var showErrorAlert = false
    @State private var showErrorAlertWithMessage = false
    @State private var demoError: AlertGalleryError? = .init(
        errorDescription: "Network unavailable",
        recoverySuggestion: "Check your connection and try again."
    )
    // confirmationDialog(_:isPresented:) demos
    @State private var isShowingConfirm = false
    @State private var isShowingConfirmWithMessage = false
    @State private var titleHidden = false
    // confirmationDialog(_:isPresented:presenting:) demos
    @State private var isConfirmingImport = false
    @State private var isConfirmingImportMessage = false
    @State private var importDetail: AlertGalleryConfirmDetail?
    // dismissalConfirmationDialog demo state
    @State private var hasUnsavedChanges = true

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 32) {
                headerSection
                referenceButtonRoleSection
                referenceDialogSeveritySection
                alertIsPresentedSection
                alertPresentingSection
                alertErrorSection
                alertSceneSection
                confirmationDialogIsPresentedSection
                confirmationDialogPresentingSection
                dismissalConfirmationDialogSection
                dialogIconSection
                dialogSeverityModifierSection
                dialogSuppressionToggleSection
                deprecatedAlertTypeSection
                notesSection
            }
            .padding(.horizontal, 32)
            .padding(.vertical, 24)
            .frame(maxWidth: galleryReadableContentWidth, alignment: .leading)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }

    // MARK: Header

    private var headerSection: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("Alert")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("The SwiftUI dialog family: alerts with title, message, and actions; confirmation dialogs that replace ActionSheet; dismissal confirmation dialogs for unsaved work; plus dialog icon, severity, and a \u{201C}Don\u{2019}t ask again\u{201D} suppression toggle.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/modal-presentations/  \u{00b7}  macOS 12.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
            Text("alert  \u{00b7}  confirmationDialog  \u{00b7}  dismissalConfirmationDialog  \u{00b7}  dialogIcon  \u{00b7}  dialogSeverity  \u{00b7}  dialogSuppressionToggle")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.secondary)
                .textSelection(.enabled)
        }
    }

    // MARK: Reference — ButtonRole

    private var referenceButtonRoleSection: some View {
        PageSection("Reference \u{2014} ButtonRole",
                    subtitle: "struct ButtonRole \u{00b7} drives action prominence and ordering") {
            VStack(alignment: .leading, spacing: 16) {
                Text("Every action in an alert or confirmation dialog is a Button. The Button's role controls how the system orders, colors, and emphasizes it. The order in code is not the order on screen \u{2014} the system reorders by role and prominence.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                codeBlock(
"""
// Three values:
.cancel        \u{2014} closes without committing; left-most on macOS
.destructive   \u{2014} permanent / non-recoverable; tinted red, right-most on macOS
nil (default)  \u{2014} a regular action; system places between cancel and destructive

// Default action is set with .keyboardShortcut(.defaultAction):
Button(\"OK\") { }.keyboardShortcut(.defaultAction)  // bold default button
"""
                )

                noteRow(
                    title: "Buttons must use Text labels.",
                    detail: "Alerts and confirmation dialogs only render Buttons whose label is Text or a String. Buttons with Label, Image, or custom views are silently dropped. Stick to Button(\"Title\", role: \u{2026}) { \u{2026} }.",
                    symbol: "textformat"
                )
            }
        }
    }

    // MARK: Reference — DialogSeverity

    private var referenceDialogSeveritySection: some View {
        PageSection("Reference \u{2014} DialogSeverity",
                    subtitle: "struct DialogSeverity \u{00b7} macOS 13.0+ \u{00b7} Equatable, Sendable") {
            VStack(alignment: .leading, spacing: 16) {
                Text("Severity tells the system how much visual prominence the dialog deserves. Reserve .critical for permanent / non-recoverable destruction so that users don\u{2019}t become desensitized.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                VStack(alignment: .leading, spacing: 6) {
                    APICallout(".automatic \u{2014} system-chosen severity (default)")
                    APICallout(".standard  \u{2014} routine prompt, no extra prominence")
                    APICallout(".critical  \u{2014} destructive / non-recoverable action")
                }
            }
        }
    }

    // MARK: alert(_:isPresented:actions:[message:])

    private var alertIsPresentedSection: some View {
        PageSection("View/alert(_:isPresented:actions:[message:])",
                    subtitle: "Bool-driven alert \u{00b7} macOS 12.0+") {
            VStack(alignment: .leading, spacing: 24) {
                Text("Presents an alert when a Bool binding is true. Bundles the with-message and without-message overloads. The framework synthesizes a default OK button if you provide no actions; there is no synthetic Cancel.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                demoTile(
                    title: "Bool trigger \u{2014} alert(_:isPresented:actions:)",
                    api: ".alert(\"Login failed.\", isPresented: $didFail) { Button(\"OK\") { \u{2026} } }"
                ) {
                    VStack(alignment: .leading, spacing: 8) {
                        Button("Trigger alert") { didFail = true }
                            .buttonStyle(.borderedProminent)
                        Text("Last acknowledgement: \(loginAcknowledged)")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                    .alert("Login failed.", isPresented: $didFail) {
                        Button("OK") { loginAcknowledged = "OK pressed" }
                    }
                }

                demoTile(
                    title: "With message \u{2014} alert(_:isPresented:actions:message:)",
                    api: ".alert(\"Login failed.\", isPresented: $flag) { Button(\"OK\") {} } message: { Text(\u{2026}) }"
                ) {
                    Button("Trigger alert + message") { didFailWithMessage = true }
                        .alert("Login failed.", isPresented: $didFailWithMessage) {
                            Button("OK") { }
                        } message: {
                            Text("Please check your credentials and try again.")
                        }
                }

                demoTile(
                    title: "Destructive + cancel roles",
                    api: "Button(\"Delete\", role: .destructive) { \u{2026} }; Button(\"Cancel\", role: .cancel) {}"
                ) {
                    Button("Confirm destructive") { destructive = true }
                        .alert("Delete this item?", isPresented: $destructive) {
                            Button("Delete", role: .destructive) { }
                            Button("Cancel", role: .cancel) { }
                        } message: {
                            Text("This action cannot be undone.")
                        }
                }
            }
        }
    }

    // MARK: alert(_:isPresented:presenting:actions:[message:])

    private var alertPresentingSection: some View {
        PageSection("View/alert(_:isPresented:presenting:actions:[message:])",
                    subtitle: "Data-presenting alert \u{00b7} macOS 12.0+") {
            VStack(alignment: .leading, spacing: 24) {
                Text("Presents an alert using the given data to produce the alert\u{2019}s content. The alert appears only when isPresented is true AND presenting is non-nil. The data is captured at presentation time \u{2014} mutating it after the alert opens is ignored.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                demoTile(
                    title: "presenting: \u{2014} actions closure receives the data",
                    api: ".alert(\"Save failed.\", isPresented: $didError, presenting: details) { details in Button(role: .destructive) { } label: { Text(\"Delete \\(details.name)\") } }"
                ) {
                    VStack(alignment: .leading, spacing: 8) {
                        Button("Trigger save error") {
                            saveDetails = .init(name: "Mockup.psd", error: "Permission denied")
                            didError = true
                        }
                        .buttonStyle(.borderedProminent)
                        Text("details = \(saveDetails?.name ?? "nil")")
                            .font(.caption)
                            .fontDesign(.monospaced)
                            .foregroundStyle(.secondary)
                    }
                    .alert("Save failed.", isPresented: $didError, presenting: saveDetails) { details in
                        Button(role: .destructive) {
                            // Handle deletion.
                        } label: {
                            Text("Delete \(details.name)")
                        }
                        Button("Retry") { }
                    }
                }

                demoTile(
                    title: "With message \u{2014} message closure receives the same data",
                    api: ".alert(_:isPresented:presenting:actions:message:)"
                ) {
                    Button("Trigger with message") {
                        saveDetails = .init(name: "Mockup.psd", error: "Disk full")
                        didErrorMessage = true
                    }
                    .alert("Save failed.", isPresented: $didErrorMessage, presenting: saveDetails) { details in
                        Button("Retry") { }
                        Button("Cancel", role: .cancel) { }
                    } message: { details in
                        Text("Could not save \(details.name): \(details.error)")
                    }
                }
            }
        }
    }

    // MARK: alert(isPresented:error:actions:[message:])

    private var alertErrorSection: some View {
        PageSection("View/alert(isPresented:error:actions:[message:])",
                    subtitle: "LocalizedError-driven alert \u{00b7} macOS 12.0+") {
            VStack(alignment: .leading, spacing: 24) {
                Text("Presents an alert when an error is present. The error\u{2019}s errorDescription becomes the title; recoverySuggestion (or your message closure) provides the body. The error type must conform to LocalizedError.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                APICallout("protocol LocalizedError: Error { var errorDescription: String? { get } \u{2026} }")

                demoTile(
                    title: "Error trigger \u{2014} title from errorDescription",
                    api: ".alert(isPresented: $showAlert, error: error) { Button(\"OK\") { } }"
                ) {
                    Button("Trigger error alert") { showErrorAlert = true }
                        .buttonStyle(.borderedProminent)
                        .alert(isPresented: $showErrorAlert, error: demoError) {
                            Button("OK") { }
                        }
                }

                demoTile(
                    title: "With message \u{2014} message receives the error",
                    api: ".alert(isPresented:error:actions:message:)"
                ) {
                    Button("Trigger with message") { showErrorAlertWithMessage = true }
                        .alert(isPresented: $showErrorAlertWithMessage, error: demoError) { _ in
                            Button("Retry") { }
                            Button("Cancel", role: .cancel) { }
                        } message: { error in
                            if let recovery = error.recoverySuggestion {
                                Text(recovery)
                            } else {
                                Text("An unknown error occurred.")
                            }
                        }
                }
            }
        }
    }

    // MARK: AlertScene

    private var alertSceneSection: some View {
        PageSection("AlertScene",
                    subtitle: "Standalone alert at App body level \u{00b7} macOS 15.0+") {
            VStack(alignment: .leading, spacing: 20) {
                Text("AlertScene is a Scene type \u{2014} it lives in your App body, not in any View. It presents centred on the current display, independent of which window is key. Useful for app-launch alerts that pre-empt the main UI.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                VStack(alignment: .leading, spacing: 6) {
                    Text("Reference example \u{2014} init(_:isPresented:actions:)")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    codeBlock(
"""
@main
struct MyApp: App {
    @State var showLoginAlert = true
    @State var loggedIn = false

    var body: some Scene {
        Window(\"Welcome User Window\", id: \"WelcomeWindow\") {
            ContentView()
        }
        .defaultLaunchBehavior(loggedIn ? .presented : .suppressed)

        AlertScene(\"Login Required\", isPresented: $showLoginAlert) {
            Button(\"OK\") {
                // Acknowledgement.
            }
        }
    }
}
"""
                    )
                    Text("AlertScene blocks until dismissed.")
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                }

                VStack(alignment: .leading, spacing: 6) {
                    Text("init(_:isPresented:actions:message:)")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    codeBlock(
"""
AlertScene(\"Update Available\", isPresented: $showUpdate) {
    Button(\"Install\") { \u{2026} }
    Button(\"Later\", role: .cancel) { }
} message: {
    Text(\"Version 1.4 is ready to install. Restart now?\")
}
"""
                    )
                }

                VStack(alignment: .leading, spacing: 6) {
                    Text("init(_:isPresented:presenting:actions:[message:])")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    codeBlock(
"""
AlertScene(\"Sync error\", isPresented: $showSyncError, presenting: lastSyncError) { error in
    Button(\"Retry\") { \u{2026} }
    Button(\"Cancel\", role: .cancel) { }
} message: { error in
    Text(error.recoverySuggestion ?? \"\")
}
"""
                    )
                }

                VStack(alignment: .leading, spacing: 6) {
                    Text("All four documented initializers")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout("init(_:isPresented:actions:)")
                    APICallout("init(_:isPresented:actions:message:)")
                    APICallout("init(_:isPresented:presenting:actions:)")
                    APICallout("init(_:isPresented:presenting:actions:message:)")
                }

                noteRow(
                    title: "Combine with the Scene-form modifiers.",
                    detail: "dialogIcon, dialogSeverity, and dialogSuppressionToggle each have a Scene overload designed to attach directly to AlertScene.",
                    symbol: "slider.horizontal.3"
                )
            }
        }
    }

    // MARK: confirmationDialog(_:isPresented:)

    private var confirmationDialogIsPresentedSection: some View {
        PageSection("View/confirmationDialog(_:isPresented:titleVisibility:actions:[message:])",
                    subtitle: "Bool-driven multi-choice prompt \u{00b7} macOS 12.0+") {
            VStack(alignment: .leading, spacing: 24) {
                Text("Presents a confirmation dialog when a given condition is true. Use for user-initiated multi-choice prompts \u{2014} this is the migration target for the deprecated ActionSheet. The system always includes a dismiss action; provide your own .cancel-role button to override its wording.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                VStack(alignment: .leading, spacing: 6) {
                    Text("titleVisibility \u{2014} three values")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout(".automatic \u{2014} system default")
                    APICallout(".visible   \u{2014} title shown above actions")
                    APICallout(".hidden    \u{2014} title used for accessibility only")
                }

                demoTile(
                    title: "Default \u{2014} confirmationDialog(_:isPresented:)",
                    api: ".confirmationDialog(\"Permanently erase the items in the trash?\", isPresented: $flag) { Button(\"Empty Trash\", role: .destructive) { } }"
                ) {
                    Button("Empty Trash") { isShowingConfirm = true }
                        .buttonStyle(.borderedProminent)
                        .confirmationDialog(
                            "Permanently erase the items in the trash?",
                            isPresented: $isShowingConfirm
                        ) {
                            Button("Empty Trash", role: .destructive) { }
                        }
                }

                demoTile(
                    title: "With message + titleVisibility: .visible",
                    api: ".confirmationDialog(_:isPresented:, titleVisibility: .visible, actions: { \u{2026} }, message: { Text(\u{2026}) })"
                ) {
                    Button("Empty trash with message") { isShowingConfirmWithMessage = true }
                        .confirmationDialog(
                            "Permanently erase the items in the trash?",
                            isPresented: $isShowingConfirmWithMessage,
                            titleVisibility: .visible
                        ) {
                            Button("Empty Trash", role: .destructive) { }
                            Button("Cancel", role: .cancel) { }
                        } message: {
                            Text("This action cannot be undone.")
                        }
                }

                demoTile(
                    title: "titleVisibility: .hidden \u{2014} title is read-aloud only",
                    api: ".confirmationDialog(\"Title (hidden)\", isPresented:, titleVisibility: .hidden) { \u{2026} }"
                ) {
                    Button("Show with hidden title") { titleHidden = true }
                        .confirmationDialog(
                            "Choose a destination",
                            isPresented: $titleHidden,
                            titleVisibility: .hidden
                        ) {
                            Button("Inbox") { }
                            Button("Archive") { }
                            Button("Cancel", role: .cancel) { }
                        }
                }
            }
        }
    }

    // MARK: confirmationDialog(_:isPresented:presenting:)

    private var confirmationDialogPresentingSection: some View {
        PageSection("View/confirmationDialog(_:isPresented:titleVisibility:presenting:actions:[message:])",
                    subtitle: "Data-presenting confirmation dialog \u{00b7} macOS 12.0+") {
            VStack(alignment: .leading, spacing: 24) {
                Text("Presents a confirmation dialog using data to produce the dialog\u{2019}s content. Same two-state contract as the data-presenting alert: the dialog appears only when isPresented is true AND presenting is non-nil, and the model is captured at presentation time.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                demoTile(
                    title: "presenting: \u{2014} dynamic action labels",
                    api: ".confirmationDialog(\"Import New File?\", isPresented: $flag, presenting: detail) { detail in Button(\"Import \\(detail.name)\") { } }"
                ) {
                    Button("Import file\u{2026}") {
                        importDetail = .init(name: "MyImageFile.png", fileType: "png")
                        isConfirmingImport = true
                    }
                    .buttonStyle(.borderedProminent)
                    .confirmationDialog(
                        "Import New File?",
                        isPresented: $isConfirmingImport,
                        presenting: importDetail
                    ) { detail in
                        Button("Import \(detail.name)") { }
                        Button("Cancel", role: .cancel) { }
                    }
                }

                demoTile(
                    title: "With message \u{2014} message closure receives the same data",
                    api: ".confirmationDialog(_:isPresented:titleVisibility:presenting:actions:message:)"
                ) {
                    Button("Import with message") {
                        importDetail = .init(name: "MyImageFile.png", fileType: "png")
                        isConfirmingImportMessage = true
                    }
                    .confirmationDialog(
                        "Import New File?",
                        isPresented: $isConfirmingImportMessage,
                        titleVisibility: .visible,
                        presenting: importDetail
                    ) { detail in
                        Button("Import \(detail.name)") { }
                        Button("Cancel", role: .cancel) { }
                    } message: { detail in
                        Text("File type: \(detail.fileType)")
                    }
                }
            }
        }
    }

    // MARK: dismissalConfirmationDialog

    private var dismissalConfirmationDialogSection: some View {
        PageSection("View/dismissalConfirmationDialog(_:shouldPresent:actions:[message:])",
                    subtitle: "Window-close intercept for unsaved work \u{00b7} macOS 15.0+") {
            VStack(alignment: .leading, spacing: 20) {
                Text("Presents a confirmation dialog when a dismiss action has been triggered. On macOS, this fires when the user attempts to close the enclosing window. The cancel-role button blocks the dismiss; every other action allows it to proceed.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                VStack(alignment: .leading, spacing: 6) {
                    Text("Reference example")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    codeBlock(
"""
struct ComposeMessage: View {
    @State private var message = Message()

    var body: some View {
        MessageEditor(message: $message)
            .dismissalConfirmationDialog(
                \"Save This Message As Draft?\",
                shouldPresent: message.hasUnsavedChanges
            ) {
                Button(\"Save\") { message.save() }
                Button(\"Don't Save\", role: .destructive) { message.discard() }
            }
    }
}
"""
                    )
                }

                VStack(alignment: .leading, spacing: 6) {
                    Text("With message \u{2014} second overload")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    codeBlock(
"""
.dismissalConfirmationDialog(
    \"Save This Message As Draft?\",
    shouldPresent: message.hasUnsavedChanges
) {
    Button(\"Save\") { message.save() }
    Button(\"Don't Save\", role: .destructive) { message.discard() }
} message: {
    Text(\"\"\"
        This message has not been sent and contains \\
        unsaved changes.
        \"\"\")
}
"""
                    )
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Toggle the trigger state")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    HStack(spacing: 12) {
                        Toggle("hasUnsavedChanges", isOn: $hasUnsavedChanges)
                            .toggleStyle(.switch)
                        Text("shouldPresent: \(String(describing: hasUnsavedChanges))")
                            .font(.caption)
                            .fontDesign(.monospaced)
                            .foregroundStyle(.secondary)
                    }
                    .frame(width: alertDemoFrameWidth, alignment: .leading)
                    .padding(12)
                    .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .strokeBorder(.separator, lineWidth: 1)
                    )
                    APICallout(".dismissalConfirmationDialog(_:shouldPresent: hasUnsavedChanges, actions: { \u{2026} })")
                    Text("Demo trigger state \u{2014} the actual close-window trigger only fires inside an owning window context, which this in-app demo doesn\u{2019}t provide.")
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                }

                noteRow(
                    title: "Doesn\u{2019}t replace .interactiveDismissDisabled.",
                    detail: "Use .interactiveDismissDisabled to prevent gestural dismissal of sheets/popovers entirely. Use .dismissalConfirmationDialog to ALLOW dismissal but require user confirmation first.",
                    symbol: "lock.open"
                )
            }
        }
    }

    // MARK: dialogIcon

    private var dialogIconSection: some View {
        PageSection("View/dialogIcon(_:) + Scene/dialogIcon(_:)",
                    subtitle: "Replace the default app icon shown next to the alert text \u{00b7} macOS 15.0+") {
            VStack(alignment: .leading, spacing: 20) {
                Text("Configures the icon used by alerts. On macOS this icon replaces the default app icon shown next to the alert text. Pass nil to revert to the app icon. The parameter is Image? \u{2014} not Label or text.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                VStack(alignment: .leading, spacing: 6) {
                    Text("View modifier form")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    codeBlock(
"""
Button(\"Delete items\") { isShowingDialog = true }
    .alert(
        \"Are you sure you want to erase these items?\",
        isPresented: $isShowingDialog
    ) {
        Button(\"Erase\", role: .destructive) { \u{2026} }
        Button(\"Cancel\", role: .cancel) { }
    }
    .dialogIcon(Image(systemName: \"trash\"))
"""
                    )
                }

                VStack(alignment: .leading, spacing: 6) {
                    Text("Scene modifier form \u{2014} for AlertScene")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    codeBlock(
"""
@main
struct MyApp: App {
    @State private var isShowingDialog = false
    var body: some Scene {
        Window(\"Main\", id: \"main\") {
            Button(\"Delete items\") { isShowingDialog = true }
        }

        AlertScene(
            \"Are you sure you want to erase these items?\",
            isPresented: $isShowingDialog
        ) {
            Button(\"Erase\", role: .destructive) { \u{2026} }
            Button(\"Cancel\", role: .cancel) { }
        }
        .dialogIcon(Image(\"Trash\"))
    }
}
"""
                    )
                }

                VStack(alignment: .leading, spacing: 6) {
                    Text("Both surfaces share the same signature")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout("func dialogIcon(_ icon: Image?) -> some View")
                    APICallout("func dialogIcon(_ icon: Image?) -> some Scene")
                    APICallout(".dialogIcon(nil)   // restores the default app icon")
                }
            }
        }
    }

    // MARK: dialogSeverity modifier

    private var dialogSeverityModifierSection: some View {
        PageSection("View/dialogSeverity(_:) + Scene/dialogSeverity(_:)",
                    subtitle: "View: macOS 13.0+ \u{00b7} Scene: macOS 15.0+") {
            VStack(alignment: .leading, spacing: 20) {
                Text("Sets the severity for alerts. Severity affects the alert chrome (caution icon, larger title for .critical); ButtonRole.destructive affects the button color. Use both together for the standard \u{201C}are you sure?\u{201D} pattern.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                VStack(alignment: .leading, spacing: 6) {
                    Text("View modifier form")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    codeBlock(
"""
Button(\"Erase All Items\") { isShowingDialog = true }
    .alert(\"Are you sure you want to erase these items?\",
           isPresented: $isShowingDialog) {
        Button(\"Erase\", role: .destructive) { \u{2026} }
        Button(\"Cancel\", role: .cancel) { }
    }
    .dialogSeverity(.critical)
"""
                    )
                }

                VStack(alignment: .leading, spacing: 6) {
                    Text("Scene modifier form \u{2014} for AlertScene")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    codeBlock(
"""
AlertScene(
    \"Are you sure you want to erase these items?\",
    isPresented: $isShowingDialog
) {
    Button(\"Erase\", role: .destructive) { \u{2026} }
    Button(\"Cancel\", role: .cancel) { }
}
.dialogSeverity(.critical)
"""
                    )
                }

                VStack(alignment: .leading, spacing: 6) {
                    Text("Both surfaces share the same signature")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout("func dialogSeverity(_ severity: DialogSeverity) -> some View")
                    APICallout("func dialogSeverity(_ severity: DialogSeverity) -> some Scene")
                }
            }
        }
    }

    // MARK: dialogSuppressionToggle

    private var dialogSuppressionToggleSection: some View {
        PageSection("View/Scene.dialogSuppressionToggle([_:]isSuppressed:)",
                    subtitle: "\u{201C}Don\u{2019}t ask again\u{201D} checkbox \u{00b7} macOS 15.0+") {
            VStack(alignment: .leading, spacing: 20) {
                Text("Adds a suppression toggle to dialogs on macOS \u{2014} a \u{201C}Don\u{2019}t ask again\u{201D} checkbox that lets users opt out of future presentations. The framework adds the toggle and updates the bound Bool; suppressing future presentations is up to your code.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                VStack(alignment: .leading, spacing: 6) {
                    Text("Default label \u{2014} dialogSuppressionToggle(isSuppressed:)")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    codeBlock(
"""
@AppStorage(\"suppressEraseItemAlert\") private var suppressAlert = false
@State private var isShowingDialog = false

var body: some View {
    Button(\"Delete items\") { isShowingDialog = true }
        .alert(
            \"Are you sure you want to erase these items?\",
            isPresented: $isShowingDialog
        ) {
            Button(\"Erase\", role: .destructive) { \u{2026} }
            Button(\"Cancel\", role: .cancel) { }
        }
        .dialogSuppressionToggle(isSuppressed: $suppressAlert)
}
"""
                    )
                }

                VStack(alignment: .leading, spacing: 6) {
                    Text("Custom label \u{2014} dialogSuppressionToggle(_:isSuppressed:)")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    codeBlock(
"""
.dialogSuppressionToggle(
    \"Do not ask about erasing items again\",
    isSuppressed: $suppressAlert
)
"""
                    )
                }

                VStack(alignment: .leading, spacing: 6) {
                    Text("Scene form \u{2014} for AlertScene")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    codeBlock(
"""
AlertScene(
    \"Are you sure you want to erase these items?\",
    isPresented: $isShowingDialog
) {
    Button(\"Erase\", role: .destructive) { \u{2026} }
    Button(\"Cancel\", role: .cancel) { }
}
.dialogSuppressionToggle(
    \"Do not ask about erasing items again\",
    isSuppressed: $suppressAlert
)
"""
                    )
                }

                VStack(alignment: .leading, spacing: 6) {
                    Text("All four shapes")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout("func dialogSuppressionToggle(isSuppressed: Binding<Bool>) -> some View")
                    APICallout("func dialogSuppressionToggle<S: StringProtocol>(_ title: S, isSuppressed: Binding<Bool>) -> some View")
                    APICallout("func dialogSuppressionToggle(isSuppressed: Binding<Bool>) -> some Scene")
                    APICallout("func dialogSuppressionToggle<S: StringProtocol>(_ title: S, isSuppressed: Binding<Bool>) -> some Scene")
                }

                noteRow(
                    title: "App is responsible for honoring the bool.",
                    detail: "The framework ADDS the toggle to the dialog and updates the bound Bool. Suppressing future presentations is up to your code \u{2014} typically `if !suppressAlert { isShowingDialog = true }`.",
                    symbol: "switch.2"
                )
            }
        }
    }

    // MARK: Deprecated Alert struct

    private var deprecatedAlertTypeSection: some View {
        PageSection("Alert (deprecated)",
                    subtitle: "struct Alert \u{00b7} migration reference \u{00b7} deprecated macOS 26.5") {
            VStack(alignment: .leading, spacing: 20) {
                Text("A representation of an alert presentation. Deprecated in macOS 26.5 \u{2014} do not adopt in new code. The replacement API uses a normal SwiftUI ViewBuilder for actions plus ButtonRole (.cancel, .destructive).")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                VStack(alignment: .leading, spacing: 6) {
                    Text("Deprecated form")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    codeBlock(
"""
// DO NOT use in new code:
@State private var showAlert = false
var body: some View {
    Button(\"Tap to show alert\") { showAlert = true }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text(\"Unable to Save Workout Data\"),
                message: Text(\"The connection to the server was lost.\"),
                primaryButton: .default(Text(\"Try Again\"), action: saveWorkoutData),
                secondaryButton: .destructive(Text(\"Delete\"), action: deleteWorkoutData)
            )
        }
}
"""
                    )
                }

                VStack(alignment: .leading, spacing: 6) {
                    Text("Migration target \u{2014} .alert(_:isPresented:actions:message:)")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    codeBlock(
"""
@State private var showAlert = false

var body: some View {
    Button(\"Tap to show alert\") { showAlert = true }
        .alert(\"Unable to Save Workout Data\", isPresented: $showAlert) {
            Button(\"Try Again\") { saveWorkoutData() }
            Button(\"Delete\", role: .destructive) { deleteWorkoutData() }
        } message: {
            Text(\"The connection to the server was lost.\")
        }
}
"""
                    )
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Compare \u{2014} Alert vs alert(_:isPresented:actions:)")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    sideBySideRow(
                        legacy: "Alert(title: Text(\"\u{2026}\"), message: Text(\"\u{2026}\"), dismissButton: .default(Text(\"OK\")))",
                        replacement: ".alert(\"\u{2026}\", isPresented: $flag) { Button(\"OK\") { } } message: { Text(\"\u{2026}\") }"
                    )
                    sideBySideRow(
                        legacy: "Alert(title: \u{2026}, primaryButton: .default(\u{2026}), secondaryButton: .cancel())",
                        replacement: ".alert(\"\u{2026}\", isPresented: $flag) { Button(\"\u{2026}\") { } ; Button(\"Cancel\", role: .cancel) { } }"
                    )
                    sideBySideRow(
                        legacy: ".destructive(Text(\"Delete\"), action: \u{2026})",
                        replacement: "Button(\"Delete\", role: .destructive) { \u{2026} }"
                    )
                }

                noteRow(
                    title: "ActionSheet has the same migration story.",
                    detail: "Alert is for state-driven prompts. ActionSheet (also deprecated) was for action-response prompts \u{2014} its migration target is .confirmationDialog(_:isPresented:titleVisibility:actions:).",
                    symbol: "doc.on.doc"
                )
            }
        }
    }

    // MARK: Notes

    private var notesSection: some View {
        PageSection("Notes", subtitle: "Key behaviors, availability, and constraints.") {
            VStack(alignment: .leading, spacing: 16) {
                noteRow(
                    title: "All actions dismiss the alert.",
                    detail: "Tapping any button \u{2014} including a custom one \u{2014} sets the bound Boolean back to false. You don\u{2019}t need to flip it manually inside the action closure.",
                    symbol: "arrow.uturn.backward.circle"
                )
                noteRow(
                    title: "System reorders actions by role + prominence.",
                    detail: "The order you write actions in code is not guaranteed. .destructive is right-most on macOS; .cancel is typically left-most. Mark the default with .keyboardShortcut(.defaultAction) for extra prominence.",
                    symbol: "arrow.left.arrow.right"
                )
                noteRow(
                    title: "Alerts only support Text-labeled buttons.",
                    detail: "Buttons with non-Text labels (Label, custom views) are silently omitted on macOS, iOS, and watchOS. Stick to Button(\"Title\", role: \u{2026}) { \u{2026} } shapes.",
                    symbol: "textformat"
                )
                noteRow(
                    title: "No native cancel \u{2014} add one with role: .cancel.",
                    detail: "Even when you provide actions, the .alert modifier does NOT add a default Cancel. If users should be able to back out, include Button(\"Cancel\", role: .cancel) { } explicitly. Confirmation dialogs DO synthesize a dismiss action.",
                    symbol: "xmark.circle"
                )
                noteRow(
                    title: "Data-presenting overloads capture data at present-time.",
                    detail: "alert(_:isPresented:presenting:\u{2026}) and confirmationDialog(\u{2026}presenting:\u{2026}) close over the snapshot at presentation time. Mutating the model while the dialog is open is ignored \u{2014} dismiss + re-present to update.",
                    symbol: "snowflake"
                )
                noteRow(
                    title: "alert(isPresented:error:\u{2026}) requires LocalizedError.",
                    detail: "The framework reads errorDescription, recoverySuggestion, and friends to populate the alert. Plain Swift errors won\u{2019}t surface meaningful text. The error parameter is Error? \u{2014} alert appears only when both isPresented is true AND error is non-nil.",
                    symbol: "exclamationmark.bubble"
                )
                noteRow(
                    title: "AlertScene is a Scene, not a View.",
                    detail: "AlertScene cannot be embedded inside a View body. Place it alongside Window/WindowGroup at the App\u{2019}s body level. Use the Scene-form dialogIcon, dialogSeverity, and dialogSuppressionToggle modifiers to configure it.",
                    symbol: "macwindow"
                )
                noteRow(
                    title: "Confirmation dialogs are the ActionSheet replacement.",
                    detail: "On macOS the dialog can render as a small popover anchored to the trigger view; on iOS regular size classes it may also appear as a popover. Compact size classes show the bottom-attached action sheet style.",
                    symbol: "rectangle.center.inset.filled"
                )
                noteRow(
                    title: "dismissalConfirmationDialog cancel ALWAYS blocks dismiss.",
                    detail: "Unlike confirmationDialog where the cancel button is just visually styled, in dismissalConfirmationDialog the role.cancel button is functionally what STOPS the close. Any non-cancel button ALLOWS the close to complete.",
                    symbol: "xmark.shield"
                )
                noteRow(
                    title: "dialogIcon, dialogSeverity, dialogSuppressionToggle are macOS-only.",
                    detail: "iOS/iPadOS alerts don\u{2019}t render an icon and don\u{2019}t support suppression toggles. The modifiers are no-ops outside macOS.",
                    symbol: "macwindow"
                )
                noteRow(
                    title: "Pair .dialogSeverity(.critical) with custom dialogIcon for permanent destruction.",
                    detail: "Reserve .critical for permanent / non-recoverable destruction (delete files, sign out and lose state). Overuse desensitizes users. The standard recipe combines .critical severity, a custom icon, and a Button with role .destructive.",
                    symbol: "exclamationmark.triangle"
                )
                noteRow(
                    title: "Use .alert / .confirmationDialog modifiers, not the deprecated Alert / ActionSheet structs.",
                    detail: "The Alert struct (and primaryButton/secondaryButton API) is deprecated in macOS 26.5. New work uses the .alert(_:isPresented:actions:) family with ViewBuilder + ButtonRole.",
                    symbol: "exclamationmark.octagon"
                )
            }
        }
    }

    // MARK: View helpers

    private func demoTile<Content: View>(
        title: String,
        api: String,
        @ViewBuilder content: () -> Content
    ) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.headline)
                .foregroundStyle(.primary)
            content()
                .frame(width: alertDemoFrameWidth, alignment: .leading)
                .padding(12)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(.separator, lineWidth: 1)
                )
            APICallout(api)
        }
    }

    private func codeBlock(_ text: String) -> some View {
        Text(text)
            .font(.callout)
            .fontDesign(.monospaced)
            .textSelection(.enabled)
            .foregroundStyle(.primary)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(12)
            .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .strokeBorder(.separator, lineWidth: 1)
            )
    }

    private func noteRow(title: String, detail: String, symbol: String) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Label(title, systemImage: symbol)
                .font(.headline)
                .foregroundStyle(.primary)
            Text(detail)
                .font(.callout)
                .foregroundStyle(.secondary)
                .padding(.leading, 24)
        }
    }

    private func sideBySideRow(legacy: String, replacement: String) -> some View {
        HStack(alignment: .top, spacing: 12) {
            VStack(alignment: .leading, spacing: 4) {
                Text("Legacy")
                    .font(.caption2)
                    .fontWeight(.semibold)
                    .foregroundStyle(.secondary)
                Text(legacy)
                    .font(.caption)
                    .fontDesign(.monospaced)
                    .foregroundStyle(.primary)
                    .textSelection(.enabled)
            }
            .frame(maxWidth: .infinity, alignment: .leading)

            VStack(alignment: .leading, spacing: 4) {
                Text("Replacement")
                    .font(.caption2)
                    .fontWeight(.semibold)
                    .foregroundStyle(.tint)
                Text(replacement)
                    .font(.caption)
                    .fontDesign(.monospaced)
                    .foregroundStyle(.primary)
                    .textSelection(.enabled)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(8)
        .background(.background.secondary, in: RoundedRectangle(cornerRadius: 6))
    }
}

extension AlertGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.modalPresentations.alert",
        title: "Alert",
        folder: "Modal presentations",
        framework: .swiftUI,
        absorbedSymbols: [
            "ActionSheet",
            "Alert",
            "AlertScene",
            "DialogSeverity",
            "Scene/dialogIcon(_:)",
            "Scene/dialogSeverity(_:)",
            "Scene/dialogSuppressionToggle(_:isSuppressed:)",
            "Scene/dialogSuppressionToggle(isSuppressed:)",
            "View/alert(_:isPresented:actions:)",
            "View/alert(_:isPresented:actions:message:)",
            "View/alert(_:isPresented:presenting:actions:)",
            "View/alert(_:isPresented:presenting:actions:message:)",
            "View/alert(isPresented:error:actions:)",
            "View/alert(isPresented:error:actions:message:)",
            "View/confirmationDialog(_:isPresented:titleVisibility:actions:)",
            "View/confirmationDialog(_:isPresented:titleVisibility:actions:message:)",
            "View/confirmationDialog(_:isPresented:titleVisibility:presenting:actions:)",
            "View/confirmationDialog(_:isPresented:titleVisibility:presenting:actions:message:)",
            "View/dialogIcon(_:)",
            "View/dialogSeverity(_:)",
            "View/dialogSuppressionToggle(_:isSuppressed:)",
            "View/dialogSuppressionToggle(isSuppressed:)",
            "View/dismissalConfirmationDialog(_:shouldPresent:actions:)",
            "View/dismissalConfirmationDialog(_:shouldPresent:actions:message:)"
        ],
        blurb: "The SwiftUI dialog family: alerts with title, message, and actions; confirmation dialogs that replace ActionSheet; dismissal confirmation dialogs for unsaved work; plus dialog icon, severity, and a \u{201C}Don\u{2019}t ask again\u{201D} suppression toggle.",
        signature: "alert \u{00b7} confirmationDialog \u{00b7} dismissalConfirmationDialog \u{00b7} dialogIcon \u{00b7} dialogSeverity \u{00b7} dialogSuppressionToggle",
        availability: "macOS 12.0+",
        docPath: "Documentation/SwiftUI/modal-presentations/alert(_:ispresented:actions:).md",
        page: { AnyView(AlertGalleryPage()) }
    )
}

#Preview {
    AlertGalleryPage()
        .frame(width: 1200, height: 1600)
}
