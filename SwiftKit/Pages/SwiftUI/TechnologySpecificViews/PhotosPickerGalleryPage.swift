import SwiftUI
import PhotosUI

// SwiftUI PhotosUI modifiers reference page.
// Covers: photosPicker (4 overloads), photosPickerAccessoryVisibility,
//         photosPickerDisabledCapabilities, photosPickerStyle,
//         quickLookPreview, quickLookPreview(_:in:)
// Source: Documentation/SwiftUI/technology-specific-views/

struct PhotosPickerGalleryPage: View {
    @State private var showPicker = false
    @State private var selection: [PhotosPickerItem] = []
    @State private var previewURL: URL? = nil
    @State private var previewURLs: [URL] = []

    var body: some View {
        GalleryPageScaffold {
            header
        } defaultRender: {
            defaultDemo
        } variants: {
            variantsContent
        } states: {
            EmptyView()
        } notes: {
            notesContent
        }
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("PhotosPicker · QuickLook")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("photosPicker modifiers, photosPickerStyle, photosPickerDisabledCapabilities, quickLookPreview.")
                .font(.callout).foregroundStyle(.secondary)
            Text("PhotosUI macOS 13.0+ · quickLookPreview macOS 14.0+")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary)
        }
    }

    private var defaultDemo: some View {
        Block(title: "photosPicker(isPresented:selection:matching:)") {
            VStack(alignment: .leading, spacing: 12) {
                Button("Open Photos Picker") { showPicker = true }
                    .photosPicker(
                        isPresented: $showPicker,
                        selection: $selection,
                        matching: .images
                    )
                if !selection.isEmpty {
                    Text("Selected \(selection.count) photo(s)")
                        .font(.callout).foregroundStyle(.secondary)
                }
            }
            APICallout(".photosPicker(isPresented: $show, selection: $selection, matching: .images)")
            Text("The picker presents as a macOS panel. selection is a [PhotosPickerItem] binding. Use PhotosPickerItem.loadTransferable(type:) to get image data.")
                .font(.footnote).foregroundStyle(.secondary)
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "photosPicker overloads") {
                snippet("""
                // Single selection:
                view.photosPicker(isPresented: $show, selection: $item, matching: .images)

                // Multi-selection with encoding preference:
                view.photosPicker(isPresented: $show,
                                   selection: $items,
                                   matching: .any(of: [.images, .videos]),
                                   preferredItemEncoding: .compatible)

                // Multi with max count and selection behavior:
                view.photosPicker(isPresented: $show,
                                   selection: $items,
                                   maxSelectionCount: 5,
                                   selectionBehavior: .ordered,
                                   matching: .images,
                                   preferredItemEncoding: .current)

                // With custom photo library:
                view.photosPicker(isPresented: $show,
                                   selection: $items,
                                   maxSelectionCount: 3,
                                   selectionBehavior: .continuousLeadingIndexFirstMember,
                                   matching: .images,
                                   preferredItemEncoding: .automatic,
                                   photoLibrary: .shared())
                """)
            }

            Block(title: "PHPickerFilter — matching values") {
                snippet("""
                .images             // still images
                .videos             // video clips
                .livePhotos         // Live Photos
                .depthEffectPhotos  // Portrait mode photos
                .panoramas          // panoramic photos
                .screenshots        // screenshots
                .screenRecordings   // screen recordings
                .any(of: [.images, .videos])      // combine filters
                .all(of: [.images, .not(.screenshots)]) // exclude
                """)
            }

            Block(title: "photosPickerStyle(_:)") {
                snippet("""
                // Inline picker embedded in the view hierarchy:
                PhotosPicker(selection: $selection, matching: .images) {
                    Label("Pick Photo", systemImage: "photo")
                }
                .photosPickerStyle(.inline)          // embedded gallery
                .photosPickerStyle(.presentation)    // modal sheet / panel
                .photosPickerStyle(.compact)         // compact inline
                .photosPickerStyle(.automatic)       // system default
                """)
                Text("photosPickerStyle is macOS 15.0+. .inline embeds a scrollable photo grid inline in your layout.")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "photosPickerAccessoryVisibility(_:edges:)") {
                snippet("""
                PhotosPicker(selection: $selection, matching: .images) {
                    Label("Pick", systemImage: "photo")
                }
                .photosPickerAccessoryVisibility(.hidden, edges: .bottom)
                // edges: Edge.Set — .top, .bottom, .leading, .trailing, .all
                // Hides the picker's accessory bar on specified edges.
                """)
            }

            Block(title: "photosPickerDisabledCapabilities(_:)") {
                snippet("""
                PhotosPicker(selection: $selection, matching: .images) {
                    Label("Pick", systemImage: "photo")
                }
                .photosPickerDisabledCapabilities(.selectionActions)
                .photosPickerDisabledCapabilities(.search)
                .photosPickerDisabledCapabilities(.stagingArea)
                // PHPickerCapabilities: .selectionActions, .search, .stagingArea,
                //                       .collectionNavigation, .sensitiveContentWarning
                """)
                Text("Disable specific picker capabilities — e.g. hide search when your app wants to control which photos are browsable.")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "quickLookPreview(_:) — preview a file URL") {
                snippet("""
                @State var previewURL: URL? = nil

                Button("Preview") { previewURL = fileURL }
                    .quickLookPreview($previewURL)
                // Presents a Quick Look panel for the URL.
                // Set to nil to dismiss.
                """)
                Text("quickLookPreview(_:) shows the macOS/iOS Quick Look panel for any file type QL supports — PDFs, images, documents, etc.")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "quickLookPreview(_:in:) — multi-file preview with selection") {
                snippet("""
                @State var selectedURL: URL? = urls.first
                let urls: [URL] = [file1, file2, file3]

                view.quickLookPreview($selectedURL, in: urls)
                // Shows a Quick Look panel with navigation between all URLs.
                // selectedURL tracks the currently shown item.
                """)
                Text("The in: collection parameter enables Quick Look's previous/next navigation controls to move between multiple files.")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "Loading image data from PhotosPickerItem") {
                snippet("""
                .onChange(of: selectedItem) { _, newItem in
                    Task {
                        // Load as Data:
                        if let data = try? await newItem?.loadTransferable(type: Data.self) {
                            imageData = data
                        }
                        // or as Image (Transferable):
                        if let image = try? await newItem?.loadTransferable(type: Image.self) {
                            selectedImage = image
                        }
                    }
                }
                """)
                Text("PhotosPickerItem.loadTransferable(type:) is async and returns the photo data in the requested Transferable format.")
                    .font(.footnote).foregroundStyle(.secondary)
            }
        }
    }

    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            noteRow("photo.fill", "PhotosPicker requires NSPhotoLibraryUsageDescription in Info.plist. On macOS, the picker is a standard panel (not a sheet).")
            noteRow("number", "maxSelectionCount: nil = unlimited. selectionBehavior: .ordered preserves the order the user tapped items; .default uses album order.")
            noteRow("eye.fill", "quickLookPreview is macOS 14.0+ / iOS 17.0+. It replaces manual QLPreviewController setup for simple file previewing.")
            noteRow("square.grid.2x2", ".photosPickerStyle(.inline) requires macOS 15.0+ and shows a scrollable photo grid directly in the view hierarchy — great for in-app photo selection UIs.")
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

extension PhotosPickerGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.technologySpecificViews.photosPicker",
        title: "PhotosPicker",
        folder: "Technology-specific views",
        framework: .swiftUI,
        absorbedSymbols: [
            "PhotosPicker",
            "View/photosPicker(isPresented:selection:matching:preferredItemEncoding:)",
            "View/photosPicker(isPresented:selection:matching:preferredItemEncoding:photoLibrary:)",
            "View/photosPicker(isPresented:selection:maxSelectionCount:selectionBehavior:matching:preferredItemEncoding:)",
            "View/photosPicker(isPresented:selection:maxSelectionCount:selectionBehavior:matching:preferredItemEncoding:photoLibrary:)",
            "View/photosPickerAccessoryVisibility(_:edges:)",
            "View/photosPickerDisabledCapabilities(_:)",
            "View/photosPickerStyle(_:)"
        ],
        blurb: "PhotosUI picker that presents the system Photos library for selecting one or more items. Companion modifiers configure accessory visibility, disabled capabilities, and the picker style.",
        signature: "struct PhotosPicker<Label> : View where Label : View",
        availability: "macOS 13.0+",
        docPath: "Documentation/SwiftUI/technology-specific-views/photospicker(ispresented:selection:matching:preferreditemencoding:).md",
        page: { AnyView(PhotosPickerGalleryPage()) }
    )
}

#Preview {
    PhotosPickerGalleryPage().frame(width: 1100, height: 900)
}
